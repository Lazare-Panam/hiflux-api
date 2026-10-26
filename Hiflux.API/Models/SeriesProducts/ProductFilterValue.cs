using System.Text.Json.Serialization;

namespace Hiflux.API.Models.SeriesProducts
{
    public class ProductFilterValue
    {
        public int Id { get; set; }
        public int ProductId { get; set; }
        public int CategoryId { get; set; }
        public int FilterId { get; set; }
        public string Value { get; set; }
        [JsonIgnore]
        public CatalogProduct Product { get; set; }
        [JsonIgnore]
        public Filter Filter { get; set; }
    }
}
