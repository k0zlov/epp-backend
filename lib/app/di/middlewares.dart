part of 'register_dependencies.dart';

Future<void> _middlewares() async {
  getIt
    ..registerLazySingleton<AuthMiddleware>(() => AuthMiddleware(tokenService: getIt()))
    ..registerLazySingleton<ErrorMiddleware>(() => ErrorMiddleware(loggerService: getIt()));
}
