using Hiflux.API.Models.SeriesProducts;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Hiflux.API.EntityConfigurations
{
    public class CategoryConfiguration : IEntityTypeConfiguration<Category>
    {
        public void Configure(EntityTypeBuilder<Category> builder)
        {
            builder.HasKey(c => c.CategoryId);

            builder.Property(c => c.Name)
                .HasMaxLength(100)
                .IsRequired();

            builder.HasIndex(c => c.Name)
                .IsUnique();

            builder.Property(c => c.CatalogUrl)
                .HasMaxLength(2048);

            builder.Property(c => c.CadUrl)
                .HasMaxLength(2048);

            builder.Property(c => c.Description).HasMaxLength(2000);
            builder.Property(c => c.BodyMaterial).HasMaxLength(100);
            builder.Property(c => c.SeatMaterial).HasMaxLength(100);
            builder.Property(c => c.Design).HasMaxLength(200);
            builder.Property(c => c.TemperatureRange).HasMaxLength(100);
            builder.Property(c => c.Approvals).HasMaxLength(200);
            builder.Property(c => c.DatasheetUrl).HasMaxLength(2048);
            // KeyFeatures and CertificatesJson are left as nvarchar(max) on purpose.
        }
    }
}
