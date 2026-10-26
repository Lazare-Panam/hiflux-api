using Hiflux.API.Models.SeriesProducts;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Hiflux.API.EntityConfigurations
{
    public class FilterConfiguration : IEntityTypeConfiguration<Filter>
    {
        public void Configure(EntityTypeBuilder<Filter> builder)
        {
            builder.HasKey(f => f.FilterId);

            builder.Property(f => f.Name)
                .HasMaxLength(100)
                .IsRequired();

            builder.HasIndex(f => f.Name)
                .IsUnique();
        }
    }
}
