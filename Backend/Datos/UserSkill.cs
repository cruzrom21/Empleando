using System;
using System.Collections.Generic;

namespace Datos;

public partial class UserSkill
{
    public int IdUserSkills { get; set; }

    public int IdUser { get; set; }

    public int IdSkills { get; set; }

    public virtual Skill IdSkillsNavigation { get; set; } = null!;

    public virtual User IdUserNavigation { get; set; } = null!;
}
