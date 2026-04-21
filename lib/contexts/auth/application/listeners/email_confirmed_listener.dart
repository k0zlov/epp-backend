import 'dart:async';

import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/application/events/auth_integration_events.dart';

class EmailConfirmedListener extends EventListener<EmailConfirmedEvent> {
  EmailConfirmedListener({required super.eventBus});

  @override
  FutureOr<void> handle(EmailConfirmedEvent event) {
    final integrationEvent = EmailConfirmedIntegrationEvent(
      userId: event.user.id,
      codeId: event.code.id,
    );

    eventBus.publish(integrationEvent);
  }
}
