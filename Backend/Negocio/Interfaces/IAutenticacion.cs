using Datos;
using Datos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio.Interfaces
{
	public interface IAutenticacion
	{
		ModelResponse InicioSesion(User user);
		ModelResponse Registrar(User user);
    }
}
