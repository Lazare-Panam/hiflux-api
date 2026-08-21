using Hiflux.API.Models.Products;

namespace Hiflux.API.Services.Interface
{
    public interface IProductService
    {
        Task<ProductCatalog?> GetCatalogByIdAsync(string id, CancellationToken ct = default);
        Task<ProductDetail?> GetProductDetailAsync(string id, CancellationToken ct = default);
        Task<ProductSeriesVariants?> GetProductVariantsAsync(string id, CancellationToken ct = default);
    }
}
