import 'package:epp_backend/shared/application/base/infrastructure_error_code.dart';

class InfrastructureException implements Exception {
  InfrastructureException({
    required this.code,
    required this.message,
    this.details = const {},
    this.error,
    this.stackTrace,
  });

  final InfrastructureErrorCode code;
  final String message;
  final Map<String, dynamic> details;
  final dynamic error;
  final StackTrace? stackTrace;

  @override
  String toString() {
    final base = 'InfrastructureException[${code.value}]: $message';
    return details.isNotEmpty ? '$base | Details: $details' : base;
  }
}
