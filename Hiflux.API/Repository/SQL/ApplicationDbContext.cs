using Hiflux.API.EntityConfigurations;
using Hiflux.API.Models.SeriesProducts;
using Microsoft.EntityFrameworkCore;
namespace Hiflux.API.Repository.SQL
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {
        }

        public DbSet<Category> Categories => Set<Category>();
        public DbSet<Filter> Filters => Set<Filter>();
        public DbSet<CategoryFilter> CategoryFilters => Set<CategoryFilter>();
        public DbSet<CatalogProduct> CatalogProducts => Set<CatalogProduct>();
        public DbSet<ProductFilterValue> ProductFilterValues => Set<ProductFilterValue>();

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
            builder.ApplyConfiguration(new CategoryConfiguration());
            builder.ApplyConfiguration(new FilterConfiguration());
            builder.ApplyConfiguration(new CategoryFilterConfiguration());
            builder.ApplyConfiguration(new CatalogProductConfiguration());
            builder.ApplyConfiguration(new ProductFilterValueConfiguration());
        }
    }
}
