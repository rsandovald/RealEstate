using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prDTO
{
    public class AuthenticationTokenDTO
    {
        public string Token { get; set; }
        public DateTime Expiration { get; set; }
    }
}
