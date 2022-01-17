using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using prMapper;

namespace prDataAccess
{
    public class EntityRepository
    {
        protected IMapper mapper;

        public EntityRepository() //TODO: INYECCION DE DEP
        {
            var mapperConfig = new MapperConfiguration(m =>
            {
                m.AddProfile(new AutoMapperProfiles());
            }
            );

            this.mapper = mapperConfig.CreateMapper();

        }

        public Guid getGuid()
        {
            return Guid.NewGuid();
        }
    }
}
