using Hiflux.API.Models.Products;
using Hiflux.API.Repository.Interfaces;
using MongoDB.Driver;

namespace Hiflux.API.Repository.NoSQL
{
    public class ProductVariantRepository : MongoRepositoryBase<ProductSeriesVariants>
    {
        public ProductVariantRepository(IMongoDatabase database, ILogger<ProductVariantRepository> logger) : base(database, "product_variants", logger)
        {
        }
    }
}
