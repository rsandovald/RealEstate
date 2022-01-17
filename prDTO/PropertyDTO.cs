using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prDTO
{
    public class PropertyDTO
    {
        public PropertyDTO ()
        {
            this.Owner = new PersonDTO ();
            this.Region = new RegionDTO () ; 
        }
        public string Code { get; set; }
        public decimal Price { get; set; }
        public int Year { get; set; }
        public string Address { get; set; }

        public virtual PersonDTO Owner { get; set; }
        public virtual RegionDTO Region { get; set; }
        
        public virtual IList<PropertyImageDTO> PropertyImages { get; set; }
    }
}
