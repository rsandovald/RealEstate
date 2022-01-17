using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using prDataAccess;
using prImageUtility;
using RealEstateWebAPI.Controllers;
using System.Collections.Generic;
using prDTO;
using System;
using Microsoft.AspNetCore.Mvc;
using System.Net;

namespace prTestProject
{
    [TestClass]
    public class PropertyControllerTest
    {

        PropertyController propertyController;

        [TestInitialize]
        public void Setup()
        {
            IPropertyRepository propertyRepository;
            IAlmacenadorArchivos almacenadorArchivos;

            var myConfiguration = new Dictionary<string, string>
            {
                {"connectionStrings:RealEstateDB", @""},
                {"connectionStrings:identityDB",   @""},
                {"connectionStrings:AzureStorage", @""},
                {"llavejwt", "LKMFLKM43LKM543JKN3KJ4SAD543423215SA4DA5S3423KJ4KJNSDKJASNDJAKSDJKN"}

            };

            var configuration = new ConfigurationBuilder()
                .AddInMemoryCollection(myConfiguration)
                .Build();

            propertyRepository = new PropertyRepository(configuration);
            almacenadorArchivos = new AlmacenadorAzureStorage(configuration);
            this.propertyController = new PropertyController(propertyRepository, almacenadorArchivos);                
          
        }

        [TestMethod]
        public async Task  propertyPostTest()
        {
            PropertyAddUpdateDTO propertyAddUpdateDTO = new PropertyAddUpdateDTO()
            {
                Code = Guid.NewGuid().ToString(),
                Price = 1000,
                Year = 2020,
                Address = "CL 4 4 4",
                Owner = new PersonDTO()
                {
                    Email = "owner1@hotmail.com"
                },
                Region = new RegionDTO
                {
                    Code = "11"
                },
                CurrentUserEmail = "user@hotmail.com"
            };

            StatusCodeResult result  = (StatusCodeResult)  await propertyController.Post(propertyAddUpdateDTO);          
            Assert.AreEqual(HttpStatusCode.OK, (HttpStatusCode)result.StatusCode);
        }

        [TestMethod]
        public async Task propertyTestUpdateTest()
        {
            string code = "COD_TEST"; 
            PropertyAddUpdateDTO propertyAddUpdateDTO = new PropertyAddUpdateDTO()
            {
                Code =  code,
                Price = 1000,
                Year = 2020,
                Address = "CL 4 4 4",
                Owner = new PersonDTO()
                {
                    Email = "owner1@hotmail.com"
                },
                Region = new RegionDTO
                {
                    Code = "1"
                },
                CurrentUserEmail = "user@hotmail.com"
            };

            StatusCodeResult result = (StatusCodeResult)await propertyController.Put(propertyAddUpdateDTO);
            Assert.AreEqual(HttpStatusCode.OK, (HttpStatusCode)result.StatusCode);           
        }
        [TestMethod]
        public async Task propertyGetAllTest()
        {
            string code = "COD_TEST";
            PropertyBasicGetDTO propertyBasicGetDTO = new PropertyBasicGetDTO() { Code = code  };
            var result = await  propertyController.Get(propertyBasicGetDTO);
            List<PropertyDTO> listProperty =  result.Value;             
            Assert.IsTrue(listProperty.Count == 1 );
        }
    }
}
