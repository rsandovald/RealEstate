using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prDbEntities.Models
{
    public class PropertyImageInsertSP
    {
        public Guid Id { get; set; }
        public string File { get; set; }
        public Guid PropertyId { get; set; }

        public string UserEmail { get; set; }
    }
}
