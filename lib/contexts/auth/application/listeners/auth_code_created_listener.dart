import 'dart:async';

import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/application/base/metrics_definition.dart';
import 'package:epp_backend/shared/application/ports/metrics_service.dart';

class AuthCodeCreatedListener extends EventListener<AuthCodeCreatedEvent> {
  AuthCodeCreatedListener({required this.metrics, required this.logger, required super.eventBus});

  final LoggerService logger;
  final MetricsService metrics;

  @override
  FutureOr<void> handle(AuthCodeCreatedEvent event) {
    logger.info(
      'Auth code created for user',
      context: LogContext(
        event: event.eventName,
        payload: {
          'userId': event.user.id,
          'email': event.user.email.value,
          'type': event.code.type.name,
          'codeId': event.code.id,
        },
      ),
    );

    metrics.increment(
      MetricDefinition.authCodesCreated,
      labels: {'type': event.code.type.name},
    );

    final integrationEvent = AuthCodeCreatedIntegrationEvent(
      userId: event.user.id,
      codeId: event.code.id,
      type: event.code.type.name,
      invalidatedCodeIds: event.invalidatedCodes.map((c) => c.id).toList(),
    );

    eventBus.publish(integrationEvent);
  }
}
