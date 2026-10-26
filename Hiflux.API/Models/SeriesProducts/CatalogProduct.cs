using System.Text.Json.Serialization;

namespace Hiflux.API.Models.SeriesProducts
{
    public class CatalogProduct
    {
        public int ProductId { get; set; }
        public string PartNumber { get; set; }
        public int CategoryId { get; set; }
        public string ProductStatus { get; set; }
        public string? FamilyDescription { get; set; }
        public string? DetailDescription { get; set; }
        public string? ImageUrl { get; set; }
        public decimal? Price { get; set; }
        [JsonIgnore]
        public Category Category { get; set; }
        public List<ProductFilterValue> FilterValues { get; set; } = [];
    }
}
