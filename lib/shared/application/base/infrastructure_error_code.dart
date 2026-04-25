enum InfrastructureErrorCode {
  internalError('internal_error'),
  unexpectedError('unexpected_error'),
  dbInternalError('db_internal_error'),
  dbConnectionFailed('db_connection_failed'),
  mailProviderFailure('mail_provider_failure'),
  mailRateLimit('mail_rate_limit'),
  mailInvalidRecipient('mail_invalid_recipient'),
  hashServiceFailure('hash_service_failure'),
  externalApiFailure('external_api_failure')
  ;

  const InfrastructureErrorCode(this.value);

  final String value;
}
