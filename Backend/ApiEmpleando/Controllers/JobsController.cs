using Datos;
using Datos.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Negocio.Interfaces;
using Negocio.Negocio;

namespace ApiEmpleando.Controllers
{
    public class JobsController : Controller
    {
        IJobs _job;

        public JobsController(IJobs home)
        {
            _job = home;
        }

        // Empleados
        [HttpGet("EmpleoDetalle/{id}")]
        public ModelResponse EmpleoDetalle(int id)
        {
            return _job.EmpleoDetalle(id);
        }


        [HttpGet("Buscar/{clave}")]
        public ModelResponse Buscar(string clave)
        {
            return _job.Buscar(clave);
        }


        [Authorize]
        [HttpPost("Aplicar/{idOffer}")]
        public ModelResponse Aplicar(int idOffer)
        {
            var userId = Int32.Parse(User.Claims.FirstOrDefault(c => c.Type == "id")!.Value);
            return _job.Aplicar(idOffer, userId);
        }


        // Empleador
        [Authorize]
        [HttpGet]
        [Route("MisOfertas")]
        public ModelResponse MisOfertas()
        {
            var userId = Int32.Parse(User.Claims.FirstOrDefault(c => c.Type == "id")!.Value);
            return _job.MisOfertas(userId);
        }

        [Authorize]
        [HttpPost]
        [Route("CrearOferta")]
        public ModelResponse CrearOferta([FromBody] CrearOferta offer)
        {
            var userId = Int32.Parse(User.Claims.FirstOrDefault(c => c.Type == "id")!.Value);
            return _job.CrearOferta(userId, offer);
        }

        [Authorize]
        [HttpGet("ListarCandidatos/{idOffer}")]
        public ModelResponse ListarCandidatos(int idOffer)
        {
            return _job.ListarCandidatos(idOffer);
        }


        [Authorize]
        [HttpDelete("EliminarOferta/{idOffer}")]
        public ModelResponse EliminarOferta(int idOffer)
        {
            return _job.EliminarOferta(idOffer);
        }

        [Authorize]
        [HttpGet("BuscarCandidato/{clave}")]
        public ModelResponse BuscarCandidato(string clave)
        {
            return _job.BuscarCandidato(clave);
        }



    }
}
