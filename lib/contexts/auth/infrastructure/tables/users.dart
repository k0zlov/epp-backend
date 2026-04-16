import 'package:drift/drift.dart';
import 'package:epp_backend/contexts/auth/domain/domain.dart';
import 'package:epp_backend/shared/infrastructure/converters/vo_converter.dart';

@DataClassName('UserRow')
class Users extends Table {
  TextColumn get id => text()();

  TextColumn get email => text().unique().map(
    VoConverter<Email, String>(fromValue: Email.new, toValue: (vo) => vo.value),
  )();

  TextColumn get passwordHash => text()();

  BoolColumn get isVerified => boolean()();

  DateTimeColumn get deletedAt => dateTime().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
