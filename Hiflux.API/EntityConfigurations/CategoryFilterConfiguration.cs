using Hiflux.API.Models.SeriesProducts;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Hiflux.API.EntityConfigurations
{
    public class CategoryFilterConfiguration : IEntityTypeConfiguration<CategoryFilter>
    {
        public void Configure(EntityTypeBuilder<CategoryFilter> builder)
        {
            // Composite primary key (CategoryId, FilterId)
            builder.HasKey(cf => new { cf.CategoryId, cf.FilterId });

            builder.Property(cf => cf.SortOrder)
                .IsRequired();

            builder.HasOne(cf => cf.Category)
                .WithMany(c => c.CategoryFilters)
                .HasForeignKey(cf => cf.CategoryId)
                .OnDelete(DeleteBehavior.Cascade);

            builder.HasOne(cf => cf.Filter)
                .WithMany(f => f.CategoryFilters)
                .HasForeignKey(cf => cf.FilterId)
                .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
