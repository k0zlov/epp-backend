import 'dart:async';

import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/domain/base/event.dart';

class DomainEventObservingListener extends EventListener<DomainEvent> {
  DomainEventObservingListener({
    required this.metricsService,
    required this.loggerService,
    required super.eventBus,
  });

  final MetricsService metricsService;
  final LoggerService loggerService;

  @override
  FutureOr<void> handle(DomainEvent event) {
    final eventName = event.eventName;

    loggerService.info(
      'Domain Event: $eventName',
      context: LogContext(
        event: 'domain.$eventName',
        payload: event.toDetails(),
      ),
    );

    metricsService.increment(
      MetricDefinition.domainEvents,
      labels: {'event_type': eventName},
    );
  }
}
