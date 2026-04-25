import 'dart:async';

import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/application/application.dart';

class PasswordResetFailedListener extends EventListener<PasswordResetFailedEvent> {
  PasswordResetFailedListener({required super.eventBus});

  @override
  FutureOr<void> handle(PasswordResetFailedEvent event) {
    final integrationEvent = PasswordResetFailedIntegrationEvent(
      userId: event.user.id,
      codeId: event.code.id,
      attempts: event.code.attempts,
    );

    eventBus.publish(integrationEvent);
  }
}
