using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos.Models
{
    public class OfertasPorUsuario
    {
        [Key]
        public int IdOffer { get; set; }

        public int IdUser { get; set; }

        public string Title { get; set; } = null!;

        public string Description { get; set; } = null!;

        public string? Location { get; set; }

        public string TypeContract { get; set; } = null!;

        public string? Salary { get; set; }

        public DateTime ExpirationDate { get; set; }

        public DateTime CreateDate { get; set; }

        public DateTime ModifyDate { get; set; }

        public string Company { get; set; } = null!;
    }
}
