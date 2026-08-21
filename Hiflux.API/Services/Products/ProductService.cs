using Hiflux.API.Models.Products;
using Hiflux.API.Repository.Interfaces;
using Hiflux.API.Services.Interface;

namespace Hiflux.API.Services.Products
{
    public class ProductService : IProductService
    {
        private readonly INoSQLRepository<ProductCatalog> _catalogRepository;
        private readonly INoSQLRepository<ProductDetail> _detailRepository;
        private readonly INoSQLRepository<ProductSeriesVariants> _variantRepository;

        private readonly ILogger<ProductService> _logger;
        public ProductService(INoSQLRepository<ProductCatalog> catalogRepository, INoSQLRepository<ProductDetail> detailRepository, INoSQLRepository<ProductSeriesVariants> variantRepository, ILogger<ProductService> logger)
        {
            _catalogRepository = catalogRepository;
            _detailRepository = detailRepository;
            _variantRepository = variantRepository;
            _logger = logger;
        }
        public async Task<ProductCatalog?> GetCatalogByIdAsync(string id, CancellationToken ct = default)
        {
            if (string.IsNullOrWhiteSpace(id))
            {
                _logger.LogWarning("GetCatalogByIdAsync called with null or empty id");
                return null;
            }
            var catalog = await _catalogRepository.GetByIdAsync(id, ct);
            if (catalog == null)
            {
                _logger.LogWarning("ProductCatalog not found for {Id}", id);
                return null;
            }
            return catalog;
        }
        public async Task<ProductDetail?> GetProductDetailAsync(string id, CancellationToken ct = default)
        {
            if (string.IsNullOrWhiteSpace(id))
            {
                _logger.LogWarning("GetProductDetailAsync called with null or empty id");
                return null;
            }
            var detail = await _detailRepository.GetByIdAsync(id, ct);
            if (detail is null)
            {
                _logger.LogWarning("ProductDetail not found for {Id}", id);
                return null;
            }
            return detail;
        }
        public async Task<ProductSeriesVariants?> GetProductVariantsAsync(string id, CancellationToken ct = default)
        {
            if (string.IsNullOrWhiteSpace(id))
            {
                _logger.LogWarning("GetProductVariantsAsync called with null or empty id/catalogId");
                return null;
            }
            var variants = await _variantRepository.GetByIdAsync(id, ct);
            if (variants is null)
            {
                _logger.LogWarning("ProductSeriesVariants not found for {Id}", id);
                return null;
            }
            return variants;
        }
    }
}
