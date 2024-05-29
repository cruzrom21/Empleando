using System;
using System.Collections.Generic;

namespace Datos;

public partial class Experience
{
    public int IdExperience { get; set; }

    public int IdData { get; set; }

    public DateTime InitDate { get; set; }

    public DateTime? FinalDate { get; set; }

    public string Company { get; set; } = null!;

    public string Description { get; set; } = null!;

    public virtual UsersDatum IdDataNavigation { get; set; } = null!;
}
