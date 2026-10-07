namespace Hiflux.API.Models.Notification
{
    // A file to attach to an email. Kept provider-neutral so nothing outside EmailService depends on ACS types.
    public class EmailFileAttachment
    {
        public string FileName { get; set; } = string.Empty;
        public string ContentType { get; set; } = string.Empty;
        public byte[] Content { get; set; } = [];
    }
}
