using Datos.Models;
using Datos;
using Microsoft.AspNetCore.Mvc;
using Negocio.Interfaces;
using Microsoft.AspNetCore.Authorization;
using System.Security.Claims;

namespace ApiEmpleando.Controllers
{
    public class HomeEmployeeController : Controller
    {
        IHome _home;

        public HomeEmployeeController(IHome home)
        {
            _home = home;
        }

        [HttpGet]
        [Route("ListarEmpleos")]
        public ModelResponse ListarEmpleos()
        {
            return _home.ListarEmpleos();
        }

        [HttpGet]
        [Route("ListarEmpresas")]
        public ModelResponse ListarEmpresas()
        {
            return _home.ListarEmpresas();
        }

        [HttpGet]
        [Authorize]
        [Route("ListarEmpleosSesion")]
        public ModelResponse ListarEmpleosSesion()
        {
            var userId = Int32.Parse(User.Claims.FirstOrDefault(c => c.Type == "id").Value);
            return _home.ListarEmpleosSesion(userId);
        }

        [HttpGet]
        [Authorize]
        [Route("TieneData")]
        public ModelResponse TieneData()
        {
            var userId = Int32.Parse(User.Claims.FirstOrDefault(c => c.Type == "id").Value);
            return _home.TieneData(userId);
        }
    }
}
