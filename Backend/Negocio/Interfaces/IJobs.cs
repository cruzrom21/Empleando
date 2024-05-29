using Datos;
using Datos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio.Interfaces
{
	public interface IJobs
	{
		ModelResponse EmpleoDetalle(int id);
		ModelResponse Buscar(string clave);
        ModelResponse Aplicar(int idOffer, int idUser);
        ModelResponse MisOfertas(int idUser);       
        ModelResponse CrearOferta(int idUser, CrearOferta offer);
        ModelResponse ListarCandidatos(int idOferta);
        ModelResponse EliminarOferta(int idOferta);
        ModelResponse BuscarCandidato(string clave);


    }
}
