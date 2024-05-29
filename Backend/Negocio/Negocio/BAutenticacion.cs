using Datos;
using Datos.Models;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using Negocio.Interfaces;
using System.Configuration;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace Negocio.Negocio
{
    public class BAutenticacion : IAutenticacion
    {
        private DbEmpleandoContext _db;
        private readonly ConfigJwt _jwt;
        private readonly IRepository<User> _repository;

        public BAutenticacion(DbEmpleandoContext dbContext, IOptions<ConfigJwt> jwt, IRepository<User> repository)
        {
            _db = dbContext;
            _jwt = jwt.Value;
            _repository = repository;
        }

        public ModelResponse InicioSesion(User user)
        {
            ModelResponse response;

            try
            {
                User? userExist = _db.Users.Where(x => x.Email == user.Email).FirstOrDefault();
                bool passwordExist = userExist != null ? BCrypt.Net.BCrypt.Verify(user.Password, userExist.Password) : false;

                if (userExist != null && passwordExist)
                {
                    string tokenCreado = Token(userExist);

                    response = new ModelResponse()
                    {
                        respuesta = tokenCreado,
                        estado = true,
                        mensaje = "Inicio de sesion exitoso."
                    };
                }
                else
                {
                    response = new ModelResponse()
                    {
                        respuesta = "Error",
                        estado = false,
                        mensaje = "Usuario no existe en la base de datos."
                    };
                }

                return response;
            }
            catch (Exception ex)
            {
                response = new ModelResponse()
                {
                    respuesta = "Error",
                    estado = false,
                    mensaje = "Ocurrio un error al ejecutar el proceso " + ex.Message
                };

                return response;
            }
        }


        public ModelResponse Registrar(User user)
        {
            ModelResponse response;

            try
            {
                User? userExist = _db.Users.Where(x => x.Email == user.Email).FirstOrDefault();

                if (userExist == null)
                {
                    // Crear usuario
                    string hashedPassword = BCrypt.Net.BCrypt.HashPassword(user.Password);
                    user.Password = hashedPassword;

                    user.CreateDate = DateTime.Now;
                    user.ModifyDate = DateTime.Now;
                    
                    _repository.Insertar(user);

                    // Iniciar sesion
                    string tokenCreado = Token(user);

                    response = new ModelResponse()
                    {
                        respuesta = tokenCreado,
                        estado = true,
                        mensaje = "Usuario creado con exito."
                    };
                }
                else
                {
                    response = new ModelResponse()
                    {
                        respuesta = "Error",
                        estado = false,
                        mensaje = "Usuario ya existe."
                    };
                }

                return response;
            }
            catch (Exception ex)
            {
                response = new ModelResponse()
                {
                    respuesta = "Error",
                    estado = false,
                    mensaje = "Ocurrio un error al ejecutar el proceso " + ex.Message
                };

                return response;
            }
        }



        private string Token(User userExist)
        {
            try
            {
                var keybytes = Encoding.UTF8.GetBytes(_jwt.secretkey);

                var claims = new ClaimsIdentity();
                claims.AddClaim(new Claim(JwtRegisteredClaimNames.Sub, _jwt.Subject));
                claims.AddClaim(new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()));
                claims.AddClaim(new Claim("id", userExist.IdUser.ToString()));
                claims.AddClaim(new Claim("Rol", userExist.IdTypeUser.ToString()));

                var tokenDescriptor = new SecurityTokenDescriptor
                {
                    Subject = claims,
                    Expires = DateTime.UtcNow.AddHours(10),
                    SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(keybytes), SecurityAlgorithms.HmacSha256)
                };

                var tokenHandler = new JwtSecurityTokenHandler();
                var tokenConfig = tokenHandler.CreateToken(tokenDescriptor);

                string tokenCreado = tokenHandler.WriteToken(tokenConfig);

                return tokenCreado;
            }
            catch (Exception ex)
            {
                throw;
            }
        }


    }
}