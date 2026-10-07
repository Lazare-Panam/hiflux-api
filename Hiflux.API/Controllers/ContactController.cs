using Hiflux.API.Models.Contact;
using Hiflux.API.Models.Notification;
using Hiflux.API.Services.Interface;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.RateLimiting;

namespace Hiflux.API.Controllers
{
    [ApiController]
    [Route("api/contact")]
    public class ContactController : ControllerBase
    {
        // ACS caps a whole email at 10 MB, and attachments grow about a third when base64-encoded.
        private const long MaxBillOfMaterialsBytes = 5 * 1024 * 1024;

        // Extension -> content type. The browser's content type is not trusted, only the extension we allow.
        private static readonly Dictionary<string, string> AllowedBillOfMaterialsTypes = new(StringComparer.OrdinalIgnoreCase)
        {
            { ".pdf", "application/pdf" },
            { ".xlsx", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" },
            { ".xls", "application/vnd.ms-excel" },
            { ".csv", "text/csv" },
            { ".docx", "application/vnd.openxmlformats-officedocument.wordprocessingml.document" },
        };

        private readonly INotificationService _notificationService;
        private readonly ILogger<ContactController> _logger;

        public ContactController(INotificationService notificationService, ILogger<ContactController> logger)
        {
            _notificationService = notificationService;
            _logger = logger;
        }

        // Sent as multipart/form-data so the form can include an optional BOM file.
        // [ApiController] returns 400 with the field errors automatically if the enquiry fails validation.
        [HttpPost]
        [EnableRateLimiting("ContactForm")]
        [RequestSizeLimit(MaxBillOfMaterialsBytes + 1024 * 1024)]
        [RequestFormLimits(MultipartBodyLengthLimit = MaxBillOfMaterialsBytes + 1024 * 1024)]
        public async Task<IActionResult> SubmitEnquiry([FromForm] ContactEnquiry enquiry, IFormFile? billOfMaterials, CancellationToken ct)
        {
            if (!string.IsNullOrEmpty(enquiry.Website))
            {
                // Honeypot was filled in, so it's a bot. Pretend it worked and send nothing.
                _logger.LogWarning("Contact form honeypot triggered, enquiry discarded");
                return Ok(new { message = "Thanks, your enquiry has been sent." });
            }

            EmailFileAttachment? attachment = null;
            if (billOfMaterials is { Length: > 0 })
            {
                var extension = Path.GetExtension(billOfMaterials.FileName);
                if (!AllowedBillOfMaterialsTypes.TryGetValue(extension, out var contentType))
                {
                    ModelState.AddModelError(nameof(billOfMaterials), "Bill of materials must be a PDF, Excel, CSV or Word file.");
                    return ValidationProblem(ModelState);
                }
                if (billOfMaterials.Length > MaxBillOfMaterialsBytes)
                {
                    ModelState.AddModelError(nameof(billOfMaterials), "Bill of materials must be 5 MB or smaller.");
                    return ValidationProblem(ModelState);
                }

                using var stream = new MemoryStream();
                await billOfMaterials.CopyToAsync(stream, ct);
                attachment = new EmailFileAttachment
                {
                    // Strip any folder path a browser might send; the name is shown in the email, so keep it plain.
                    FileName = Path.GetFileName(billOfMaterials.FileName),
                    ContentType = contentType,
                    Content = stream.ToArray()
                };
            }

            var result = await _notificationService.HandleNewEnquiryAsync(enquiry, attachment, ct);
            if (!result.InternalNotificationSent)
            {
                // Sales never got it, so tell the customer instead of pretending it worked.
                return StatusCode(StatusCodes.Status503ServiceUnavailable,
                    new { message = "Sorry, we couldn't send your enquiry right now. Please email sales@hiflux.uk.com directly." });
            }

            return Ok(new { message = "Thanks, your enquiry has been sent." });
        }
    }
}
