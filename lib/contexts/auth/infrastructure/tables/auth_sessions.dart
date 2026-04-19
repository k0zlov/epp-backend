import 'package:drift/drift.dart';
import 'package:epp_backend/contexts/auth/infrastructure/tables/users.dart';

@DataClassName('AuthSessionRow')
@TableIndex(name: 'sessions_user_id_idx', columns: {#userId})
@TableIndex(name: 'sessions_refresh_token_idx', columns: {#refreshToken})
class AuthSessions extends Table {
  TextColumn get id => text()();

  TextColumn get userId => text().references(Users, #id, onDelete: KeyAction.cascade)();

  TextColumn get tokenHash => text()();

  TextColumn get ipAddress => text()();

  TextColumn get userAgent => text()();

  DateTimeColumn get expiresAt => dateTime()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
