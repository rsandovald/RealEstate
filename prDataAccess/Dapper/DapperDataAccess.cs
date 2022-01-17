using Dapper;
using Microsoft.Data.SqlClient;
using prDbEntities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace prDataAccess.Dapper
{
    public class DapperDataAccess<T> : IDataAccessProvider<T> where T : Entity
    {        
        protected string connectionString;

        public DapperDataAccess(string mConnectionString)
        {
            this.connectionString = mConnectionString; 
        }
        public async Task<List<T>> Get(Object parameters, string spName)
        {          
            using (var connection = new SqlConnection(connectionString))
            {                  
                var result =  await connection.QueryAsync<T>(
                                spName,
                                parameters,
                                commandType: System.Data.CommandType.StoredProcedure
                                );

                return result.ToList<T>();                    
            }              
        }

        public async Task<T?> GetFirst(Object parameters, string spName)
        {
            List<T> listT = await this.Get(parameters, spName);


            if (listT != null && listT.Count > 0)
            {
                return listT.FirstOrDefault<T>();
            }
            else
            {
                return null;
            }
        }

        public async Task<int> InsertUpdate(Object parameters, string spName)
        {     
                using (var connection = new SqlConnection(connectionString))
                {
                    var result = await connection.ExecuteAsync(
                        spName,
                        parameters,
                        commandType: System.Data.CommandType.StoredProcedure
                        );

                    return result;
                }
                      
        }

    }
}
