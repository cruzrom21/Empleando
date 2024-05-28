using Datos;
using Datos.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Negocio.Interfaces;

namespace ApiEmpleando.Controllers
{
    [Authorize]
    public class ProfileController : ControllerBase
    {
        IProfile _profile;

        public ProfileController(IProfile profile)
        {
            _profile = profile;
        }

        [HttpGet]
        [Route("Informacion")]
        public ModelResponse Informacion()
        {
            var userId = Int32.Parse(User.Claims.FirstOrDefault(c => c.Type == "id").Value);
            return _profile.Informacion(userId);
        }

        [HttpGet("Informacion/{userId}")]
        public ModelResponse Informacion(int userId)
        {
            return _profile.Informacion(userId);
        }

        [HttpGet]
        [Route("Habilidades")]
        public ModelResponse Habilidades()
        {
            return _profile.Habilidades();
        }

        [HttpPost]
        [Route("EditarPerfil")]
        public ModelResponse EditarPerfil([FromBody] Profile profile)
        {
            var userId = Int32.Parse(User.Claims.FirstOrDefault(c => c.Type == "id").Value);
            return _profile.EditarPerfil(userId, profile);
        }

        [HttpPost]
        [Route("CrearExperiencia")]
        public ModelResponse CrearExperiencia([FromBody] Experiencia exp)
        {
            var userId = Int32.Parse(User.Claims.FirstOrDefault(c => c.Type == "id").Value);
            return _profile.CrearExperiencia(userId, exp);
        }

        [HttpPost]
        [Route("CrearEducacion")]
        public ModelResponse CrearEducacion([FromBody] Educacion edu)
        {
            var userId = Int32.Parse(User.Claims.FirstOrDefault(c => c.Type == "id").Value);
            return _profile.CrearEducacion(userId, edu);
        }

        [HttpPost("CrearHabilidad/{skill}")]
        public ModelResponse CrearHabilidad(int skill)
        {
            var userId = Int32.Parse(User.Claims.FirstOrDefault(c => c.Type == "id").Value);
            return _profile.CrearHabilidad(userId, skill);
        }
    }
}
