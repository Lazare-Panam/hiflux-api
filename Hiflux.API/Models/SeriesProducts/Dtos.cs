namespace Hiflux.API.Models.SeriesProducts.Dtos
{
    public class CategoryDto
    {
        public int CategoryId { get; set; }
        public string Name { get; set; }
        public string? CatalogUrl { get; set; }
        public string? CadUrl { get; set; }

        // Series-level content
        public string? Description { get; set; }
        public string? BodyMaterial { get; set; }
        public string? SeatMaterial { get; set; }
        public string? Design { get; set; }
        public string? TemperatureRange { get; set; }
        public string? Approvals { get; set; }
        public string? DatasheetUrl { get; set; }
        public List<string> KeyFeatures { get; set; } = [];
        public List<CertificateDto> Certificates { get; set; } = [];
    }

    public class CertificateDto
    {
        public string Label { get; set; }
        public string Url { get; set; }
    }

    // --- Configurator (server-side resolve) ---
    public class ConfiguratorValueDto
    {
        public string Value { get; set; }
        public bool Available { get; set; }
    }

    public class ConfiguratorOptionDto
    {
        public int FilterId { get; set; }
        public string Name { get; set; }
        public int SortOrder { get; set; }
        public List<ConfiguratorValueDto> Values { get; set; } = [];
    }

    public class ConfiguratorStateDto
    {
        public List<ConfiguratorOptionDto> Options { get; set; } = [];
        public int MatchCount { get; set; }
        public int TotalCount { get; set; }
        public CatalogProductDto? Resolved { get; set; }
        public string? ImageUrl { get; set; }
    }

    // A filter the series exposes, with the distinct values currently available for it.
    public class CategoryFilterDto
    {
        public int FilterId { get; set; }
        public string Name { get; set; }
        public int SortOrder { get; set; }
        public List<string> Values { get; set; } = [];
    }

    public class ProductSpecDto
    {
        public string Filter { get; set; }
        public string Value { get; set; }
    }

    public class CatalogProductDto
    {
        public int ProductId { get; set; }
        public string PartNumber { get; set; }
        public string ProductStatus { get; set; }
        public string? FamilyDescription { get; set; }
        public string? DetailDescription { get; set; }
        public string? ImageUrl { get; set; }
        public decimal? Price { get; set; }
        public List<ProductSpecDto> Specs { get; set; } = [];
    }
}
