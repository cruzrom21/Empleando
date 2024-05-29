using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace Datos;

public partial class User
{
    public int IdUser { get; set; }

    public int IdTypeUser { get; set; }

    public string Email { get; set; } = null!;

    public string Password { get; set; } = null!;

    public DateTime? CreateDate { get; set; }

    public DateTime? ModifyDate { get; set; }

    public virtual ICollection<Application> Applications { get; set; } = new List<Application>();

    public virtual TypeUser IdTypeUserNavigation { get; set; } = null!;

    public virtual ICollection<Offer> Offers { get; set; } = new List<Offer>();

    public virtual ICollection<UserSkill> UserSkills { get; set; } = new List<UserSkill>();

    public virtual ICollection<UsersDatum> UsersData { get; set; } = new List<UsersDatum>();
}
