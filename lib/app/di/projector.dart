part of 'register_dependencies.dart';

Future<void> _projector() async {
  _registerLazySingleton<EventProjector>(
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
