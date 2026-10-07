using Hiflux.API.Models.Contact;
using Hiflux.API.Models.Notification;

namespace Hiflux.API.Services.Interface
{
    public interface INotificationService
    {
        /// <summary>
        /// Sends the customer receipt and internal staff notification emails for a new enquiry.
        /// Each email is sent independently, so a failure sending one does not prevent the other.
        /// </summary>
        /// <param name="enquiry">The submitted form fields.</param>
        /// <param name="billOfMaterials">Optional BOM file; attached to the internal email only, never to the customer receipt.</param>
        /// <param name="ct">Cancellation token.</param>
        /// <returns>A <see cref="NotificationResult"/> indicating which of the two emails were sent successfully.</returns>
        Task<NotificationResult> HandleNewEnquiryAsync(ContactEnquiry enquiry, EmailFileAttachment? billOfMaterials = null, CancellationToken ct = default);
    }
}
