using Hiflux.API.Repository.Interfaces;
using MongoDB.Bson;
using MongoDB.Driver;
namespace Hiflux.API.Repository.NoSQL
{
    public class MongoRepositoryBase<T> : INoSQLRepository<T> where T : class , IHasId
    {
        private readonly IMongoCollection<T> _collection;
        private readonly ILogger<MongoRepositoryBase<T>> _logger;
        public MongoRepositoryBase(IMongoDatabase database,string collectionName, ILogger<MongoRepositoryBase<T>> logger)
        {
            _collection = database.GetCollection<T>(collectionName);
            _logger = logger;
        }

        public async Task<T?> GetByIdAsync(string id, CancellationToken ct)
        {
            try 
            {
                ArgumentException.ThrowIfNullOrEmpty(id);
                return await _collection.Find(x=>x.Id == id).FirstOrDefaultAsync(ct);  
            }
            catch (OperationCanceledException)
            {
                _logger.LogWarning("Request cancelled for {EntityType} {Id}", typeof(T).Name, id);
                throw;
            }
            catch (BsonException ex)
            {
                _logger.LogError(ex, "BSON error fetching {EntityType} {Id}", typeof(T).Name, id);
                throw;
            }
            catch (MongoException ex)
            {
                _logger.LogError(ex, "MongoDB error fetching {EntityType} {Id}", typeof(T).Name, id);
                throw;
            }
        }
    }
}
