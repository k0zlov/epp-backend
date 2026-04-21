import 'dart:async';

import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/application/events/auth_integration_events.dart';

class AuthTokenReuseDetectedListener extends EventListener<AuthTokenReuseDetectedEvent> {
  AuthTokenReuseDetectedListener({required super.eventBus});

  @override
  FutureOr<void> handle(AuthTokenReuseDetectedEvent event) {
    final integrationEvent = AuthTokenReuseDetectedIntegrationEvent(
      userId: event.user.id,
      sessionId: event.session.id,
    );

    eventBus.publish(integrationEvent);
  }
}
