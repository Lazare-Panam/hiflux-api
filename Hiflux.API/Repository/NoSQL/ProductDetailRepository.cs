using Hiflux.API.Models.Products;
using Hiflux.API.Repository.Interfaces;
using MongoDB.Driver;

namespace Hiflux.API.Repository.NoSQL
{
    public class ProductDetailRepository : INoSQLRepository<ProductDetail>
    {
        private readonly IMongoCollection<ProductDetail> _collection;
        private readonly ILogger<ProductDetailRepository> _logger;
        private const string CollectionName = "product_details";
        public ProductDetailRepository(IMongoDatabase database, ILogger<ProductDetailRepository> logger)
        {
            _collection = database.GetCollection<ProductDetail>(CollectionName);
            _logger = logger;
        }
        public async Task<ProductDetail?> GetByIdAsync(string id, CancellationToken ct = default)
        {
            try
            {
                return await _collection.Find(x => x.Id == id).FirstOrDefaultAsync(ct);
            }
            catch (OperationCanceledException)
            {
                _logger.LogWarning("Request cancelled for ProductDetail {Id}", id);
                throw;
            }
            catch (MongoException ex)
            {
                _logger.LogError(ex, "MongoDB error fetching ProductDetail {Id}", id);
                throw;
            }
        }
    }
}
