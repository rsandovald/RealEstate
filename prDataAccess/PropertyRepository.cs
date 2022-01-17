using System;
using System.Collections.Generic;
using prDbEntities.Models;
using prDTO;
using prDataAccess.Dapper;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;

namespace prDataAccess
{
    public class PropertyRepository : EntityRepository, IPropertyRepository
    {
        const string spPersonFindByEmail = "RealEstate.PersonFindByEmail";
        const string spRegionFindByCode = "RealEstate.RegionFindByCode";
        const string spPropertyInsert = "RealEstate.PropertyInsert";
        const string spPropertyUpdate = "RealEstate.PropertyUpdate";
        const string spPropertyViewSelect = "RealEstate.PropertyViewSelect";
        const string spPropertyImageInsert = "RealEstate.PropertyImageInsert";
        const string spPropertyImageFindByPropertyId = "RealEstate.PropertyImageFindByPropertyId";

        public PropertyRepository ()
        {
        }
        public PropertyRepository (IConfiguration configuration)
        {
            this.connectionString = configuration.GetConnectionString("RealEstateDB");
        }

        public string connectionString { get; set; }
        public async Task <bool>  PropertyInsert(PropertyAddUpdateDTO propertyAddUpdateDTO)
        {
            Person person;
            Region region;

            Property property = this.mapper.Map<Property>(propertyAddUpdateDTO);
            DapperDataAccess<Person> repPerson = new DapperDataAccess<Person>(this.connectionString);


            if (string.IsNullOrEmpty(property.Owner.Email))
            {
                throw new System.Exception();
            }

            person = await repPerson.GetFirst(new { Email = property.Owner.Email }, spPersonFindByEmail);

            if (person == null)
            {
                throw new System.Exception();
            }
            else
            {
                property.Owner = person;
            }

            if (string.IsNullOrEmpty(property.Region.Code))
            {
                throw new System.Exception();
            }

            DapperDataAccess<Region> repRegion = new DapperDataAccess<Region>(this.connectionString);
            region = await repRegion.GetFirst(new { Code = property.Region.Code }, spRegionFindByCode);

            if (region == null)
            {
                throw new System.Exception();
            }
            else
            {
                property.Region = region;
            }

            property.Id = this.getGuid();

            PropertyInsertOrUpdateSP spParameters = this.mapper.Map<PropertyInsertOrUpdateSP>(property);
            spParameters.UserEmail = propertyAddUpdateDTO.CurrentUserEmail;

            DapperDataAccess<Property> repProperty = new DapperDataAccess<Property>(this.connectionString);
            await repProperty.InsertUpdate(spParameters, spPropertyInsert);

            return true; 
        }

        public async Task<bool> PropertyUpdate(PropertyAddUpdateDTO propertyAddUpdateDTO)
        {
            Person person;
            Region region;

            Property property = this.mapper.Map<Property>(propertyAddUpdateDTO);
            DapperDataAccess<Person> repPerson = new DapperDataAccess<Person>(this.connectionString);


            if (!string.IsNullOrEmpty(property.Owner.Email))
            {
                person = await repPerson.GetFirst(new { Email = property.Owner.Email }, spPersonFindByEmail);

                if (person == null)
                {
                    throw new System.Exception();
                }
                else
                {
                    property.Owner = person;
                }
            }

            if (!string.IsNullOrEmpty(property.Region.Code))
            {
                DapperDataAccess<Region> repRegion = new DapperDataAccess<Region>(this.connectionString);
                region = await repRegion.GetFirst(new { Code = property.Region.Code }, spRegionFindByCode);

                if (region == null)
                {
                    throw new System.Exception();
                }
                else
                {
                    property.Region = region;
                }
            }

            PropertyInsertOrUpdateSP spParameters = this.mapper.Map<PropertyInsertOrUpdateSP>(property);
            spParameters.UserEmail = propertyAddUpdateDTO.CurrentUserEmail;
            DapperDataAccess<Property> repProperty = new DapperDataAccess<Property>(this.connectionString);
            await repProperty.InsertUpdate(spParameters, spPropertyUpdate);
            return true; 
        }

        public async Task <List<PropertyDTO>> PropertyBasicGet(PropertyBasicGetDTO propertyBasicGetDTO)
        {
            DapperDataAccess<PropertyView> repProperty = new DapperDataAccess<PropertyView>(this.connectionString);
            var propertyViewList = await repProperty.Get(propertyBasicGetDTO, spPropertyViewSelect);

            List<Property> propertyList = this.mapper.Map<List<Property>>(propertyViewList);

            foreach (Property property in propertyList)
            {
                property.PropertyImages = await this.PropertyImageFindByPropertyId((Guid)property.Id);
            }

            List<PropertyDTO> propertyDTOList = this.mapper.Map<List<PropertyDTO>>(propertyList);

            return propertyDTOList;
        }

        public async Task <bool> PropertyImageInsert(PropertyImageInsertDTO propertyImageInsertDTO)
        {
            DapperDataAccess<PropertyView> repProperty = new DapperDataAccess<PropertyView>(this.connectionString);

            var property = await  repProperty.GetFirst(new { Code = propertyImageInsertDTO.PropertyCode }, spPropertyViewSelect);

            if (property is null)
            {
                throw new Exception();
            }

            PropertyImage propertyImage = new PropertyImage()
            {
                Id = this.getGuid(),
                File = propertyImageInsertDTO.ImagePath,
                PropertyId = (Guid)property.Id
            };

            PropertyImageInsertSP propertyImageInsertSpParameters =  this.mapper.Map<PropertyImageInsertSP>(propertyImage);
            propertyImageInsertSpParameters.UserEmail = propertyImageInsertDTO.CurrentUserEmail;
            DapperDataAccess<PropertyImage> repPropertyImage = new DapperDataAccess<PropertyImage>(this.connectionString);
            await repPropertyImage.InsertUpdate(propertyImageInsertSpParameters, spPropertyImageInsert);
            return true; 
        }

        public async Task < List<PropertyImage>> PropertyImageFindByPropertyId(Guid PropertyId)
        {
            DapperDataAccess<PropertyImage> repPropertyImage = new DapperDataAccess<PropertyImage>(this.connectionString);
            return await repPropertyImage.Get(new { PropertyId = PropertyId }, spPropertyImageFindByPropertyId);
        }
    }
}
