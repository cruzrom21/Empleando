using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos.Models
{
    public class Educacion
    {
        public string Titulo { get; set; }
        public string Institute { get; set; }
        public DateTime InitDate { get; set; }
        public DateTime? FinalDate { get; set; }

    }
}
