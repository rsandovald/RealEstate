using prDbEntities.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace prDataAccess.Dapper
{
    public interface IDataAccessProvider<T> where T : Entity
    {
        Task<List<T>> Get(object parameters, string spName);
        Task<T> GetFirst(object parameters, string spName);
        Task<int> InsertUpdate(object parameters, string spName);
    }
}