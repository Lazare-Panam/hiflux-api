using Hiflux.API.Models.Products;
using Hiflux.API.Repository.Interfaces;
using MongoDB.Driver;

namespace Hiflux.API.Repository.NoSQL
{
    public class ProductCatalogRepository : MongoRepositoryBase<ProductCatalog>
    {
        public ProductCatalogRepository(IMongoDatabase database, ILogger<ProductCatalogRepository> logger) : base(database, "product_series", logger)
        {

        }
    }
}
