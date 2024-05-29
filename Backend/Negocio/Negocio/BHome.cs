using Datos;
using Datos.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Negocio.Interfaces;
using System.Net.Http;
using System.Security.Claims;

namespace Negocio.Negocio
{
    public class BHome : IHome
    {
        private DbEmpleandoContext _db;
        private readonly ConfigJwt _jwt;
        private readonly IRepository<CompanyOffer> _repository;

        public BHome(DbEmpleandoContext dbContext, IOptions<ConfigJwt> jwt, IRepository<CompanyOffer> repository)
        {
            _db = dbContext;
            _jwt = jwt.Value;
            _repository = repository;
        }

        public ModelResponse ListarEmpleos()
        {
            ModelResponse response;

            try
            {
                List<CompanyOffer>? offers = _repository.ObtenerTodos();

                if (offers != null)
                {
                    offers = offers?.OrderByDescending(x => x.CreateDate).Take(3).ToList();

                    response = new ModelResponse()
                    {
                        respuesta = offers,
                        estado = true,
                        mensaje = ""
                    };
                }
                else
                {
                    response = new ModelResponse()
                    {
                        respuesta = "Error",
                        estado = false,
                        mensaje = "No se encontraron ofertas."
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

        public ModelResponse ListarEmpresas()
        {                                                     
            ModelResponse response;

            try
            {
                var userdata = (from ud in _db.UsersData
                                join u in _db.Users on ud.IdUser equals u.IdUser
                                join t in _db.TypeData on ud.IdTypeData equals t.IdTypeData
                                where u.IdTypeUser == 1
                                select new
                                {
                                    IdUser = ud.IdUser,
                                    Type = t.Type,
                                    Value = ud.Value,
                                }).ToList();

                if (userdata.Count() > 0)
                {
                    response = new ModelResponse()
                    {
                        respuesta = userdata,
                        estado = true,
                        mensaje = ""
                    };
                }
                else
                {
                    response = new ModelResponse()
                    {
                        respuesta = "Error",
                        estado = false,
                        mensaje = "No se encontraron ofertas."
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


        public ModelResponse ListarEmpleosSesion(int userId)
        {
            ModelResponse response;
            try
            {
                var userIdParameter = new SqlParameter("@UserId", userId);
                List<OfertasPorUsuario>? offers = _db.Database.SqlQueryRaw<OfertasPorUsuario>("EXEC SP_OfertasPorUsuario @UserId", userIdParameter).ToList();

                if (offers != null)
                {
                    offers = offers?.Take(3).ToList();

                    response = new ModelResponse()
                    {
                        respuesta = offers,
                        estado = true,
                        mensaje = ""
                    };
                }
                else
                {
                    response = new ModelResponse()
                    {
                        respuesta = "Error",
                        estado = false,
                        mensaje = "No se encontraron ofertas."
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


        public ModelResponse CandidatosRecomendados(int userId)
        {
            ModelResponse response;
            try
            {
                var userIdParameter = new SqlParameter("@UserId", userId);
                var candidates = _db.Database.SqlQueryRaw<CandidatosPorOferta>("EXEC SP_CandidatosPorOferta @UserId", userIdParameter).AsEnumerable().Select(x => new
                {
                    IdUser = x.IdUser,
                    Type = x.Type.Replace(" ", ""),
                    Value = x.Value,
                }).ToList();

                if (candidates.Count > 0)
                {
                    response = new ModelResponse()
                    {
                        respuesta = candidates,
                        estado = true,
                        mensaje = ""
                    };
                }
                else
                {
                    response = new ModelResponse()
                    {
                        respuesta = "Error",
                        estado = false,
                        mensaje = "No se encontraron candidatos. Crea una oferta para encontrar los candidatos que mas se acomoden al puesto."
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

        public ModelResponse TieneData(int userId)
        {
            ModelResponse response;
            try
            {
                List<UsersDatum> usersDatum = _db.UsersData.Where(x => x.IdUser == userId).ToList();

                if (usersDatum.Count > 0)
                {
                    response = new ModelResponse()
                    {
                        respuesta = usersDatum.Count,
                        estado = true,
                        mensaje = ""
                    };
                }
                else
                {
                    response = new ModelResponse()
                    {
                        respuesta = "Error",
                        estado = false,
                        mensaje = "No se encontraron candidatos. Crea una oferta para encontrar los candidatos que mas se acomoden al puesto."
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


    }
}