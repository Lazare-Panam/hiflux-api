using Hiflux.API.Models.Products;
using Hiflux.API.Repository.Interfaces;
using Hiflux.API.Repository.NoSQL;
using Hiflux.API.Services.Interface;
using Hiflux.API.Services.Products;
using Hiflux.API.Settings;
using Microsoft.Extensions.Options;
using MongoDB.Driver;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring OpenAPI at https://aka.ms/aspnet/openapi
builder.Services.AddOpenApi();
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddOptionsWithValidateOnStart<MongoDbSettings>()
    .Bind(builder.Configuration.GetSection(nameof(MongoDbSettings)))
    .Validate(settings =>
        !string.IsNullOrWhiteSpace(settings.ConnectionString) &&
        !string.IsNullOrWhiteSpace(settings.DatabaseName),
        "MongoDbSettings: ConnectionString and DatabaseName must be set.");

builder.Services.AddSingleton<IMongoClient>(sp =>
{
    var settings = sp.GetRequiredService<IOptions<MongoDbSettings>>().Value;
    return new MongoClient(settings.ConnectionString);
});

builder.Services.AddScoped<IMongoDatabase>(sp =>
{
    var settings = sp.GetRequiredService<IOptions<MongoDbSettings>>().Value;
    return sp.GetRequiredService<IMongoClient>()
             .GetDatabase(settings.DatabaseName);
});
builder.Services.AddScoped<INoSQLRepository<ProductCatalog>, ProductCatalogRepository>();
builder.Services.AddScoped<INoSQLRepository<ProductDetail>, ProductDetailRepository>();
builder.Services.AddScoped<INoSQLRepository<ProductSeriesVariants>, ProductVariantRepository>();
builder.Services.AddScoped<IProductService,ProductService>();
var policyName = "MarsPolicy";
var allowedOrigins = builder.Configuration.GetSection("Cors:AllowedOrigins").Get<string[]>();
if (allowedOrigins is null || allowedOrigins.Length == 0)
{
    throw new InvalidOperationException("AllowedOrigins configuration is missing or empty.");
}
builder.Services.AddCors(options =>
{
    options.AddPolicy(name: policyName, policy =>
    {
        policy.WithOrigins(allowedOrigins)
              .WithMethods("GET")
               .AllowAnyHeader();
    });
});
var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();
app.UseCors("MarsPolicy");
app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
