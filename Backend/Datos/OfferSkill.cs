using System;
using System.Collections.Generic;

namespace Datos;

public partial class OfferSkill
{
    public int IdOfferSkills { get; set; }

    public int? IdOffer { get; set; }

    public int? IdSkills { get; set; }

    public virtual Offer? IdOfferNavigation { get; set; }

    public virtual Skill? IdSkillsNavigation { get; set; }
}
