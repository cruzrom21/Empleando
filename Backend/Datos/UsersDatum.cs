using System;
using System.Collections.Generic;

namespace Datos;

public partial class UsersDatum
{
    public int IdData { get; set; }

    public int IdTypeData { get; set; }

    public int IdUser { get; set; }

    public string Value { get; set; } = null!;

    public DateTime CreateDate { get; set; }

    public DateTime ModifyDate { get; set; }

    public virtual ICollection<Education> Educations { get; set; } = new List<Education>();

    public virtual ICollection<Experience> Experiences { get; set; } = new List<Experience>();

    public virtual TypeDatum IdTypeDataNavigation { get; set; } = null!;

    public virtual User IdUserNavigation { get; set; } = null!;
}
