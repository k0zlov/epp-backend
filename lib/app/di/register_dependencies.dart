import 'package:drift_postgres/drift_postgres.dart';
import 'package:epp_backend/app/database/database.dart';
import 'package:epp_backend/app/di/dot_env.dart';
import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/contexts/auth/presentation/listeners/user_logged_out_listener.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/infrastructure/infrastructure.dart';
import 'package:epp_backend/shared/presentation/presentation.dart';

import 'package:get_it/get_it.dart';
import 'package:mailer/smtp_server.dart';
import 'package:postgres/postgres.dart';
import 'package:ruta/open_api.dart';

final GetIt getIt = GetIt.instance;

Future<void> registerDependencies() async {
  await _database();
  await _services();
  await _projector();
  await _repositories();
  await _middlewares();
  await _wsManager();
  await _useCases();
  await _failureMappers();
  await _controllers();
  await _listeners();
  await _routes();
}

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

Future<void> _services() async {
  getIt
    ..registerLazySingleton<LoggerService>(ConsoleLoggerService.new)
    ..registerLazySingleton<TokenService>(
      () => JwtTokenService(refreshKey: env(DotEnvKey.refreshTokenKey), accessKey: env(DotEnvKey.accessTokenKey)),
    )
    ..registerLazySingleton<HashService>(BcryptHashService.new)
    ..registerLazySingleton<UnitOfWork>(() => DriftUnitOfWork(db: getIt()))
    ..registerLazySingleton<EventBus>(InMemoryEventBus.new)
    ..registerLazySingleton<MailService>(
      () => SmtpMailService(
        templatesFolderPath: 'assets/mail_templates',
        domainTitle: env(DotEnvKey.domainTitle),
        server: SmtpServer(env(DotEnvKey.smtpHost), port: int.parse(env(DotEnvKey.smtpPort)), allowInsecure: true),
      ),
    );
}

Future<void> _projector() async {
  getIt.registerLazySingleton<EventProjector>(
    () => RegistryEventProjector([
      UserSignedUpProjector(db: getIt()),
      UserLoggedInProjector(db: getIt()),
      EmailConfirmationFailedProjector(db: getIt()),
      EmailConfirmedProjector(db: getIt()),
      AuthCodeCreatedProjector(db: getIt()),
      AuthSessionRefreshedProjector(db: getIt()),
      AuthTokenReuseDetectedProjector(db: getIt()),
      PasswordResetFailedProjector(db: getIt()),
      UserPasswordResetProjector(db: getIt()),
      UserLoggedOutProjector(db: getIt()),
    ]),
  );
}

Future<void> _repositories() async {
  getIt.registerLazySingleton<UserRepository>(() => DriftUserRepository(db: getIt()));
}

Future<void> _middlewares() async {
  getIt
    ..registerLazySingleton<AuthMiddleware>(() => AuthMiddleware(tokenService: getIt()))
    ..registerLazySingleton<ErrorMiddleware>(() => ErrorMiddleware(loggerService: getIt()));
}

Future<void> _wsManager() async {
  getIt.registerLazySingleton<WsManager>(WsManager.new);
}

Future<void> _useCases() async {
  getIt
    ..registerLazySingleton(
      () => SignUpUseCase(
        projector: getIt(),
        repository: getIt(),
        unitOfWork: getIt(),
        hashService: getIt(),
        eventBus: getIt(),
      ),
    )
    ..registerLazySingleton(
      () => LoginUseCase(
        hashService: getIt(),
        tokenService: getIt(),
        unitOfWork: getIt(),
        projector: getIt(),
        repository: getIt(),
        eventBus: getIt(),
      ),
    )
    ..registerLazySingleton(
      () => SendAuthCodeUseCase(
        mailService: getIt(),
        hashService: getIt(),
        repository: getIt(),
        unitOfWork: getIt(),
        eventBus: getIt(),
        projector: getIt(),
      ),
    )
    ..registerLazySingleton(
      () => ConfirmEmailUseCase(
        unitOfWork: getIt(),
        repository: getIt(),
        hashService: getIt(),
        projector: getIt(),
        eventBus: getIt(),
      ),
    )
    ..registerLazySingleton(
      () => RefreshSessionUseCase(
        unitOfWork: getIt(),
        repository: getIt(),
        hashService: getIt(),
        projector: getIt(),
        eventBus: getIt(),
        tokenService: getIt(),
      ),
    )
    ..registerLazySingleton(
      () => LogoutUseCase(
        unitOfWork: getIt(),
        repository: getIt(),
        projector: getIt(),
        eventBus: getIt(),
      ),
    )
    ..registerLazySingleton(
      () => ConfirmPasswordResetUseCase(
        unitOfWork: getIt(),
        repository: getIt(),
        eventBus: getIt(),
        projector: getIt(),
        hashService: getIt(),
      ),
    );
}

Future<void> _failureMappers() async {
  getIt.registerLazySingleton<AuthFailureMapper>(AuthFailureMapper.new);
}

Future<void> _controllers() async {
  getIt
    ..registerLazySingleton<AuthController>(
      () => AuthController(
        failureMapper: getIt(),
        signUpUseCase: getIt(),
        loginUseCase: getIt(),
        confirmEmailUseCase: getIt(),
        sendAuthCodeUseCase: getIt(),
        logoutUseCase: getIt(),
        refreshSessionUseCase: getIt(),
        confirmPasswordResetUseCase: getIt(),
      ),
    )
    ..registerSingleton(UserWsController(manager: getIt()));
}

Future<void> _routes() async {
  getIt
    ..registerLazySingleton<OpenApiSpec>(
      () => const OpenApiSpec(
        info: OpenApiInfo(version: '1.0', title: 'EPP'),
      ),
    )
    ..registerLazySingleton<WsRoute>(() => WsRoute(wsManager: getIt()));
}

Future<void> _listeners() async {
  getIt
    ..registerSingleton(AuthCodeCreatedListener(eventBus: getIt()))
    ..registerSingleton(AuthSessionRefreshedListener(eventBus: getIt()))
    ..registerSingleton(AuthTokenReuseDetectedListener(eventBus: getIt()))
    ..registerSingleton(EmailConfirmationFailedListener(eventBus: getIt()))
    ..registerSingleton(EmailConfirmedListener(eventBus: getIt()))
    ..registerSingleton(PasswordResetFailedListener(eventBus: getIt()))
    ..registerSingleton(UserLoggedInListener(eventBus: getIt()))
    ..registerSingleton(UserLoggedOutListener(eventBus: getIt()))
    ..registerSingleton(UserPasswordResetListener(eventBus: getIt()))
    ..registerSingleton(UserSignedUpListener(eventBus: getIt()))
    ..registerSingleton(UserLoggedOutIntegrationListener(eventBus: getIt(), wsManager: getIt()));
}
