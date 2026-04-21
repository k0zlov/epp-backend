import 'dart:async';

import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/application/events/auth_integration_events.dart';

class UserLoggedOutListener extends EventListener<UserLoggedOutEvent> {
  UserLoggedOutListener({required super.eventBus});

  @override
  FutureOr<void> handle(UserLoggedOutEvent event) {
    final integrationEvent = UserLoggedOutIntegrationEvent(
      userId: event.user.id,
      sessionId: event.session.id,
    );

    eventBus.publish(integrationEvent);
  }
}
