using Hiflux.API.Models.SeriesProducts.Dtos;

namespace Hiflux.API.Services.Interface
{
    public interface ISeriesProductService
    {
        // All series with their display content (key features / certificates expanded).
        Task<IReadOnlyList<CategoryDto>> GetCategoriesAsync(CancellationToken ct);

        Task<IReadOnlyList<CategoryFilterDto>?> GetCategoryFiltersAsync(int categoryId, CancellationToken ct);

        // Returns null if the category does not exist. Optional faceted filtering:
        // each (filterName -> value) pair must be matched (AND) by the product.
        Task<IReadOnlyList<CatalogProductDto>?> GetProductsAsync(int categoryId, IReadOnlyDictionary<string, string>? filters, CancellationToken ct);

        Task<CatalogProductDto?> GetProductByPartNumberAsync(string partNumber, CancellationToken ct);

        // Server-side configurator: given the current selection, returns the option
        // availability + the single resolved product (when the selection narrows to one),
        // so the client never downloads the whole product list. Null if category missing.
        Task<ConfiguratorStateDto?> GetConfiguratorStateAsync(int categoryId, IReadOnlyDictionary<string, string> selection, CancellationToken ct);
    }
}
