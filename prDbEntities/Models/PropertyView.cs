using System;
using System.Collections.Generic;

#nullable disable

namespace prDbEntities.Models
{
    public partial class PropertyView :Entity
    {   
        public string Code { get; set; }
        public decimal Price { get; set; }
        public int Year { get; set; }
        public Guid OwnerId { get; set; }     
        public string Address { get; set; }
        public Guid RegionId { get; set; }
        public string OwnerName { get; set; }
        public string OwnerEmail { get; set; }
        public string OwnerPhone { get; set; }
        public string RegionName { get; set; }
        public string RegionCode { get; set; }
    }
}
