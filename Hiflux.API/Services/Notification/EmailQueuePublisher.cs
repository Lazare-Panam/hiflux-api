using System.Text.Json;
using Azure.Storage.Queues;
using Hiflux.API.Services.Interface;
using Hiflux.API.Settings;
using Microsoft.Extensions.Options;

namespace Hiflux.API.Services.Notification
{
    public class EmailQueuePublisher : IEmailQueuePublisher
    {
        private readonly QueueClient _queueClient;
        private readonly ILogger<EmailQueuePublisher> _logger;

        public EmailQueuePublisher(IOptions<QueueSettings> options, ILogger<EmailQueuePublisher> logger)
        {
            var settings = options.Value;
            var queueOptions = new QueueClientOptions { MessageEncoding = QueueMessageEncoding.Base64 };
            _queueClient = new QueueClient(settings.ConnectionString, settings.QueueName, queueOptions);
            _logger = logger;
        }

        /// <inheritdoc />
        public async Task EnqueueAsync(string email, string subject, string htmlBody, CancellationToken ct = default)
        {
            ArgumentException.ThrowIfNullOrWhiteSpace(email);
            ArgumentException.ThrowIfNullOrWhiteSpace(subject);
            ArgumentException.ThrowIfNullOrWhiteSpace(htmlBody);
            await _queueClient.CreateIfNotExistsAsync(cancellationToken: ct);
            var payload = JsonSerializer.Serialize(new { email, subject, body = htmlBody });
            await _queueClient.SendMessageAsync(payload, ct);
            _logger.LogInformation("Email request enqueued for delivery");
        }
    }
}
