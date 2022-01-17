using Microsoft.AspNetCore.Mvc;
using prDTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using prDataAccess;
using prImageUtility;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using System.Security.Claims;
using Microsoft.AspNetCore.Http;

namespace RealEstateWebAPI.Controllers
{
    [ApiController]
    [Microsoft.AspNetCore.Mvc.Route("api/property")]
   // [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Policy = "IsAdmin")]
    public class PropertyController : ControllerBase
    {
        private readonly IPropertyRepository mPropertyRepository;
        private readonly IAlmacenadorArchivos mAlmacenadorArchivos;
        private readonly string contenedor = "realestateeducativo";

        public PropertyController (IPropertyRepository propertyRepository,  IAlmacenadorArchivos almacenadorArchivos)
        {
            this.mPropertyRepository = propertyRepository;
            this.mAlmacenadorArchivos = almacenadorArchivos;         
        }

        [HttpPost]
        public async Task<ActionResult> Post([FromBody] PropertyAddUpdateDTO propertyAddUpdateDTO)
        {
            try
            {
                await this.mPropertyRepository.PropertyInsert(propertyAddUpdateDTO);
                return  Ok();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [HttpPut]
        public async Task<ActionResult> Put([FromBody] PropertyAddUpdateDTO propertyAddUpdateDTO)
        {
            await this.mPropertyRepository.PropertyUpdate(propertyAddUpdateDTO);
            return Ok();
        }

        [HttpGet]
        public async Task<ActionResult<List<PropertyDTO>>> Get([FromQuery] PropertyBasicGetDTO propertyBasicGetDTO)
        {
            return  await this.mPropertyRepository.PropertyBasicGet(propertyBasicGetDTO);          
        }

        
        [HttpPost]
        [Route("propertyImage")]
        public async Task<ActionResult> PostImage([FromForm] PropertyImageInsertDTO propertyImageInsertDTO)
        {
            if (propertyImageInsertDTO.Image != null)
            {
                propertyImageInsertDTO.ImagePath = await this.mAlmacenadorArchivos.GuardarArchivo(this.contenedor, propertyImageInsertDTO.Image);
                await this.mPropertyRepository.PropertyImageInsert(propertyImageInsertDTO);
                return Ok();
            }
            else
            {
                return BadRequest(); 
            }         
        }        
    }
}
