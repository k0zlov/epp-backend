import 'dart:async';

import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/application/application.dart';

class UserSignedUpListener extends EventListener<UserSignedUpEvent> {
  UserSignedUpListener({required super.eventBus});

  @override
  FutureOr<void> handle(UserSignedUpEvent event) {
    final integrationEvent = UserSignedUpIntegrationEvent(
      userId: event.user.id,
      email: event.user.email.value,
    );

    eventBus.publish(integrationEvent);
  }
}
