part of 'register_dependencies.dart';

Future<void> _ports() async {
  getIt
    ..registerLazySingleton<LoggerService>(ConsoleLoggerService.new)
    ..registerLazySingleton<MetricsService>(PrometheusMetricsService.new)
    ..registerLazySingleton<TokenService>(
      () => JwtTokenService(refreshKey: env(DotEnvKey.refreshTokenKey), accessKey: env(DotEnvKey.accessTokenKey)),
    )
    ..registerLazySingleton<HashService>(BcryptHashService.new)
    ..registerLazySingleton<UnitOfWork>(() => DriftUnitOfWork(db: getIt()))
    ..registerLazySingleton<EventBus>(InMemoryEventBus.new)
    ..registerLazySingleton<MailService>(
      // () => SmtpMailService(
      //   templatesFolderPath: 'assets/mail_templates',
      //   domainTitle: env(DotEnvKey.domainTitle),
      //   server: SmtpServer(env(DotEnvKey.smtpHost), port: int.parse(env(DotEnvKey.smtpPort)), allowInsecure: true),
      // ),
      () => ResendMailService(
        templatesFolderPath: 'assets/mail_templates',
        domainTitle: env(DotEnvKey.domainTitle),
        client: ResendClient(apiKey: env(DotEnvKey.resendApikey)),
      ),
    )
    ..registerLazySingleton<UserRepository>(() => DriftUserRepository(db: getIt()));
}
