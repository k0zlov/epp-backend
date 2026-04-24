part of 'register_dependencies.dart';

Future<void> _useCases() async {
  _registerLazySingleton(
    () => SignUpUseCase(
      projector: getIt(),
      repository: getIt(),
      unitOfWork: getIt(),
      hashService: getIt(),
      eventBus: getIt(),
    ),
  );

  _registerLazySingleton(
    () => LoginUseCase(
      hashService: getIt(),
      tokenService: getIt(),
      unitOfWork: getIt(),
      projector: getIt(),
      repository: getIt(),
      eventBus: getIt(),
    ),
  );

  _registerLazySingleton(
    () => SendAuthCodeUseCase(
      mailService: getIt(),
      hashService: getIt(),
      repository: getIt(),
      unitOfWork: getIt(),
      eventBus: getIt(),
      projector: getIt(),
    ),
  );

  _registerLazySingleton(
    () => ConfirmEmailUseCase(
      unitOfWork: getIt(),
      repository: getIt(),
      hashService: getIt(),
      projector: getIt(),
      eventBus: getIt(),
    ),
  );

  _registerLazySingleton(
    () => RefreshSessionUseCase(
      unitOfWork: getIt(),
      repository: getIt(),
      hashService: getIt(),
      projector: getIt(),
      eventBus: getIt(),
      tokenService: getIt(),
      notificationService: getIt(),
    ),
  );

  _registerLazySingleton(
    () => LogoutUseCase(
      unitOfWork: getIt(),
      repository: getIt(),
      projector: getIt(),
      eventBus: getIt(),
      notificationService: getIt(),
    ),
  );

  _registerLazySingleton(
    () => ConfirmPasswordResetUseCase(
      unitOfWork: getIt(),
      repository: getIt(),
      eventBus: getIt(),
      projector: getIt(),
      hashService: getIt(),
      notificationService: getIt(),
    ),
  );

  _registerLazySingleton(() => GetUserUseCase(unitOfWork: getIt(), repository: getIt()));
}
