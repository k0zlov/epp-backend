import 'package:epp_backend/app/database/database.dart';
import 'package:epp_backend/shared/application/ports/unit_of_work.dart';

class DriftUnitOfWork implements UnitOfWork {
  const DriftUnitOfWork({required this.db});

  final Database db;

  @override
  Future<T> execute<T>(Future<T> Function() action) {
    return db.transaction<T>(action);
  }
}
