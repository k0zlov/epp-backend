import 'package:drift/drift.dart';
import 'package:epp_backend/contexts/auth/domain/enums/auth_token_type.dart';
import 'package:epp_backend/contexts/auth/infrastructure/tables/users.dart';

@DataClassName('AuthTokenRow')
@TableIndex(name: 'tokens_user_id_idx', columns: {#userId})
@TableIndex(name: 'tokens_hash_idx', columns: {#tokenHash})
class AuthTokens extends Table {
  TextColumn get id => text()();

  TextColumn get userId => text().references(Users, #id, onDelete: KeyAction.cascade)();

  TextColumn get tokenHash => text()();

  TextColumn get type => textEnum<AuthTokenType>()();

  DateTimeColumn get expiresAt => dateTime()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
