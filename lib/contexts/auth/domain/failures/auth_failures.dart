import 'package:epp_backend/shared/domain/domain.dart';

sealed class AuthFailure extends DomainFailure {}

class EmailAlreadyInUse extends AuthFailure with DomainFailureDetails {
  EmailAlreadyInUse(this.email);

  final String email;

  @override
  Map<String, dynamic> getDetails() => {'email': email};
}

class InvalidEmail extends AuthFailure with DomainFailureDetails {
  InvalidEmail(this.email);

  final String email;

  @override
  Map<String, dynamic> getDetails() => {'email': email};
}

class InvalidPassword extends AuthFailure {}

class InvalidCredentials extends AuthFailure {}

class UserNotVerified extends AuthFailure {}

class UserNotFound extends AuthFailure {}

class UserAlreadyVerified extends AuthFailure {}

class AuthCodeNotFound extends AuthFailure {}

class AuthCodeInvalid extends AuthFailure {}

class AuthCodeAlreadyUsed extends AuthFailure {}

class AuthCodeExpired extends AuthFailure {}

class AuthCodeMaxAttemptsReached extends AuthFailure {}

class AuthCodeIncorrect extends AuthFailure with DomainFailureDetails {
  AuthCodeIncorrect({required this.remainingAttempts});

  final int remainingAttempts;

  @override
  Map<String, dynamic> getDetails() => {'remaining_attempts': remainingAttempts};
}

class AuthCodeRequestTooFrequent extends AuthFailure with DomainFailureDetails {
  AuthCodeRequestTooFrequent({required this.retryAfterSeconds});

  final int retryAfterSeconds;

  @override
  Map<String, dynamic> getDetails() => {'retry_after_seconds': retryAfterSeconds};
}

class AuthSessionNotFound extends AuthFailure {}

class AuthSessionInvalid extends AuthFailure {}

class AuthTokenInvalid extends AuthFailure {}
