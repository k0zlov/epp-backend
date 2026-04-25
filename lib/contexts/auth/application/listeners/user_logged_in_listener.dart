import 'dart:async';

import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/application/application.dart';

class UserLoggedInListener extends EventListener<UserLoggedInEvent> {
  UserLoggedInListener({required super.eventBus});

  @override
  FutureOr<void> handle(UserLoggedInEvent event) {
    final integrationEvent = UserLoggedInIntegrationEvent(
      userId: event.user.id,
      sessionId: event.session.id,
      ipAddress: event.session.ipAddress,
      userAgent: event.session.userAgent,
    );

    eventBus.publish(integrationEvent);
  }
}
