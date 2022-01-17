using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using prDTO;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication.JwtBearer;

namespace RealEstateWebAPI.Controllers
{
    [Route("api/UserAccount")]
    [ApiController]
    public class UserAccountController : ControllerBase
    {
        private readonly UserManager<IdentityUser> userManager;
        private readonly SignInManager<IdentityUser> signInManager;
        private readonly IConfiguration configuration;
        //private readonly ApplicationDbContext context;
        //private readonly IMapper mapper;

        public UserAccountController(UserManager<IdentityUser> userManager,
           SignInManager<IdentityUser> signInManager,
           IConfiguration configuration)
        //ApplicationDbContext context,
        //IMapper mapper
        //)
        {
            this.userManager = userManager;
            this.signInManager = signInManager;
            this.configuration = configuration;
            //this.context = context;
            //this.mapper = mapper;
        }


        [HttpPost("create")]
        public async Task<ActionResult<AuthenticationTokenDTO>> Create([FromBody] UserCredentialDTO userCredentialDTO)
        {
            var usuario = new IdentityUser { UserName = userCredentialDTO.Email, Email = userCredentialDTO.Email };
            var resultado = await userManager.CreateAsync(usuario, userCredentialDTO.Password);

            if (resultado.Succeeded)
            {
                return await BuildToken(userCredentialDTO);
            }
            else
            {
                return BadRequest(resultado.Errors);
            }
        }

        [HttpPost("login")]
        public async Task<ActionResult<AuthenticationTokenDTO>> Login([FromBody] UserCredentialDTO userCredentialDTO)
        {
            var resultado = await signInManager.PasswordSignInAsync(userCredentialDTO.Email, userCredentialDTO.Password,
                isPersistent: false, lockoutOnFailure: false);

            if (resultado.Succeeded)
            {
                return await BuildToken(userCredentialDTO);
            }
            else
            {
                return BadRequest("Login incorrecto");
            }
        }

        private async Task<AuthenticationTokenDTO> BuildToken(UserCredentialDTO credenciales)
        {
            var claims = new List<Claim>()
            {
                new Claim("email", credenciales.Email)
            };

            var usuario = await userManager.FindByEmailAsync(credenciales.Email);
            var claimsDB = await userManager.GetClaimsAsync(usuario);

            claims.AddRange(claimsDB);

            var llave = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration["llavejwt"])); // TODO: 
            var creds = new SigningCredentials(llave, SecurityAlgorithms.HmacSha256);

            var expiracion = DateTime.UtcNow.AddYears(1); //TODO: 

            var token = new JwtSecurityToken(issuer: null, audience: null, claims: claims,
                expires: expiracion, signingCredentials: creds);

            return new AuthenticationTokenDTO()
            {
                Token = new JwtSecurityTokenHandler().WriteToken(token),
                Expiration = expiracion
            };
        }     

        [HttpPost("SetupAsAdmin")]
       // [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Policy = "IsAdmin")]
        public async Task<ActionResult> SetupAsAdmin([FromBody] string userId)
        {
            var usuario = await userManager.FindByIdAsync(userId);
            await userManager.AddClaimAsync(usuario, new Claim("role", "admin"));
            return NoContent();
        }
    }
}
      