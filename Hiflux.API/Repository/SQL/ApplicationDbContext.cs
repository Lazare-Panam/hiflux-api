using Microsoft.EntityFrameworkCore;
namespace Hiflux.API.Repository.SQL
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {
        }
    }
}
