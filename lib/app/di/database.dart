part of 'register_dependencies.dart';

Future<void> _database() async {
  getIt.registerLazySingleton<Database>(
    () => Database(
      PgDatabase(
        settings: const ConnectionSettings(sslMode: SslMode.disable),
        endpoint: Endpoint(
          host: env(DotEnvKey.databaseHost),
          port: int.parse(env(DotEnvKey.databasePort)),
          database: env(DotEnvKey.databaseName),
          username: env(DotEnvKey.databaseUsername),
          password: env(DotEnvKey.databasePassword),
        ),
      ),
    ),
  );
}
