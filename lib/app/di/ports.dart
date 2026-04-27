part of 'register_dependencies.dart';

Future<void> _ports() async {
  getIt
    ..registerLazySingleton<LoggerService>(() => ConsoleLoggerService(isDevelopment: env.isDev))
    ..registerLazySingleton<MetricsService>(PrometheusMetricsService.new)
    ..registerLazySingleton<TokenService>(
      () => JwtTokenService(refreshKey: env(DotEnvKey.refreshTokenSecret), accessKey: env(DotEnvKey.accessTokenSecret)),
    )
    ..registerLazySingleton<HashService>(BcryptHashService.new)
    ..registerLazySingleton<UnitOfWork>(() => DriftUnitOfWork(db: getIt()))
    ..registerLazySingleton<EventBus>(InMemoryEventBus.new)
    ..registerLazySingleton<MailService>(() {
      final String domainName = env(DotEnvKey.domainName);
      final String assetsFolderPath = env(DotEnvKey.assetsPath);

      return env.useResend
          ? ResendMailService(
              assetsFolderPath: assetsFolderPath,
              domainName: domainName,
              client: ResendClient(apiKey: env(DotEnvKey.resendApiKey)),
              metricsService: getIt(),
              loggerService: getIt(),
            )
          : SmtpMailService(
              assetsFolderPath: assetsFolderPath,
              domainName: domainName,
              metricsService: getIt(),
              loggerService: getIt(),
              server: SmtpServer(
                env(DotEnvKey.smtpHost),
                port: int.parse(env(DotEnvKey.smtpPort)),
                allowInsecure: true,
              ),
            );
    })
    ..registerLazySingleton<UserRepository>(() => DriftUserRepository(db: getIt()));
}
