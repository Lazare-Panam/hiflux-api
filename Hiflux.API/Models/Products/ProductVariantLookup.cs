namespace Hiflux.API.Models.Products
{
    // One variant plus the series it belongs to, for a single SKU page.
    public class ProductVariantLookup
    {
        public string SeriesId { get; set; } = string.Empty;
        public string SeriesName { get; set; } = string.Empty;
        public string ThumbnailImage { get; set; } = string.Empty;
        public ProductVariant Variant { get; set; } = new();
    }
}
