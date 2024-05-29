using Datos;
using Datos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio.Interfaces
{
	public interface IHome
    {
		ModelResponse ListarEmpleos();
		ModelResponse ListarEmpresas();
        ModelResponse ListarEmpleosSesion(int userId);
        ModelResponse CandidatosRecomendados(int userId);
        ModelResponse TieneData(int userId);
    }
}
