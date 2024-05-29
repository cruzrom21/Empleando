using System;
using System.Collections.Generic;

namespace Datos;

public partial class TypeUser
{
    public int IdTypeUser { get; set; }

    public string Type { get; set; } = null!;

    public virtual ICollection<User> Users { get; set; } = new List<User>();
}
