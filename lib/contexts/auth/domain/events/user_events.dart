import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/domain/base/event.dart';

sealed class UserEvents extends DomainEvent {
  UserEvents({required this.user});

  final User user;
}

class UserSignedUpEvent extends UserEvents {
  UserSignedUpEvent({required super.user});
}
