using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prDTO
{
    public class PropertyAddUpdateDTO
    { 
        public string Code { get; set; }
        public decimal? Price{ get; set; }       
        public int? Year { get; set; }
        public string?  Address { get; set; }
        public  PersonDTO? Owner { get; set; }
        public  RegionDTO? Region { get; set; }
        [Required]
        public string CurrentUserEmail { get; set; }

    }
}
