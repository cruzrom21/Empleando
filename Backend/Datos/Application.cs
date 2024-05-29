using System;
using System.Collections.Generic;

namespace Datos;

public partial class Application
{
    public int IdAplications { get; set; }

    public int IdOffer { get; set; }

    public int IdUser { get; set; }

    public DateTime ApplicationDate { get; set; }

    public int State { get; set; }

    public DateTime CreateDate { get; set; }

    public DateTime ModifyDate { get; set; }

    public virtual Offer IdOfferNavigation { get; set; } = null!;

    public virtual User IdUserNavigation { get; set; } = null!;
}
