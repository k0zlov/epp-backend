// import 'package:drift/drift.dart';
// import 'package:drift/native.dart';
// import 'package:drift_postgres/drift_postgres.dart';
// import 'package:epp_backend/app/database/database.dart';
// import 'package:epp_backend/app/di/dot_env.dart';
// import 'package:postgres/postgres.dart';
//
// void main() async {
//   final sqliteExecutor = NativeDatabase.memory();
//   final sqliteDb = Database(sqliteExecutor);
//   print('Native');
//   await runDatabaseLogic(sqliteDb);
//   await sqliteDb.close();
//
//   final postgresExecutor = PgDatabase(
//     endpoint: Endpoint(
//       host: env(DotEnvKey.databaseHost),
//       port: int.parse(env(DotEnvKey.databasePort)),
//       database: env(DotEnvKey.databaseName),
//       username: env(DotEnvKey.databaseUsername),
//       password: env(DotEnvKey.databasePassword),
//     ),
//     settings: const ConnectionSettings(sslMode: SslMode.disable),
//   );
//
//   final pgDb = Database(postgresExecutor);
//   print('PostgreSQL');
//   await runDatabaseLogic(pgDb);
//   await pgDb.close();
// }
//
// Future<void> runDatabaseLogic(Database db) async {
//   const userId = 'user_uuid_1';
//
//   await db
//       .into(db.users)
//       .insert(
//         UsersCompanion.insert(
//           id: userId,
//           email: 'user@example.com',
//           passwordHash: 'hashed_password_string',
//           isVerified: false,
//           createdAt: DateTime.timestamp(),
//         ),
//       );
//
//   await (db.update(db.users)..where((u) => u.id.equals(userId))).write(
//     UsersCompanion(
//       updatedAt: Value(DateTime.now()),
//       isVerified: const Value(true),
//     ),
//   );
//   final user = await (db.select(db.users)..where((u) => u.id.equals(userId))).getSingle();
//
//   print(user.toJson());
// }
