import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';
import 'package:epp_backend/contexts/auth/infrastructure/tables/auth_sessions.dart';
import 'package:epp_backend/contexts/auth/infrastructure/tables/auth_tokens.dart';
import 'package:epp_backend/contexts/auth/infrastructure/tables/users.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Users,
    AuthSessions,
    AuthTokens,
  ],
)
class Database extends _$Database {
  Database(super.e);

  @override
  int get schemaVersion => 1;
}
