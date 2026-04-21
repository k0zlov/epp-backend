import 'dart:async';

import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/application/events/auth_integration_events.dart';

class UserPasswordResetListener extends EventListener<UserPasswordResetEvent> {
  UserPasswordResetListener({required super.eventBus});

  @override
  FutureOr<void> handle(UserPasswordResetEvent event) {
    final integrationEvent = UserPasswordResetIntegrationEvent(
      userId: event.user.id,
      codeId: event.code.id,
      terminatedSessionIds: event.sessions.map((s) => s.id).toList(),
    );

    eventBus.publish(integrationEvent);
  }
}
