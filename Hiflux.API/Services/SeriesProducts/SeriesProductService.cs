using System.Linq.Expressions;
using System.Text.Json;
using Hiflux.API.Models.SeriesProducts;
using Hiflux.API.Models.SeriesProducts.Dtos;
using Hiflux.API.Repository.SQL;
using Hiflux.API.Services.Interface;
using Microsoft.EntityFrameworkCore;

namespace Hiflux.API.Services.SeriesProducts
{
    public class SeriesProductService : ISeriesProductService
    {
        private readonly ApplicationDbContext _context;
        private readonly ILogger<SeriesProductService> _logger;

        public SeriesProductService(ApplicationDbContext context, ILogger<SeriesProductService> logger)
        {
            _context = context;
            _logger = logger;
        }


        private static readonly Expression<Func<CatalogProduct, CatalogProductDto>> ToDto = p => new CatalogProductDto
        {
            ProductId = p.ProductId,
            PartNumber = p.PartNumber,
            ProductStatus = p.ProductStatus,
            FamilyDescription = p.FamilyDescription,
            DetailDescription = p.DetailDescription,
            ImageUrl = p.ImageUrl,
            Price = p.Price,
            Specs = p.FilterValues
                .Select(v => new ProductSpecDto { Filter = v.Filter.Name, Value = v.Value })
                .ToList()
        };

        public Task<bool> CategoryExistsAsync(int categoryId, CancellationToken ct) => _context.Categories.AnyAsync(c => c.CategoryId == categoryId, ct);

        private static readonly JsonSerializerOptions CertJsonOptions = new() { PropertyNameCaseInsensitive = true };

        // All series, with KeyFeatures (stored one-per-line) and CertificatesJson expanded
        // into the list shapes the frontend consumes.
        public async Task<IReadOnlyList<CategoryDto>> GetCategoriesAsync(CancellationToken ct)
        {
            var categories = await _context.Categories.AsNoTracking()
                .OrderBy(c => c.Name)
                .ToListAsync(ct);

            return categories.Select(MapCategory).ToList();
        }

        private static CategoryDto MapCategory(Category c) => new()
        {
            CategoryId = c.CategoryId,
            Name = c.Name,
            CatalogUrl = c.CatalogUrl,
            CadUrl = c.CadUrl,
            Description = c.Description,
            BodyMaterial = c.BodyMaterial,
            SeatMaterial = c.SeatMaterial,
            Design = c.Design,
            TemperatureRange = c.TemperatureRange,
            Approvals = c.Approvals,
            DatasheetUrl = c.DatasheetUrl,
            KeyFeatures = SplitLines(c.KeyFeatures),
            Certificates = ParseCertificates(c.CertificatesJson),
        };

        private static List<string> SplitLines(string? s) =>
            string.IsNullOrWhiteSpace(s)
                ? []
                : s.Replace("\r\n", "\n").Split('\n', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries).ToList();

        private static List<CertificateDto> ParseCertificates(string? json)
        {
            if (string.IsNullOrWhiteSpace(json)) return [];
            try { return JsonSerializer.Deserialize<List<CertificateDto>>(json, CertJsonOptions) ?? []; }
            catch { return []; }
        }

