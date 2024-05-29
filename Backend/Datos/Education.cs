using System;
using System.Collections.Generic;

namespace Datos;

public partial class Education
{
    public int IdEducation { get; set; }

    public int IdData { get; set; }

    public DateTime InitDate { get; set; }

    public DateTime? FinalDate { get; set; }

    public string Institute { get; set; } = null!;

    public virtual UsersDatum IdDataNavigation { get; set; } = null!;
}
