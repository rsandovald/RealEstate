using prDbEntities.Models;
using prDTO;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace prDataAccess
{
    public interface IPropertyRepository
    {
        public string connectionString { get; set; }
        Task <List<PropertyDTO>> PropertyBasicGet(PropertyBasicGetDTO propertyBasicGetDTO);
        Task <List<PropertyImage>> PropertyImageFindByPropertyId(Guid PropertyId);
        Task<bool> PropertyImageInsert(PropertyImageInsertDTO propertyImageInsertDTO);
        Task<bool> PropertyInsert(PropertyAddUpdateDTO propertyAddUpdateDTO);
        Task<bool> PropertyUpdate(PropertyAddUpdateDTO propertyAddUpdateDTO);
    }
}