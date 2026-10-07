using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace Hiflux.API.Models.Products
{
    [BsonIgnoreExtraElements]
    public class ProductSeriesVariants
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string? MongoId { get; set; }

        [BsonElement("id")]
        public string Id { get; set; } = string.Empty;

        [BsonElement("name")]
        public string Name { get; set; } = string.Empty;

        [BsonElement("thumbnailImage")]
        public string ThumbnailImage { get; set; } = string.Empty;

        [BsonElement("variants")]
        public List<ProductVariant> Variants { get; set; } = [];
    }
    [BsonIgnoreExtraElements]
    public class ProductVariant
    {
        [BsonElement("id")]
        public string Id { get; set; } = string.Empty;

        [BsonElement("specs")]
        public Dictionary<string, string> Specs { get; set; } = [];

        // Canonical, URL-safe SKU: the unique id in upper case, because buyers search part numbers in upper case.
        // Every series exposes the same field, so URLs no longer depend on which spec key a series happens to use.
        [BsonIgnore]
        public string Sku => Id.ToUpperInvariant();

        // The catalogue part number as printed (not always unique, e.g. CO2 regulator variants share one).
        [BsonIgnore]
        public string PartNumber =>
            PartNumberKeys.Select(key => Specs.GetValueOrDefault(key)).FirstOrDefault(value => !string.IsNullOrWhiteSpace(value)) ?? Sku;

        private static readonly string[] PartNumberKeys = ["SKU", "Catalog No", "Product Code", "Model", "Part Number"];
    }

}
