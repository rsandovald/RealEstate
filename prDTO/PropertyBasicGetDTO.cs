using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prDTO
{
    public class PropertyBasicGetDTO
    {
        public PropertyBasicGetDTO ()
        {
            this.PriceGreaterThan = 0;
            this.PriceLessThan = 99999999;
            this.YearGreatherThan = 0;
            this.YearLessThan = 9999; 

        }        
        public string? Code { get; set; }
              
        public decimal? PriceGreaterThan { get; set; }
        public decimal? PriceLessThan { get; set; }
        
        public int? YearGreatherThan { get; set; }
        public int? YearLessThan { get; set; }
        public string? OwnerEmail { get; set; }
        public string? RegionCode { get; set; }

    }
}
