using Hiflux.API.Models.Products;
using Hiflux.API.Repository.Interfaces;
using MongoDB.Driver;

namespace Hiflux.API.Repository.NoSQL
{
    public class ProductDetailRepository : MongoRepositoryBase<ProductDetail>
    {
        public ProductDetailRepository(IMongoDatabase database, ILogger<ProductDetailRepository> logger) : base(database, "product_details", logger)
        { 
        }
    }
}
