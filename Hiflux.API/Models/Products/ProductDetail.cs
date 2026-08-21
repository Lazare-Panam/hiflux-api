using Hiflux.API.Models.Enums;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace Hiflux.API.Models.Products
{
    [BsonIgnoreExtraElements]
    public class ProductDetail
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string? MongoId { get; set; }

        [BsonElement("id")]
        public string Id { get; set; } = string.Empty;

        [BsonElement("catalogId")]
        public string CatalogId { get; set; } = string.Empty;

        [BsonElement("type")]
        [BsonRepresentation(BsonType.String)]
        public ProductType? Type { get; set; }

        [BsonElement("name")]
        public string Name { get; set; } = string.Empty;

        [BsonElement("description")]
        public string Description { get; set; } = string.Empty;

        [BsonElement("image")]
        public string Image { get; set; } = string.Empty;

        [BsonElement("specs")]
        public Dictionary<string, string> Specs { get; set; } = [];

        [BsonElement("features")]
        public List<string> Features { get; set; } = [];

        [BsonElement("applications")]
        public List<string> Applications { get; set; } = [];

        [BsonElement("temperature")]
        public string Temperature { get; set; } = string.Empty;

        [BsonElement("relatedProducts")]
        public List<string> RelatedProducts { get; set; } = [];
    }
}
