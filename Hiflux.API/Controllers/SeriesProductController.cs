using Hiflux.API.Services.Interface;
using Microsoft.AspNetCore.Mvc;

namespace Hiflux.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class SeriesProductController : ControllerBase
    {
        private readonly ISeriesProductService _seriesProductService;
        private readonly ILogger<SeriesProductController> _logger;

        public SeriesProductController(ISeriesProductService seriesProductService, ILogger<SeriesProductController> logger)
        {
            _seriesProductService = seriesProductService;
            _logger = logger;
        }

        // GET api/SeriesProduct/categories  -> all series with their display content
        [HttpGet("categories")]
        public async Task<IActionResult> GetCategories(CancellationToken ct)
        {
            _logger.LogInformation("GetCategories called");
            var categories = await _seriesProductService.GetCategoriesAsync(ct);
            return Ok(categories);
        }

        // GET api/SeriesProduct/categories/{categoryId}/filters  -> the filter sidebar for a series
        [HttpGet("categories/{categoryId:int}/filters")]
        public async Task<IActionResult> GetCategoryFilters(int categoryId, CancellationToken ct)
        {
            _logger.LogInformation("GetCategoryFilters called for {CategoryId}", categoryId);
            var filters = await _seriesProductService.GetCategoryFiltersAsync(categoryId, ct);

            if (filters is null)
            {
                _logger.LogWarning("Category {CategoryId} not found", categoryId);
                return NotFound($"No category found for ID: {categoryId}");
            }

            return Ok(filters);
        }

        // GET api/series-product/categories/{categoryId}/products
        // Optional faceted filtering: ?filters[Size]=1/2"&filters[End Connection]=NPT
        [HttpGet("categories/{categoryId:int}/products")]
        public async Task<IActionResult> GetProducts(int categoryId, [FromQuery] Dictionary<string, string>? filters, CancellationToken ct)
        {
            _logger.LogInformation("GetProducts called for {CategoryId} with {FilterCount} filter(s)", categoryId, filters?.Count ?? 0);
            var products = await _seriesProductService.GetProductsAsync(categoryId, filters, ct);

            if (products is null)
            {
                _logger.LogWarning("Category {CategoryId} not found", categoryId);
                return NotFound($"No category found for ID: {categoryId}");
            }

            return Ok(products);
        }

        // GET api/series-product/categories/{categoryId}/configure?filters[Size]=1/2"&filters[End Connection]=NPT
        // Server-side configurator: returns option availability + the one resolved product.
        [HttpGet("categories/{categoryId:int}/configure")]
        public async Task<IActionResult> Configure(int categoryId, [FromQuery] Dictionary<string, string>? filters, CancellationToken ct)
        {
            _logger.LogInformation("Configure called for {CategoryId} with {FilterCount} selection(s)", categoryId, filters?.Count ?? 0);
            var state = await _seriesProductService.GetConfiguratorStateAsync(categoryId, filters ?? new Dictionary<string, string>(), ct);

            if (state is null)
            {
                _logger.LogWarning("Category {CategoryId} not found", categoryId);
                return NotFound($"No category found for ID: {categoryId}");
            }

            return Ok(state);
        }

        // GET api/series-product/products/{partNumber}
        [HttpGet("products/{partNumber}")]
        public async Task<IActionResult> GetProduct(string partNumber, CancellationToken ct)
        {
            _logger.LogInformation("GetProduct called for {PartNumber}", partNumber);
            var product = await _seriesProductService.GetProductByPartNumberAsync(partNumber, ct);

            if (product is null)
            {
                _logger.LogWarning("Product {PartNumber} not found", partNumber);
                return NotFound($"No product found for part number: {partNumber}");
            }

            return Ok(product);
        }
    }
}
