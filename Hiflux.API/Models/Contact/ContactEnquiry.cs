using System.ComponentModel.DataAnnotations;

namespace Hiflux.API.Models.Contact
{
    public class ContactEnquiry
    {
        [Required, StringLength(100)]
        public string Name { get; set; } = string.Empty;

        [Required, EmailAddress, StringLength(254)]
        public string Email { get; set; } = string.Empty;

        [StringLength(150)]
        public string? Company { get; set; }

        [StringLength(100)]
        public string? Country { get; set; }

        [StringLength(150)]
        public string? ProductOrPartNumber { get; set; }

        [Required, StringLength(5000, MinimumLength = 10)]
        public string Message { get; set; } = string.Empty;

        // Honeypot: hidden on the form, so real users leave it empty and bots tend to fill it in.
        public string? Website { get; set; }
    }
}
