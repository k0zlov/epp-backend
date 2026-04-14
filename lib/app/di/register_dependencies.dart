import 'package:drift_postgres/drift_postgres.dart';
import 'package:epp_backend/app/database/database.dart';
import 'package:epp_backend/app/di/dot_env.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/infrastructure/infrastructure.dart';
import 'package:epp_backend/shared/presentation/presentation.dart';

import 'package:get_it/get_it.dart';
import 'package:mailer/smtp_server.dart';
import 'package:postgres/postgres.dart';

final GetIt getIt = GetIt.instance;

Future<void> registerDependencies() async {
  await _database();
  await _services();
  await _middlewares();
  await _wsManager();
  await _routes();
}

Future<void> _database() async {
  getIt.registerLazySingleton<Database>(
    () => Database(
      PgDatabase(
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

Future<void> _services() async {
  getIt
    ..registerLazySingleton<LoggerService>(ConsoleLoggerService.new)
    ..registerLazySingleton<TokenService>(
      () => JwtTokenService(refreshKey: env(DotEnvKey.refreshTokenKey), accessKey: env(DotEnvKey.accessTokenKey)),
    )
    ..registerLazySingleton<UnitOfWork>(() => DriftUnitOfWork(db: getIt()))
    ..registerLazySingleton<EventBus>(InMemoryEventBus.new)
    ..registerLazySingleton<EventProjector>(() => RegistryEventProjector([]))
    ..registerLazySingleton<MailService>(
      () => SmtpMailService(
        templatesPath: 'assets/mail_templates',
        domainTitle: env(DotEnvKey.domainTitle),
        server: SmtpServer(env(DotEnvKey.smtpHost), port: int.parse(env(DotEnvKey.smtpPort)), allowInsecure: true),
      ),
    );
}

Future<void> _middlewares() async {
  getIt
    ..registerLazySingleton<AuthMiddleware>(() => AuthMiddleware(tokenService: getIt()))
    ..registerLazySingleton<ErrorMiddleware>(() => ErrorMiddleware(loggerService: getIt()));
}

Future<void> _wsManager() async {
  getIt.registerLazySingleton<WsManager>(WsManager.new);
}

Future<void> _routes() async {
  getIt.registerLazySingleton<WsRoute>(() => WsRoute(wsManager: getIt()));
}
