import 'package:epp_backend/app/database/database.dart';
import 'package:epp_backend/shared/application/application.dart';

class DriftUnitOfWork implements UnitOfWork {
  const DriftUnitOfWork({required this.db});

  final Database db;

  @override
  Future<T> execute<T>(Future<T> Function() action) {
    return db.transaction<T>(action);
  }
}
