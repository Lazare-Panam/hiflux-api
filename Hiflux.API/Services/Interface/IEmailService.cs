using Hiflux.API.Models.Notification;

namespace Hiflux.API.Services.Interface
{
    public interface IEmailService
    {
        Task SendEmailAsync(string recipientEmail, string subject, string htmlBody, string? replyToEmail = null, IEnumerable<EmailFileAttachment>? attachments = null, CancellationToken ct = default);
    }
}
