part of 'register_dependencies.dart';

Future<void> _listeners() async {
  _registerSingleton(AuthCodeCreatedListener(eventBus: getIt()));
  _registerSingleton(AuthSessionRefreshedListener(eventBus: getIt()));
  _registerSingleton(AuthTokenReuseDetectedListener(eventBus: getIt()));
  _registerSingleton(EmailConfirmationFailedListener(eventBus: getIt()));
  _registerSingleton(EmailConfirmedListener(eventBus: getIt()));
  _registerSingleton(PasswordResetFailedListener(eventBus: getIt()));
  _registerSingleton(UserLoggedInListener(eventBus: getIt()));
  _registerSingleton(UserLoggedOutListener(eventBus: getIt()));
  _registerSingleton(UserPasswordResetListener(eventBus: getIt()));
  _registerSingleton(UserSignedUpListener(eventBus: getIt()));
  _registerSingleton(UserLoggedOutIntegrationListener(eventBus: getIt(), wsManager: getIt()));
}
