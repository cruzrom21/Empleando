using System;
using System.Collections.Generic;

namespace Datos;

public partial class TypeDatum
{
    public int IdTypeData { get; set; }

    public string Type { get; set; } = null!;

    public virtual ICollection<UsersDatum> UsersData { get; set; } = new List<UsersDatum>();
}
