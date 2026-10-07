using Hiflux.API.Services.Interface;
using Microsoft.AspNetCore.Mvc;

namespace Hiflux.API.Controllers
{
    [ApiController]
    [Route("api/product")]
    public class ProductController : ControllerBase
    {
        private readonly IProductService _productService;
        private readonly ILogger<ProductController> _logger;

        public ProductController(IProductService productService, ILogger<ProductController> logger)
        {
            _productService = productService;
            _logger = logger;
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetCatalog(string id, CancellationToken ct)
        {
            _logger.LogInformation("GetCatalog called for {Id}", id);
            var catalog = await _productService.GetCatalogByIdAsync(id, ct);
            if (catalog is null)
            {
                _logger.LogWarning("Catalog not found for {Id}", id);
                return NotFound($"No catalog found for ID: {id}");
            }
            return Ok(catalog);
        }

        [HttpGet("{id}/detail")]
        public async Task<IActionResult> GetProductDetail(string id, CancellationToken ct)
        {
            _logger.LogInformation("GetProductDetail called for {Id}", id);
            var detail = await _productService.GetProductDetailAsync(id, ct);
            if (detail is null)
            {
                _logger.LogWarning("Product detail not found for {Id}", id);
                return NotFound($"No detail found for ID: {id}");
            }
            return Ok(detail);
        }
        [HttpGet("{id}/variants")]
        public async Task<IActionResult> GetProductVariants(string id, CancellationToken ct)
        {
            _logger.LogInformation("GetProductVariants called for {Id}", id);
            var variants = await _productService.GetProductVariantsAsync(id, ct);

            if (variants is null)
            {
                _logger.LogWarning("Variants not found for {Id}", id);
                return NotFound($"No variants found for ID: {id}");
            }

            return Ok(variants);
        }

        // Case-insensitive: /variants/ft150cs06 and /variants/FT150CS06 return the same part.
        // The response's variant.sku is the canonical form, so the frontend can redirect anything else to it.
        [HttpGet("{id}/variants/{sku}")]
        public async Task<IActionResult> GetProductVariant(string id, string sku, CancellationToken ct)
        {
            _logger.LogInformation("GetProductVariant called for {Id} {Sku}", id, sku);
            var variant = await _productService.GetProductVariantAsync(id, sku, ct);

            if (variant is null)
            {
                _logger.LogWarning("Variant {Sku} not found for {Id}", sku, id);
                return NotFound($"No variant {sku} found for ID: {id}");
            }

            return Ok(variant);
        }
    }
}
