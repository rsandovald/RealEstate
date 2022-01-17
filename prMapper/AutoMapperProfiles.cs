using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using prDbEntities.Models;
using prDTO; 

namespace prMapper
{
    public class AutoMapperProfiles : Profile
    {
        public AutoMapperProfiles()
        {
            CreateMap<PropertyView, Property>()
                .ForPath(d => d.Owner.Id, opt => opt.MapFrom(src => src.OwnerId))
                .ForPath(d => d.Owner.Name, opt => opt.MapFrom(src => src.OwnerName))
                .ForPath(d => d.Owner.Phone, opt => opt.MapFrom(src => src.OwnerPhone))
                .ForPath(d => d.Owner.Email, opt => opt.MapFrom(src => src.OwnerEmail))
                .ForPath(d => d.Region.Id, opt => opt.MapFrom(src => src.RegionId))
                .ForPath(d => d.Region.Name, opt => opt.MapFrom(src => src.RegionName));

            CreateMap<PropertyAddUpdateDTO, Property>()
                 .ForPath(d => d.Owner.Email, opt => opt.MapFrom(src => src.Owner.Email)) 
                 .ForPath(d => d.Region.Code, opt => opt.MapFrom(src => src.Region.Code));

            CreateMap<Property, PropertyInsertOrUpdateSP>()
                .ForPath(d => d.RegionId, opt => opt.MapFrom(src => src.Region.Id))
                .ForPath(d => d.OwnerId, opt => opt.MapFrom(src => src.Owner.Id));

            CreateMap<PropertyImage, PropertyImageInsertSP>();


            CreateMap<Property, PropertyDTO>();
            CreateMap<Region, RegionDTO>();
            CreateMap<PropertyImage, PropertyImageDTO>(); 
            CreateMap<Person, PersonDTO>(); 
              
        }
    }
}
