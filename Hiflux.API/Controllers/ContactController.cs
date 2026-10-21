using Hiflux.API.Models.Contact;
using Hiflux.API.Services.Interface;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.RateLimiting;

namespace Hiflux.API.Controllers
{
    [ApiController]
    [Route("api/contact")]
    public class ContactController : ControllerBase
    {
        private readonly INotificationService _notificationService;
        private readonly ILogger<ContactController> _logger;

        public ContactController(INotificationService notificationService, ILogger<ContactController> logger)
        {
            _notificationService = notificationService;
            _logger = logger;
        }

        // [ApiController] returns 400 with the field errors automatically if the enquiry fails validation.
        [HttpPost]
        [EnableRateLimiting("ContactForm")]
        public async Task<IActionResult> SubmitEnquiry([FromBody] ContactEnquiry enquiry, CancellationToken ct)
        {
            if (!string.IsNullOrEmpty(enquiry.Website))
            {
                // Honeypot was filled in, so it's a bot. Pretend it worked and send nothing.
                _logger.LogWarning("Contact form honeypot triggered, enquiry discarded");
                return Ok(new { message = "Thanks, your enquiry has been sent." });
            }

            var result = await _notificationService.HandleNewEnquiryAsync(enquiry, ct);
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
