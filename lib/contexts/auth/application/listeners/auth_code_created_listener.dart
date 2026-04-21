import 'dart:async';

import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/application/events/auth_integration_events.dart';

class AuthCodeCreatedListener extends EventListener<AuthCodeCreatedEvent> {
  AuthCodeCreatedListener({required super.eventBus});

  @override
  FutureOr<void> handle(AuthCodeCreatedEvent event) {
    final integrationEvent = AuthCodeCreatedIntegrationEvent(
      userId: event.user.id,
      codeId: event.code.id,
      type: event.code.type.name,
      invalidatedCodeIds: event.invalidatedCodes.map((c) => c.id).toList(),
    );

    eventBus.publish(integrationEvent);
  }
}
