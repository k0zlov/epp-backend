import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/domain/base/event.dart';

sealed class UserEvent extends DomainEvent {
  UserEvent({required this.user});

  final User user;

  @override
  Map<String, dynamic> toDetails() => {
    'userId': user.id,
    'email': user.email.value,
  };
}

sealed class AuthSessionEvent extends UserEvent {
  AuthSessionEvent({required this.session, required super.user});

  final AuthSession session;

  @override
  Map<String, dynamic> toDetails() => {
    ...super.toDetails(),
    'sessionId': session.id,
    'ipAddress': session.ipAddress,
    'userAgent': session.userAgent,
  };
}

sealed class AuthCodeEvent extends UserEvent {
  AuthCodeEvent({required this.code, required super.user});

  final AuthCode code;

  @override
  Map<String, dynamic> toDetails() => {
    ...super.toDetails(),
    'codeId': code.id,
  };
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

  @override
  Map<String, dynamic> toDetails() => {
    ...super.toDetails(),
    'attempts': code.attempts,
  };
}

class AuthCodeCreatedEvent extends AuthCodeEvent {
  AuthCodeCreatedEvent({required this.invalidatedCodes, required super.user, required super.code});

  final List<AuthCode> invalidatedCodes;

  @override
  Map<String, dynamic> toDetails() => {
    ...super.toDetails(),
    'type': code.type.name,
    'invalidatedCodeIds': invalidatedCodes.map((c) => c.id).toList(),
  };
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

  @override
  Map<String, dynamic> toDetails() => {
    ...super.toDetails(),
    'terminatedSessionIds': sessions.map((s) => s.id).toList(),
  };
}

class PasswordResetFailedEvent extends AuthCodeEvent {
  PasswordResetFailedEvent({required super.code, required super.user});

  @override
  Map<String, dynamic> toDetails() => {
    ...super.toDetails(),
    'attempts': code.attempts,
  };
}
