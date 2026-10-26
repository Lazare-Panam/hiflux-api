namespace Hiflux.API.Models.SeriesProducts
{
    public class Filter
    {
        public int FilterId { get; set; }
        public string Name { get; set; }
        public List<CategoryFilter> CategoryFilters { get; set; } = [];
    }
}
