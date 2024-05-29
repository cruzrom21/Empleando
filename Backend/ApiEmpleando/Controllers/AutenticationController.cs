using Microsoft.AspNetCore.Mvc;
using Datos;
using Datos.Models;
using Negocio.Interfaces;

namespace ApiJWTPolitecnica.Controllers
{
	public class AutenticationController : Controller
	{
		IAutenticacion _autenticacion;
		
		public AutenticationController(IAutenticacion autenticacion)
		{
			_autenticacion = autenticacion;
		}


		[HttpPost]
		[Route("IniciarSesion")]
		public ModelResponse IniciarSesion([FromBody] User user)
		{
            return _autenticacion.InicioSesion(user);
		}


        [HttpPost]
        [Route("Registrar")]
        public ModelResponse Registrar([FromBody] User user)
        {
            return _autenticacion.Registrar(user);
        }


    }
}
