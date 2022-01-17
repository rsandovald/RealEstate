using System;
using System.Collections.Generic;

#nullable disable

namespace prDbEntities.Models
{
    public partial class Property : Entity
    {
        public Property()
        {           
            PropertyImages = new List<PropertyImage>();
            this.Owner = new Person();
            this.Region = new Region(); 
        }       
        public string Code { get; set; }
        public decimal Price { get; set; }
        public int Year { get; set; }  
        public string Address { get; set; }     

        public virtual Person Owner { get; set; }
        public virtual Region Region { get; set; }
        
        public virtual IList<PropertyImage> PropertyImages { get; set; }
       
    }
}
