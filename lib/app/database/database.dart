import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';

part 'database.g.dart';

@DriftDatabase()
class Database extends _$Database {
  Database(super.e);

  @override
  int get schemaVersion => 1;
}
