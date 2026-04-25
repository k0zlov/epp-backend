import 'package:drift/drift.dart';
import 'package:epp_backend/contexts/auth/domain/enums/auth_code_type.dart';
import 'package:epp_backend/contexts/auth/infrastructure/tables/users.dart';

@DataClassName('AuthCodeRow')
@TableIndex(name: 'codes_user_id_idx', columns: {#userId})
@TableIndex(name: 'codes_hash_idx', columns: {#hash})
class AuthCodes extends Table {
  TextColumn get id => text()();

  TextColumn get userId => text().references(Users, #id, onDelete: KeyAction.cascade)();

  TextColumn get hash => text()();

  TextColumn get type => textEnum<AuthCodeType>()();

  IntColumn get attempts => integer()();

  DateTimeColumn get usedAt => dateTime().nullable()();

  DateTimeColumn get invalidatedAt => dateTime().nullable()();

  DateTimeColumn get expiresAt => dateTime()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
