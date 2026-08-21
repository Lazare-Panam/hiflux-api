using Hiflux.API.Models.Products;
using Hiflux.API.Repository.Interfaces;
using MongoDB.Driver;

namespace Hiflux.API.Repository.NoSQL
{
    public class ProductVariantRepository : INoSQLRepository<ProductSeriesVariants>
    {
        private readonly IMongoCollection<ProductSeriesVariants> _collection;
        private readonly ILogger<ProductVariantRepository> _logger;
        private const string CollectionName = "product_variants";
        public ProductVariantRepository(IMongoDatabase database, ILogger<ProductVariantRepository> logger)
        {
            _collection = database.GetCollection<ProductSeriesVariants>(CollectionName);
            _logger = logger;
        }
        public async Task<ProductSeriesVariants?> GetByIdAsync(string id, CancellationToken ct = default)
        {
            try
            {
                return await _collection.Find(x => x.Id == id).FirstOrDefaultAsync(ct);
            }
            catch (OperationCanceledException)
            {
                _logger.LogWarning("Request cancelled for ProductSeriesVariants {Id}", id);
                throw;
            }
            catch (MongoException ex)
            {
                _logger.LogError(ex, "MongoDB error fetching ProductSeriesVariants {Id}", id);
                throw;
            }
        }
    }
}
