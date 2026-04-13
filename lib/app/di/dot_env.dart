import 'package:dotenv/dotenv.dart';

/// A singleton instance of DotEnv used for loading and accessing environment variables.
final DotEnv env = DotEnv(includePlatformEnvironment: true)..load(['.env']);

/// Enum representing all the keys used for environment variables.
///
/// Each key maps to a corresponding environment variable in the `.env` file or
/// system environment. This enum ensures type safety and avoids typos when
/// accessing environment variables.
enum DotEnvKey {
  /// Host for the database.
  databaseHost('DATABASE_HOST'),

  /// Name of the database.
  databaseName('DATABASE_NAME'),

  /// Password for the database.
  databasePassword('DATABASE_PASSWORD'),

  /// Port for the database.
  databasePort('DATABASE_PORT'),

  /// Username for the database.
  databaseUsername('DATABASE_USERNAME'),
  accessTokenKey('ACCESS_TOKEN_SECRET'),
  refreshTokenKey('REFRESH_TOKEN_SECRET'),
  smtpHost('SMTP_HOST'),
  smtpPort('SMTP_PORT')
  ;

  /// The name of the environment variable this key corresponds to.
  const DotEnvKey(this.name);

  /// The key name as a string.
  final String name;
}

/// Extension on [DotEnv] to simplify access to environment variables using [DotEnvKey].
///
/// Provides a callable syntax to retrieve the value of the environment variable
/// associated with a given [DotEnvKey].
extension DotEnvExtension on DotEnv {
  /// Retrieves the value of the environment variable associated with [key].
  ///
  /// Throws an exception if the variable is not defined in the environment.
  ///
  /// Example:
  /// ```dart
  /// final version = env(DotEnvKey.version);
  /// ```
  String call(DotEnvKey key) {
    final String name = key.name;

    if (!isDefined(name)) {
      throw Exception('Environment variable was not defined: $name');
    }

    return getOrElse(name, () => '');
  }
}
