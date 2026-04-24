import 'dart:async';

import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/application/application.dart';

class AuthSessionRefreshedListener extends EventListener<AuthSessionRefreshedEvent> {
  AuthSessionRefreshedListener({required super.eventBus});

  @override
  FutureOr<void> handle(AuthSessionRefreshedEvent event) {
    final integrationEvent = AuthSessionRefreshedIntegrationEvent(
      userId: event.user.id,
      sessionId: event.session.id,
      ipAddress: event.session.ipAddress,
      accessToken: '',
      refreshToken: '',
    );

    eventBus.publish(integrationEvent);
  }
}
