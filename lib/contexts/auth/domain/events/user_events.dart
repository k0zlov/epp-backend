import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/domain/base/event.dart';

sealed class UserEvent extends DomainEvent {
  UserEvent({required this.user});

  final User user;
}

sealed class AuthSessionEvent extends UserEvent {
  AuthSessionEvent({required this.session, required super.user});

  final AuthSession session;
}

sealed class AuthCodeEvent extends UserEvent {
  AuthCodeEvent({required this.code, required super.user});

  final AuthCode code;
}

class UserSignedUpEvent extends UserEvent {
  UserSignedUpEvent({required super.user});
}

class UserLoggedInEvent extends AuthSessionEvent {
  UserLoggedInEvent({required super.user, required super.session});
}

class EmailConfirmedEvent extends AuthCodeEvent {
  EmailConfirmedEvent({required super.user, required super.code});
}

class EmailConfirmationFailedEvent extends AuthCodeEvent {
  EmailConfirmationFailedEvent({required super.user, required super.code});
}

class AuthCodeCreatedEvent extends AuthCodeEvent {
  AuthCodeCreatedEvent({required this.invalidatedCodes, required super.user, required super.code});

  final List<AuthCode> invalidatedCodes;
}

class AuthSessionRefreshedEvent extends AuthSessionEvent {
  AuthSessionRefreshedEvent({required super.user, required super.session});
}

class AuthTokenReuseDetectedEvent extends AuthSessionEvent {
  AuthTokenReuseDetectedEvent({required super.user, required super.session});
}

class UserLoggedOutEvent extends AuthSessionEvent {
  UserLoggedOutEvent({required super.user, required super.session});
}

class UserPasswordResetEvent extends AuthCodeEvent {
  UserPasswordResetEvent({required this.sessions, required super.code, required super.user});

  final List<AuthSession> sessions;
}

class PasswordResetFailedEvent extends AuthCodeEvent {
  PasswordResetFailedEvent({required super.code, required super.user});
}
