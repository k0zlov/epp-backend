import 'package:epp_backend/shared/application/base/infrastructure_error_code.dart';

class InfrastructureException implements Exception {
  InfrastructureException({
    required this.code,
    required this.message,
    this.error,
    this.stackTrace,
  });

  final InfrastructureErrorCode code;
  final String message;
  final dynamic error;
  final StackTrace? stackTrace;

  @override
  String toString() => 'InfrastructureException[${code.value}]: $message';
}
