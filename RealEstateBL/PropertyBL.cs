using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using prDbEntities.Models;
using prDTO;
using prDataAccess.Dapper;

namespace RealEstateBL
{
    public class PropertyBL:EntityBL
    {
        const string spPersonFindByEmail = "RealEstate.PersonFindByEmail";
        const string spRegionFindByCode = "RealEstate.RegionFindByCode";
        const string spPropertyInsert = "RealEstate.PropertyInsert";
        const string spPropertyUpdate = "RealEstate.PropertyUpdate";
        const string spPropertyViewSelect = "RealEstate.PropertyViewSelect";
        const string spPropertyImageInsert = "RealEstate.PropertyImageInsert";
        const string spPropertyImageFindByPropertyId = "RealEstate.PropertyImageFindByPropertyId";


        public void PropertyInsert (PropertyAddUpdateDTO propertyAddUpdateDTO, string currentUserEmail)
        {
            Person person;
            Region region; 

            Property property = this.mapper.Map<Property>(propertyAddUpdateDTO);
            DapperDataAccess<Person> repPerson = new DapperDataAccess<Person>();


            if (string.IsNullOrEmpty (property.Owner.Email))
            {
                throw new System.Exception();
            }

            person = repPerson.GetFirst(new  { Email = property.Owner.Email }, spPersonFindByEmail);

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

            DapperDataAccess<Region> repRegion = new DapperDataAccess<Region>();
            region = repRegion.GetFirst(new { Code = property.Region.Code}, spRegionFindByCode);

            if (region ==null)
            {
                throw new System.Exception(); 
            }
            else
            {
                property.Region = region; 
            }

            property.Id = this.getGuid(); 

            PropertyInsertOrUpdateSP spParameters = this.mapper.Map < PropertyInsertOrUpdateSP > (property);
            spParameters.UserEmail = currentUserEmail; 

            DapperDataAccess<Property> repProperty = new DapperDataAccess<Property>();
            repProperty.InsertUpdate(spParameters, spPropertyInsert); 
          
        }

        public void PropertyUpdate(PropertyAddUpdateDTO propertyAddUpdateDTO, string currentUserEmail)
        {
            Person person;
            Region region;

            Property property = this.mapper.Map<Property>(propertyAddUpdateDTO);
            DapperDataAccess<Person> repPerson = new DapperDataAccess<Person>();


            if (!string.IsNullOrEmpty(property.Owner.Email))
            {
                person = repPerson.GetFirst(new { Email = property.Owner.Email }, spPersonFindByEmail);

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
                DapperDataAccess<Region> repRegion = new DapperDataAccess<Region>();
                region = repRegion.GetFirst(new { Code = property.Region.Code }, spRegionFindByCode);

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
            spParameters.UserEmail = currentUserEmail;
            DapperDataAccess<Property> repProperty = new DapperDataAccess<Property>();
            repProperty.InsertUpdate(spParameters, spPropertyUpdate);           
        }

        public List <PropertyDTO>  PropertyBasicGet (PropertyBasicGetDTO propertyBasicGetDTO)
        {
            DapperDataAccess<PropertyView> repProperty = new DapperDataAccess<PropertyView>();
            var propertyViewList = repProperty.Get(propertyBasicGetDTO, spPropertyViewSelect);
            List<Property> propertyList = this.mapper.Map<List<Property>>(propertyViewList);

            foreach (Property property in propertyList)
            {
                property.PropertyImages = this.PropertyImageFindByPropertyId ((Guid)property.Id); 
            }

            List<PropertyDTO> propertyDTOList = this.mapper.Map <List< PropertyDTO >>  (propertyList) ;

            return propertyDTOList;   
        }

        public void PropertyImageInsert (PropertyImageInsertDTO propertyImageInsertDTO , string currentUserEmail)
        {
            DapperDataAccess<PropertyView> repProperty = new DapperDataAccess<PropertyView>();

            var property = repProperty.GetFirst (new { Code = propertyImageInsertDTO.PropertyCode }, spPropertyViewSelect); 

            if (property is null)
            {
                throw new Exception (); 
            }

            PropertyImage propertyImage = new PropertyImage()
            {
                Id = this.getGuid(),
                File = propertyImageInsertDTO.File,
                PropertyId = (Guid) property.Id
            };                                                                                                                                
            PropertyImageInsertSP propertyImageInsertSpParameters = this.mapper.Map<PropertyImageInsertSP>(propertyImage);
            propertyImageInsertSpParameters.UserEmail = currentUserEmail; 
            DapperDataAccess<PropertyImage> repPropertyImage = new DapperDataAccess<PropertyImage>();
            repPropertyImage.InsertUpdate(propertyImageInsertSpParameters , spPropertyImageInsert); 
        }

        public List <PropertyImage> PropertyImageFindByPropertyId (Guid PropertyId)
        {
            DapperDataAccess<PropertyImage> repPropertyImage = new DapperDataAccess<PropertyImage>();
            return repPropertyImage.Get(new { PropertyId = PropertyId }, spPropertyImageFindByPropertyId); 
        }
    }
}
