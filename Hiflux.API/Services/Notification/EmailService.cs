using Azure;
using Azure.Communication.Email;
using Hiflux.API.Models.Notification;
using Hiflux.API.Services.Interface;
using Hiflux.API.Settings;
using Microsoft.Extensions.Options;
namespace Hiflux.API.Services.Notification
{
    public class EmailService : IEmailService
    {
        private readonly EmailClient _emailClient;
        private readonly EmailSettings _emailSettings;
        private readonly ILogger<EmailService> _logger;
        public EmailService(IOptions<EmailSettings> options, EmailClient emailClient, ILogger<EmailService> logger)
        {
            _emailClient = emailClient;
            _logger = logger;
            _emailSettings = options.Value;
        }
        /// <summary>
        /// Sends an HTML email via Azure Communication Services.
        /// </summary>
        /// <param name="recipientEmail">The recipient's email address.</param>
        /// <param name="subject">The email subject line.</param>
        /// <param name="htmlBody">The rendered HTML body to send.</param>
        /// <param name="replyToEmail">Optional address that replies go to, e.g. the customer on an internal notification.</param>
        /// <param name="attachments">Optional files to attach, e.g. a customer's bill of materials.</param>
        /// <param name="ct">Cancellation token for the send operation.</param>
        /// <exception cref="ArgumentException">Thrown if recipient, subject or body is null or whitespace.</exception>
        /// <exception cref="RequestFailedException">Thrown if Azure Communication Services rejects or fails to send the email; logged before rethrowing.</exception>
        public async Task SendEmailAsync(string recipientEmail, string subject, string htmlBody, string? replyToEmail = null, IEnumerable<EmailFileAttachment>? attachments = null, CancellationToken ct = default)
        {
            ArgumentException.ThrowIfNullOrWhiteSpace(recipientEmail);
            ArgumentException.ThrowIfNullOrWhiteSpace(subject);
            ArgumentException.ThrowIfNullOrWhiteSpace(htmlBody);

            // Recipient and subject aren't logged: both can contain personal data (address, company name).
            _logger.LogDebug("Attempting to send email");

            // The EmailMessage overload is used instead of the plain string one so Reply-To can be set.
            var message = new EmailMessage(_emailSettings.SenderAddress, recipientEmail, new EmailContent(subject) { Html = htmlBody });
            if (!string.IsNullOrWhiteSpace(replyToEmail))
            {
                message.ReplyTo.Add(new EmailAddress(replyToEmail));
            }
            foreach (var file in attachments ?? [])
            {
                message.Attachments.Add(new EmailAttachment(file.FileName, file.ContentType, BinaryData.FromBytes(file.Content)));
            }

            try
            {
                var response = await _emailClient.SendAsync(WaitUntil.Completed, message, ct);
                _logger.LogInformation("Email sent successfully. Operation ID: {OperationId}", response.Id);
            }
            catch (RequestFailedException ex)
            {
                _logger.LogError(ex, "Azure Communication Services failed to send email. Error Code: {ErrorCode}", ex.ErrorCode);
                throw;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Unexpected error occurred while sending email");
                throw;
            }
        }
    }
}
