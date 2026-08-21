using Hiflux.API.Models.Products;
using Hiflux.API.Repository.Interfaces;
using MongoDB.Driver;

namespace Hiflux.API.Repository.NoSQL
{
    public class ProductCatalogRepository : INoSQLRepository<ProductCatalog>
    {
        private readonly IMongoCollection<ProductCatalog> _collection;
        private readonly ILogger<ProductCatalogRepository> _logger;
        private readonly string CollectionName = "product_series";
        public ProductCatalogRepository(IMongoDatabase database, ILogger<ProductCatalogRepository> logger)
        {
            _collection = database.GetCollection<ProductCatalog>(CollectionName);
            _logger = logger;
        }
        public async Task<ProductCatalog?> GetByIdAsync(string id, CancellationToken ct)
        {
            try
            {
                return await _collection.Find(x => x.Id == id).FirstOrDefaultAsync(ct);
            }
            catch (OperationCanceledException)
            {
                _logger.LogWarning("Request cancelled for ProductCatalog {Id}", id);
                throw;
            }
            catch (MongoException ex)
            {
                _logger.LogError(ex, "MongoDB error fetching ProductCatalog {Id}", id);
                throw;
            }
        }
    }
}
