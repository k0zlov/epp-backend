enum InfrastructureErrorCode {
  // Database
  dbInternalError('db_internal_error', 'database'),
  dbConnectionFailed('db_connection_failed', 'database'),

  // Mail
  mailProviderFailure('mail_provider_failure', 'mail_service'),
  mailRateLimit('mail_rate_limit', 'mail_service'),
  mailInvalidRecipient('mail_invalid_recipient', 'mail_service'),

  // Services
  hashServiceFailure('hash_service_failure', 'crypto_service'),

  // General
  internalError('internal_error', 'infrastructure'),
  unexpectedError('unexpected_error', 'infrastructure')
  ;

  const InfrastructureErrorCode(this.value, this.service);

  final String value;
  final String service;
}
