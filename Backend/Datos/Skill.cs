using System;
using System.Collections.Generic;

namespace Datos;

public partial class Skill
{
    public int IdSkills { get; set; }

    public string Skill1 { get; set; } = null!;

    public virtual ICollection<OfferSkill> OfferSkills { get; set; } = new List<OfferSkill>();

    public virtual ICollection<UserSkill> UserSkills { get; set; } = new List<UserSkill>();
}
