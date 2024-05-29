using Datos;
using Datos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio.Interfaces
{
	public interface IProfile
    {
		ModelResponse Informacion(int userId);
        ModelResponse EditarPerfil(int id, Profile profile);
        ModelResponse CrearExperiencia(int id, Experiencia exp);
        ModelResponse CrearEducacion(int id, Educacion edu);
        ModelResponse CrearHabilidad(int id, int skill);
        ModelResponse Habilidades();
        


    }
}
