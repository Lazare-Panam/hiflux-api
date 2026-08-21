using Hiflux.API.Models.Enums;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace Hiflux.API.Models.Products
{
    [BsonIgnoreExtraElements]
    public class ProductItem
    {
        [BsonElement("id")]
        public string? Id { get; set; }

        [BsonElement("name")]
        public string? Name { get; set; }

        [BsonElement("subtitle")]
        public string? Subtitle { get; set; }

        [BsonElement("description")]
        public string? Description { get; set; }

        [BsonElement("type")]
        [BsonRepresentation(BsonType.String)]
        public ProductType? Type { get; set; }

        [BsonElement("thumbnailImage")]
        public string? ThumbnailImage { get; set; }

        [BsonElement("tag")]
        public string? Tag { get; set; }

        [BsonElement("materialBadge")]
        public string? MaterialBadge { get; set; }

        [BsonElement("specs")]
        public Dictionary<string, string>? Specs { get; set; }

        [BsonElement("features")]
        public List<string>? Features { get; set; }
    }
}
