using Hiflux.API.Models.Enums;
using Hiflux.API.Repository.Interfaces;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace Hiflux.API.Models.Products
{
    [BsonIgnoreExtraElements]
    public class ProductCatalog : IHasId
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public ObjectId MongoId { get; set; }

        [BsonElement("id")]
        public string? Id { get; set; }

        [BsonElement("type")]
        [BsonRepresentation(BsonType.String)]
        public ProductType? Type { get; set; }

        // Legacy/simple fields — still used directly by Grid-type docs
        [BsonElement("bannerTitle")]
        public string? BannerTitle { get; set; }

        [BsonElement("bannerSubtitle")]
        public string? BannerSubtitle { get; set; }

        [BsonElement("bannerImage")]
        public string? BannerImage { get; set; }

        [BsonElement("products")]
        public List<ProductItem>? Products { get; set; }

        // Rich ProductListing-type fields — all nullable, only populated when Type == ProductListing
        [BsonElement("seo")]
        public SeoInfo? Seo { get; set; }

        [BsonElement("hero")]
        public HeroInfo? Hero { get; set; }

        [BsonElement("marquee")]
        public List<string>? Marquee { get; set; }

        [BsonElement("intro")]
        public IntroInfo? Intro { get; set; }

        [BsonElement("productsSectionLabel")]
        public string? ProductsSectionLabel { get; set; }

        [BsonElement("productsHeading")]
        public string? ProductsHeading { get; set; }

        [BsonElement("productsSubtext")]
        public string? ProductsSubtext { get; set; }

        [BsonElement("keyFeatures")]
        public KeyFeaturesInfo? KeyFeatures { get; set; }

        [BsonElement("cta")]
        public CtaInfo? Cta { get; set; }
    }

    [BsonIgnoreExtraElements]
    public class SeoInfo
    {
        [BsonElement("title")] public string? Title { get; set; }
        [BsonElement("description")] public string? Description { get; set; }
        [BsonElement("canonical")] public string? Canonical { get; set; }
        [BsonElement("ogImage")] public string? OgImage { get; set; }
    }

    [BsonIgnoreExtraElements]
    public class HeroInfo
    {
        [BsonElement("overline")] public string? Overline { get; set; }
        [BsonElement("title")] public string? Title { get; set; }
        [BsonElement("titleAccent")] public string? TitleAccent { get; set; }
        [BsonElement("subtitle")] public string? Subtitle { get; set; }
        [BsonElement("bannerImage")] public string? BannerImage { get; set; }
        [BsonElement("primaryCta")] public CtaLink? PrimaryCta { get; set; }
        [BsonElement("secondaryCta")] public CtaLink? SecondaryCta { get; set; }
    }

    [BsonIgnoreExtraElements]
    public class IntroInfo
    {
        [BsonElement("heading")] public string? Heading { get; set; }
        [BsonElement("paragraphs")] public List<string>? Paragraphs { get; set; }
    }

    [BsonIgnoreExtraElements]
    public class KeyFeaturesInfo
    {
        [BsonElement("heading")] public string? Heading { get; set; }
        [BsonElement("subtext")] public string? Subtext { get; set; }
        [BsonElement("items")] public List<string>? Items { get; set; }
    }

    [BsonIgnoreExtraElements]
    public class CtaInfo
    {
        [BsonElement("heading")] public string? Heading { get; set; }
        [BsonElement("text")] public string? Text { get; set; }
        [BsonElement("emailCta")] public CtaLink? EmailCta { get; set; }
        [BsonElement("quoteCta")] public CtaLink? QuoteCta { get; set; }
    }

    [BsonIgnoreExtraElements]
    public class CtaLink
    {
        [BsonElement("label")] public string? Label { get; set; }
        [BsonElement("link")] public string? Link { get; set; }
    }
}
