namespace Hiflux.API.Repository.Interfaces
{
    public interface INoSQLRepository<T>
    {
        Task<T?> GetByIdAsync(string id, CancellationToken ct);
    }
}
