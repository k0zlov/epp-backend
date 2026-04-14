class InfrastructureException implements Exception {
  InfrastructureException({
    required this.message,
    this.error,
    this.stackTrace,
  });

  final String message;
  final dynamic error;
  final StackTrace? stackTrace;

  @override
  String toString() => 'InfrastructureException: $message';
}
