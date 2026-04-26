import 'package:dotenv/dotenv.dart';

/// A singleton instance of DotEnv used for loading and accessing environment variables.
final DotEnv env = DotEnv(includePlatformEnvironment: true)..load(['.env']);

/// Enum representing all the keys used for environment variables.
enum DotEnvKey {
  // --- App Config ---
  /// Application mode (dev, prod).
  appMode('APP_MODE'),

  /// Application port.
  appPort('APP_PORT'),

  /// Domain name of the application.
  domainName('DOMAIN_NAME'),

  /// Base URL for the application.
  baseUrl('BASE_URL'),

  // --- Security ---
  /// Secret key for Access Token.
  accessTokenSecret('ACCESS_TOKEN_SECRET'),

  /// Secret key for Refresh Token.
  refreshTokenSecret('REFRESH_TOKEN_SECRET'),

  // --- Database ---
  databaseHost('DATABASE_HOST'),
  databaseName('DATABASE_NAME'),
  databasePassword('DATABASE_PASSWORD'),
  databasePort('DATABASE_PORT'),
  databaseUsername('DATABASE_USERNAME'),

  // --- Mail Services ---
  /// Active mail service (smtp, resend).
  mailService('MAIL_SERVICE'),
  smtpHost('SMTP_HOST'),
  smtpPort('SMTP_PORT'),
  resendApiKey('RESEND_API_KEY'),

  // --- Assets ---
  /// Path to assets folder.
  assetsPath('ASSETS_PATH'),

  // --- Monitoring ---
  grafanaPassword('GRAFANA_PASSWORD')
  ;

  /// The name of the environment variable this key corresponds to.
  const DotEnvKey(this.name);

  final String name;
}

/// Extension on [DotEnv] to simplify access to environment variables.
extension DotEnvExtension on DotEnv {
  /// Retrieves the raw string value for a [DotEnvKey].
  String call(DotEnvKey key) {
    final String name = key.name;
    if (!isDefined(name)) {
      throw Exception('Environment variable was not defined: $name');
    }
    return getOrElse(name, () => '');
  }

  // --- Helper Getters ---

  bool get useResend => this(DotEnvKey.mailService) == 'resend';

  /// Returns true if the application is running in development mode.
  bool get isDev => this(DotEnvKey.appMode) == 'dev';

  /// Returns true if the application is running in production mode.
  bool get isProd => this(DotEnvKey.appMode) == 'prod';

  /// Returns the application port as an integer.
  int get port => int.parse(this(DotEnvKey.appPort));

  /// Returns the full assets path.
  /// In prod, it might need to be an absolute path depending on your Docker setup.
  String get assetsPath => this(DotEnvKey.assetsPath);

  /// Helper to get database port as int.
  int get dbPort => int.parse(this(DotEnvKey.databasePort));
}
