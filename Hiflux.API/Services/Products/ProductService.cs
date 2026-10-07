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
            var catalog = await _catalogRepository.GetByIdAsync(NormaliseId(id), ct);
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
            var detail = await _detailRepository.GetByIdAsync(NormaliseId(id), ct);
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
            var variants = await _variantRepository.GetByIdAsync(NormaliseId(id), ct);
            if (variants is null)
            {
                _logger.LogWarning("ProductSeriesVariants not found for {Id}", id);
                return null;
            }
            return variants;
        }
        public async Task<ProductVariantLookup?> GetProductVariantAsync(string id, string sku, CancellationToken ct = default)
        {
            if (string.IsNullOrWhiteSpace(sku))
            {
                _logger.LogWarning("GetProductVariantAsync called with null or empty sku");
                return null;
            }
            var series = await GetProductVariantsAsync(id, ct);
            var variant = series?.Variants.FirstOrDefault(v => string.Equals(v.Id, sku.Trim(), StringComparison.OrdinalIgnoreCase));
            if (series is null || variant is null)
            {
                _logger.LogWarning("Variant {Sku} not found in series {Id}", sku, id);
                return null;
            }
            return new ProductVariantLookup
            {
                SeriesId = series.Id,
                SeriesName = series.Name,
                ThumbnailImage = series.ThumbnailImage,
                Variant = variant
            };
        }
        // Ids are stored lower case, so any casing in a URL (FT150CS06, ft150cs06, Ft150Cs06) resolves to the same document.
        private static string NormaliseId(string id) => id.Trim().ToLowerInvariant();
    }
}
