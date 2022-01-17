using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prDTO
{
    public class PropertyImageInsertDTO
    {
        [Required]
        public IFormFile Image { get; set; }

        [Required]
        public string PropertyCode { get; set; }

        public string ImagePath { get; set; }
        [Required]
        public string CurrentUserEmail { get; set; }
    }
}
