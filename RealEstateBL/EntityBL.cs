using AutoMapper;
using prDbEntities.Models;
using prMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstateBL
{
    public class EntityBL
    {
        protected IMapper mapper;
       
        public EntityBL () //TODO: INYECCION DE DEP
        {
            var mapperConfig = new MapperConfiguration(m =>
            {
                m.AddProfile(new AutoMapperProfiles());
            }
            );

            this.mapper = mapperConfig.CreateMapper();
           
        }

     
        public Guid getGuid ()
        {
            return Guid.NewGuid(); 
        }

    }
}
