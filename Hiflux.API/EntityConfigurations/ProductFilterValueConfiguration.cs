using Hiflux.API.Models.SeriesProducts;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Hiflux.API.EntityConfigurations
{
    public class ProductFilterValueConfiguration : IEntityTypeConfiguration<ProductFilterValue>
    {
        public void Configure(EntityTypeBuilder<ProductFilterValue> builder)
        {
            builder.HasKey(v => v.Id);

            builder.Property(v => v.Value)
                .HasMaxLength(200)
                .IsRequired();
            builder.HasIndex(v => new { v.ProductId, v.FilterId, v.Value }).IsUnique();

            builder.HasOne(v => v.Product)
                .WithMany(p => p.FilterValues)
                .HasForeignKey(v => new { v.ProductId, v.CategoryId })
                .HasPrincipalKey(p => new { p.ProductId, p.CategoryId })
                .OnDelete(DeleteBehavior.Cascade);

            builder.HasOne<CategoryFilter>()
                .WithMany()
                .HasForeignKey(v => new { v.CategoryId, v.FilterId })
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(v => v.Filter)
                .WithMany()
                .HasForeignKey(v => v.FilterId)
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
