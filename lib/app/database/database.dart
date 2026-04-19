import 'package:drift/drift.dart';
import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/infrastructure/infrastructure.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Users,
    AuthSessions,
    AuthCodes,
  ],
)
class Database extends _$Database {
  Database(super.e);

  @override
  int get schemaVersion => 1;
}
