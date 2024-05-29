using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos.Models
{
    public class Experiencia
    {
        public string Cargo { get; set; }
        public string Company { get; set; }
        public DateTime InitDate { get; set; }
        public DateTime? FinalDate { get; set; }
        public string Description { get; set; }
    }
}
