using Hiflux.API.Models.Contact;
using Hiflux.API.Models.Notification;
using Hiflux.API.Services.Interface;
using Hiflux.API.Settings;
using Microsoft.Extensions.Options;

namespace Hiflux.API.Services.Notification
{
    public class NotificationService : INotificationService
    {
        private readonly IEmailTemplateService _templateService;
        private readonly IEmailService _emailService;
        private readonly EmailSettings _emailSettings;
        private readonly ILogger<NotificationService> _logger;
        public NotificationService(IEmailTemplateService templateService, IEmailService emailService, IOptions<EmailSettings> options, ILogger<NotificationService> logger)
        {
            _templateService = templateService;
            _emailService = emailService;
            _emailSettings = options.Value;
            _logger = logger;
        }
        /// <summary>
        /// Sends the customer receipt and internal staff notification emails for a new enquiry.
        /// Each email is sent independently, so a failure sending one does not prevent the other.
        /// </summary>
        /// <returns>A <see cref="NotificationResult"/> indicating which of the two emails were sent successfully.</returns>
        public async Task<NotificationResult> HandleNewEnquiryAsync(ContactEnquiry enquiry, CancellationToken ct = default)
        {
            var result = new NotificationResult();
            try
            {
                await SendEnquiryInternalNotificationAsync(enquiry, ct);
                result.InternalNotificationSent = true;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Failed to send internal enquiry notification");
            }

            try
            {
                await SendEnquiryReceiptAsync(enquiry, ct);
                result.ReceiptSent = true;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Failed to send enquiry receipt");
            }
            return result;
        }
        /// <summary>
        /// Renders and sends the receipt email back to the customer who submitted an enquiry.
        /// </summary>
        private async Task SendEnquiryReceiptAsync(ContactEnquiry enquiry, CancellationToken ct)
        {
            var body = await _templateService.GetEnquiryReceiptHtmlAsync(enquiry);
            await _emailService.SendEmailAsync(enquiry.Email, "We've received your enquiry", body, ct: ct);
        }
        /// <summary>
        /// Renders and sends the internal staff notification email for a new enquiry,
        /// to the address configured in <see cref="EmailSettings.InternalAddressEmail"/>.
        /// Reply-To is the customer, so staff can answer straight from their inbox.
        /// </summary>
        private async Task SendEnquiryInternalNotificationAsync(ContactEnquiry enquiry, CancellationToken ct)
        {
            var body = await _templateService.GetEnquiryInternalHtmlAsync(enquiry);
            var subject = string.IsNullOrWhiteSpace(enquiry.Company)
                ? $"New Enquiry from {enquiry.Name}"
                : $"New Enquiry from {enquiry.Company}";
            await _emailService.SendEmailAsync(_emailSettings.InternalAddressEmail, subject, body, replyToEmail: enquiry.Email, ct: ct);
        }
    }
}
