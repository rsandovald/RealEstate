using System;
using System.Collections.Generic;

#nullable disable

namespace prDbEntities.Models
{
    public partial class Person : Entity
    {
        public Person()
        {
        }
            
        public string Name { get; set; }
        public string Photo { get; set; }
        public DateTime? BirthDay { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public Guid? RegionId { get; set; }

        public virtual Region Region { get; set; }
    }
      
}
