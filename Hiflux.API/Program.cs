using Azure.Communication.Email;
using Hiflux.API.Models.Products;
using Hiflux.API.Repository.Interfaces;
using Hiflux.API.Repository.NoSQL;
using Hiflux.API.Services.Interface;
using Hiflux.API.Services.Notification;
using Hiflux.API.Services.Products;
using Hiflux.API.Settings;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.Extensions.Options;
using System.Threading.RateLimiting;
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

builder.Services.AddOptionsWithValidateOnStart<EmailSettings>()
    .Bind(builder.Configuration.GetSection(nameof(EmailSettings)))
    .Validate(settings =>
        !string.IsNullOrWhiteSpace(settings.ConnectionString) &&
        !string.IsNullOrWhiteSpace(settings.SenderAddress),
        "EmailSettings: ConnectionString and SenderAddress must be set.");

builder.Services.AddSingleton(sp =>
{
    var settings = sp.GetRequiredService<IOptions<EmailSettings>>().Value;
    return new EmailClient(settings.ConnectionString);
});
builder.Services.AddScoped<IEmailService, EmailService>();
// HtmlRenderer turns the .razor files in EmailTemplates/ into HTML strings for email bodies.
builder.Services.AddScoped<HtmlRenderer>();
builder.Services.AddScoped<IEmailTemplateService, EmailTemplateService>();
builder.Services.AddScoped<INotificationService, NotificationService>();

// Stops bots spamming the contact form: 5 submissions per IP every 10 minutes.
builder.Services.AddRateLimiter(options =>
{
    options.RejectionStatusCode = StatusCodes.Status429TooManyRequests;
    options.AddPolicy("ContactForm", httpContext =>
        RateLimitPartition.GetFixedWindowLimiter(
            partitionKey: httpContext.Connection.RemoteIpAddress?.ToString() ?? "unknown",
            factory: _ => new FixedWindowRateLimiterOptions
            {
                PermitLimit = 5,
                Window = TimeSpan.FromMinutes(10),
                QueueLimit = 0
            }));
});
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
              .WithMethods("GET", "POST")
               .AllowAnyHeader();
    });
});
var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();
app.UseCors("MarsPolicy");
app.UseRateLimiter();
app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
