using Hiflux.API.Models.Contact;

namespace Hiflux.API.Services.Interface
{
    public interface IEmailTemplateService
    {
        /// <summary>
        /// Builds the HTML body for the receipt email sent back to the customer who submitted an enquiry.
        /// </summary>
        /// <returns>Rendered HTML of the <c>NewEnquiry.razor</c> template.</returns>
        Task<string> GetEnquiryReceiptHtmlAsync(ContactEnquiry enquiry, string? billOfMaterialsFileName = null);

        /// <summary>
        /// Builds the HTML body for the internal notification email alerting staff to a new enquiry.
        /// </summary>
        /// <returns>Rendered HTML of the <c>InternalNewEnquiry.razor</c> template.</returns>
        Task<string> GetEnquiryInternalHtmlAsync(ContactEnquiry enquiry, string? billOfMaterialsFileName = null);
    }
}
