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
    }

}
