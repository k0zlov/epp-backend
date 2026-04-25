part of 'register_dependencies.dart';

Future<void> _controllers() async {
  _registerLazySingleton<AuthController>(
    () => AuthController(
      failureMapper: getIt(),
      signUpUseCase: getIt(),
      loginUseCase: getIt(),
      confirmEmailUseCase: getIt(),
      sendAuthCodeUseCase: getIt(),
      logoutUseCase: getIt(),
      refreshSessionUseCase: getIt(),
      confirmPasswordResetUseCase: getIt(),
      getUserUseCase: getIt(),
    ),
  );
}

Future<void> _wsControllers() async {
  // _registerSingleton(UserWsController(notificationSubscriber: getIt()));
}
