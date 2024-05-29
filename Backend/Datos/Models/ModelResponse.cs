using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos.Models
{
	public class ModelResponse
	{ 
		public dynamic? respuesta { get; set; }	

		public bool estado { get; set; }

		public string? mensaje { get; set; }
	}
}
