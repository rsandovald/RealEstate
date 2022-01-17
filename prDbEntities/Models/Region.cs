using System;
using System.Collections.Generic;

#nullable disable

namespace prDbEntities.Models
{
    public partial class Region :Entity
    {
        public Region()
        {           
            
        }

        public string Name { get; set; }
        public string Code { get; set; }
        public Guid? ParentRegionId { get; set; }

        public virtual Region ParentRegion { get; set; }      
     
    }
}
