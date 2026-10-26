using Hiflux.API.Models.SeriesProducts;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Hiflux.API.EntityConfigurations
{
    public class CatalogProductConfiguration : IEntityTypeConfiguration<CatalogProduct>
    {
        public void Configure(EntityTypeBuilder<CatalogProduct> builder)
        {
            builder.HasKey(p => p.ProductId);

            builder.Property(p => p.PartNumber)
                .HasMaxLength(100)
                .IsRequired();

            builder.HasIndex(p => p.PartNumber)
                .IsUnique();

            builder.Property(p => p.ProductStatus)
                .HasMaxLength(30)
                .IsRequired();

            builder.Property(p => p.FamilyDescription)
                .HasMaxLength(200);

            builder.Property(p => p.DetailDescription)
                .HasMaxLength(500);

            builder.Property(p => p.ImageUrl)
                .HasMaxLength(2048);

            builder.Property(p => p.Price)
                .HasColumnType("decimal(18,2)");

            // Composite alternate key so ProductFilterValue can reference (ProductId, CategoryId)
            // and the DB can prove a spec row's CategoryId matches the product's real category.
            builder.HasAlternateKey(p => new { p.ProductId, p.CategoryId });

            builder.HasOne(p => p.Category)
                .WithMany(c => c.Products)
                .HasForeignKey(p => p.CategoryId)
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
