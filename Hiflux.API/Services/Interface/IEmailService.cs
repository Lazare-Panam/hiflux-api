namespace Hiflux.API.Services.Interface
{
    public interface IEmailService
    {
        Task SendEmailAsync(string recipientEmail, string subject, string htmlBody, string? replyToEmail = null, CancellationToken ct = default);
    }
}
