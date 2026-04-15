import 'package:drift/drift.dart';

@DataClassName('UserRow')
class Users extends Table {
  TextColumn get id => text()();

  TextColumn get email => text().unique()();

  TextColumn get passwordHash => text()();

  BoolColumn get isVerified => boolean()();

  DateTimeColumn get deletedAt => dateTime().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
