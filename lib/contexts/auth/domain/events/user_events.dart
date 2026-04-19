import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/domain/base/event.dart';

sealed class UserEvents extends DomainEvent {
  UserEvents({required this.user});

  final User user;
}

class UserSignedUpEvent extends UserEvents {
  UserSignedUpEvent({required super.user});
}

class UserLoggedInEvent extends UserEvents {
  UserLoggedInEvent({
    required super.user,
    required this.session,
  });

  final AuthSession session;
}

class EmailConfirmedEvent extends UserEvents {
  EmailConfirmedEvent({required super.user, required this.code});

  final AuthCode code;
}

class EmailConfirmationFailedEvent extends UserEvents {
  EmailConfirmationFailedEvent({required super.user, required this.code});

  final AuthCode code;
}

class AuthCodeCreatedEvent extends UserEvents {
  AuthCodeCreatedEvent({required this.invalidatedCodes, required super.user, required this.code});

  final AuthCode code;
  final List<AuthCode> invalidatedCodes;
}
