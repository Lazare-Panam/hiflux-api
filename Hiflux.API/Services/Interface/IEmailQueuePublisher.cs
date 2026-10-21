namespace Hiflux.API.Services.Interface
{
    public interface IEmailQueuePublisher
    {
        /// <summary>
        /// Drops an email request onto the notifications queue. The email is not sent here;
        /// the queue-triggered function is responsible for the actual delivery via ACS.
        /// </summary>
        /// <param name="email">The recipient's email address.</param>
        /// <param name="subject">The email subject line.</param>
        /// <param name="htmlBody">The rendered HTML body to send.</param>
        /// <param name="ct">Cancellation token for the enqueue operation.</param>
        Task EnqueueAsync(string email, string subject, string htmlBody, CancellationToken ct = default);
    }
}
