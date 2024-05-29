using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos.Models
{
    public  class CandidatosPorOferta
    {

        [Key]
        public int IdData { get; set; }

        public int IdTypeData { get; set; }

        public int IdUser { get; set; }

        public string Value { get; set; } = null!;

        public DateTime CreateDate { get; set; }

        public DateTime ModifyDate { get; set; }

        public string Type { get; set; }
        
    }
}
