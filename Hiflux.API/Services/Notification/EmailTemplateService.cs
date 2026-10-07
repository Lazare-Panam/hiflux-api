using Hiflux.API.EmailTemplates;
using Hiflux.API.Models.Contact;
using Hiflux.API.Services.Interface;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Web;

namespace Hiflux.API.Services.Notification
{
    public class EmailTemplateService : IEmailTemplateService
    {
        private readonly HtmlRenderer _htmlRenderer;
        private readonly ILogger<EmailTemplateService> _logger;
        public EmailTemplateService(HtmlRenderer htmlRenderer, ILogger<EmailTemplateService> logger)
        {
            _htmlRenderer = htmlRenderer;
            _logger = logger;
        }
        /// <summary>
        /// Builds the HTML body for the receipt email sent back to the customer who submitted an enquiry.
        /// </summary>
        /// <returns>Rendered HTML of the <c>NewEnquiry.razor</c> template.</returns>
        public Task<string> GetEnquiryReceiptHtmlAsync(ContactEnquiry enquiry, string? billOfMaterialsFileName = null) =>
            RenderAsync<NewEnquiry>(new Dictionary<string, object?>
            {
                { nameof(NewEnquiry.Enquiry), enquiry },
                { nameof(NewEnquiry.BillOfMaterialsFileName), billOfMaterialsFileName }
            });

        /// <summary>
        /// Builds the HTML body for the internal notification email alerting staff to a new enquiry.
        /// </summary>
        /// <returns>Rendered HTML of the <c>InternalNewEnquiry.razor</c> template.</returns>
        public Task<string> GetEnquiryInternalHtmlAsync(ContactEnquiry enquiry, string? billOfMaterialsFileName = null) =>
            RenderAsync<InternalNewEnquiry>(new Dictionary<string, object?>
            {
                { nameof(InternalNewEnquiry.Enquiry), enquiry },
                { nameof(InternalNewEnquiry.BillOfMaterialsFileName), billOfMaterialsFileName }
            });

        /// <summary>
        /// Renders a Razor component from <c>EmailTemplates/</c> to an HTML string.
        /// Razor HTML-encodes every <c>@value</c> automatically, so user input can never inject markup into an email.
        /// </summary>
        /// <typeparam name="TComponent">The template component to render, e.g. <see cref="NewEnquiry"/>.</typeparam>
        /// <param name="parameters">The component's <c>[Parameter]</c> values, keyed by property name.</param>
        /// <returns>The rendered HTML.</returns>
        private async Task<string> RenderAsync<TComponent>(Dictionary<string, object?> parameters) where TComponent : IComponent
        {
            // HtmlRenderer must run its work on its own Dispatcher (one render at a time).
            var html = await _htmlRenderer.Dispatcher.InvokeAsync(async () =>
            {
                var output = await _htmlRenderer.RenderComponentAsync<TComponent>(ParameterView.FromDictionary(parameters));
                return output.ToHtmlString();
            });
            _logger.LogDebug("Rendered email template: {Template}", typeof(TComponent).Name);
            return html;
        }
    }
}
