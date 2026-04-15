import 'package:epp_backend/app/database/database.dart';
import 'package:epp_backend/shared/application/application.dart';

class DriftUnitOfWork implements UnitOfWork {
  const DriftUnitOfWork({required this.db});

  final Database db;

  @override
  Future<T> execute<T>(
    Future<T> Function() action, {
    String errorMessage = 'Transaction failed during unit of work execution',
  }) {
    try {
      return db.transaction<T>(action);
    } on Exception catch (e, st) {
      if (e is InfrastructureException) rethrow;

      throw InfrastructureException(message: errorMessage, error: e, stackTrace: st);
    }
  }
}
