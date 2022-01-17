using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prDbEntities.Models
{
    public class PropertyInsertOrUpdateSP
    {
        public PropertyInsertOrUpdateSP()
        {
         
        }
        public Guid? Id { get; set; }
        public string Code { get; set; }
        public decimal Price { get; set; }
        public int Year { get; set; }
        public string Address { get; set; }
        public Guid? OwnerId { get; set; }
        public Guid? RegionId { get; set; }
        public bool IsDeleted { get; set; }
        public string UserEmail { get; set; }


    }
}
