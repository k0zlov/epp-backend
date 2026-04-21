import 'dart:async';

import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/application/events/auth_integration_events.dart';

class EmailConfirmationFailedListener extends EventListener<EmailConfirmationFailedEvent> {
  EmailConfirmationFailedListener({required super.eventBus});

  @override
  FutureOr<void> handle(EmailConfirmationFailedEvent event) {
    final integrationEvent = EmailConfirmationFailedIntegrationEvent(
      userId: event.user.id,
      codeId: event.code.id,
      attempts: event.code.attempts,
    );

    eventBus.publish(integrationEvent);
  }
}
