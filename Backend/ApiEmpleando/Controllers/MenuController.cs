using Datos.Models;
using Microsoft.AspNetCore.Mvc;
using Negocio.Interfaces;

namespace ApiEmpleando.Controllers
{
    public class MenuController : Controller
    {
        IMenu _menu;

        public MenuController(IMenu menu)
        {
            _menu = menu;
        }

        [HttpGet]
        [Route("Menu")]
        public ModelResponse Menu()
        {
            var claim = User.Claims.FirstOrDefault(c => c.Type == "id");
            int idUser = claim != null ? int.Parse(claim.Value) : 0;

            return _menu.Menu(idUser);
        }
    }
}
