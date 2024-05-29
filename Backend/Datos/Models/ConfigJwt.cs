using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos.Models
{
	public class ConfigJwt
	{
		public ConfigJwt()
		{
		}

		public string secretkey { get; set; }

		public string Subject { get; set; }

	}
}
