using Datos.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Negocio.Interfaces;

namespace ApiEmpleando.Controllers
{
    public class HomeCompanieController : Controller
    {
        IHome _home;

        public HomeCompanieController(IHome home)
        {
            _home = home;
        }

        [HttpGet]
        [Authorize]
        [Route("CandidatosRecomendados")]
        public ModelResponse CandidatosRecomendados()
        {
            var userId = Int32.Parse(User.Claims.FirstOrDefault(c => c.Type == "id").Value);
            return _home.CandidatosRecomendados(userId);
        }

    }
}
