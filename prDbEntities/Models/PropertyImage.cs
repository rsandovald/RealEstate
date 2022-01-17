using System;
using System.Collections.Generic;

#nullable disable

namespace prDbEntities.Models
{
    public partial class PropertyImage: Entity
    {       
        public string File { get; set; }
        public Guid PropertyId { get; set; }
      
    }
}
