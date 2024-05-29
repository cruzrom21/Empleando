using Datos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio.Interfaces
{
	public interface IRepository<T>
	{
		T? ObtenerPorId(int id);
		List<T>? ObtenerTodos();
		int Insertar(T entidad);
		int Actualizar(T entidad);
		ModelResponse Eliminar(int id);
	}
}