        public async Task<ConfiguratorStateDto?> GetConfiguratorStateAsync(int categoryId, IReadOnlyDictionary<string, string> selection, CancellationToken ct)
        {
            var categoryExists = await _context.Categories.AnyAsync(c => c.CategoryId == categoryId, ct);
            if (!categoryExists)
            {
                _logger.LogInformation("Category {CategoryId} not found when configuring", categoryId);
                return null;
            }

            // filterDefs joins FilterIds with their names, with navigation properties and innerjoin
            var filterDefs = await _context.CategoryFilters.AsNoTracking()
                .Where(cf => cf.CategoryId == categoryId)
                .OrderBy(cf => cf.SortOrder)
                .Select(cf => new { cf.FilterId, cf.Filter.Name, cf.SortOrder })
                .ToListAsync(ct);

            // One lightweight query: (productId, filterName, value) for the whole series.
            var rows = await _context.ProductFilterValues.AsNoTracking()
                .Where(v => v.CategoryId == categoryId)
                .Select(v => new { v.ProductId, FilterName = v.Filter.Name, v.Value })
                .ToListAsync(ct);
            var productSpecs = new Dictionary<int, Dictionary<string, string>>();
            foreach (var row in rows)
            {
                if (!productSpecs.TryGetValue(row.ProductId, out var specs))
                {
                    specs = new Dictionary<string, string>();
                    productSpecs[row.ProductId] = specs;
                }
                specs[row.FilterName] = row.Value;
            }

            var allIds = productSpecs.Keys.ToList();

            bool MatchesSelection(Dictionary<string, string> specs, string? ignoreFilter)
            {
                foreach (var (filterName, pickedValue) in selection)
                {
                    if (filterName == ignoreFilter)
                        continue;

                    if (!specs.TryGetValue(filterName, out var productValue))
                        return false;

                    if (!string.Equals(productValue, pickedValue, StringComparison.OrdinalIgnoreCase))
                        return false;
                }
                return true;
            }

            var matchIds = allIds.Where(id => MatchesSelection(productSpecs[id], null)).ToList();

            var options = new List<ConfiguratorOptionDto>();
            foreach (var fd in filterDefs)
            {
                var allValues = rows.Where(r => r.FilterName == fd.Name).Select(r => r.Value).Distinct().ToList();
                // Products matching every OTHER selected option -> which values of this filter stay reachable.
                var reachable = allIds.Where(id => MatchesSelection(productSpecs[id], fd.Name)).ToHashSet();
                var availableValues = rows
                    .Where(r => r.FilterName == fd.Name && reachable.Contains(r.ProductId))
                    .Select(r => r.Value).ToHashSet();

                options.Add(new ConfiguratorOptionDto
                {
                    FilterId = fd.FilterId,
                    Name = fd.Name,
                    SortOrder = fd.SortOrder,
                    Values = allValues
                        .Select(v => new ConfiguratorValueDto { Value = v, Available = availableValues.Contains(v) })
                        .ToList(),
                });
            }

            CatalogProductDto? resolved = null;
            if (matchIds.Count == 1)
            {
                var pid = matchIds[0];
                resolved = await _context.CatalogProducts.AsNoTracking()
                    .Where(p => p.ProductId == pid)
                    .Select(ToDto)
                    .FirstOrDefaultAsync(ct);
            }

            var imageUrl = await _context.CatalogProducts.AsNoTracking()
                .Where(p => p.CategoryId == categoryId && p.ImageUrl != null)
                .Select(p => p.ImageUrl)
                .FirstOrDefaultAsync(ct);

            return new ConfiguratorStateDto
            {
                Options = options,
                MatchCount = matchIds.Count,
                TotalCount = allIds.Count,
                Resolved = resolved,
                ImageUrl = imageUrl,
            };
        }

        public async Task<IReadOnlyList<CategoryFilterDto>?> GetCategoryFiltersAsync(int categoryId, CancellationToken ct)
        {
            bool categoryExists = await CategoryExistsAsync(categoryId, ct);
            if (!categoryExists)
            {
                _logger.LogInformation("Category {CategoryId} not found when loading filters", categoryId);
                return null;
            }

            // filterDefs joins FilterIds with their names, with navigation properties and innerjoin
            var filterDefs = await _context.CategoryFilters.AsNoTracking()
                .Where(cf => cf.CategoryId == categoryId)
                .OrderBy(cf => cf.SortOrder)
                .Select(cf => new { cf.FilterId, cf.Filter.Name, cf.SortOrder })
                .ToListAsync(ct);

            var values = await _context.ProductFilterValues.AsNoTracking()
                .Where(v => v.CategoryId == categoryId)
                .Select(v => new { v.FilterId, v.Value })
                .Distinct()
                .ToListAsync(ct);

            var valuesByFilter = values.ToLookup(v => v.FilterId, v => v.Value);

            return filterDefs.Select(fd => new CategoryFilterDto
            {
                FilterId = fd.FilterId,
                Name = fd.Name,
                SortOrder = fd.SortOrder,
                Values = valuesByFilter[fd.FilterId].OrderBy(v => v).ToList()
            }).ToList();
        }

        public async Task<IReadOnlyList<CatalogProductDto>?> GetProductsAsync(int categoryId, IReadOnlyDictionary<string, string>? filters, CancellationToken ct)
        {
            var categoryExists = await _context.Categories.AnyAsync(c => c.CategoryId == categoryId, ct);
            if (!categoryExists)
            {
                _logger.LogInformation("Category {CategoryId} not found when loading products", categoryId);
                return null;
            }
            var query = _context.CatalogProducts.AsNoTracking().Where(p => p.CategoryId == categoryId);

            if (filters is not null)
            {
                foreach (var pair in filters)
                {
                    var filterName = pair.Key;
                    var filterValue = pair.Value;
                    query = query.Where(p => p.FilterValues.Any(v => v.Filter.Name == filterName && v.Value == filterValue));
                }
            }

            var products = await query
                .OrderBy(p => p.PartNumber)
                .Select(ToDto)
                .ToListAsync(ct);
            return products;
        }

        public async Task<CatalogProductDto?> GetProductByPartNumberAsync(string partNumber, CancellationToken ct)
        {
            if (string.IsNullOrWhiteSpace(partNumber))
            {
                _logger.LogInformation("GetProductByPartNumberAsync called with empty part number");
                return null;
            }

            return await _context.CatalogProducts.AsNoTracking()
                .Where(p => p.PartNumber == partNumber)
                .Select(ToDto)
                .FirstOrDefaultAsync(ct);
        }
    }
}
