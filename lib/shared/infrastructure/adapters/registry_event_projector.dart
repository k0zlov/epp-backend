import 'package:epp_backend/shared/application/base/log_context.dart';
import 'package:epp_backend/shared/application/ports/event_projector.dart';
import 'package:epp_backend/shared/application/ports/logger_service.dart';
import 'package:epp_backend/shared/domain/base/event.dart';
import 'package:epp_backend/shared/infrastructure/base/projection_handler.dart';

class RegistryEventProjector implements EventProjector {
  RegistryEventProjector(this._handlers, this._logger);

  final List<ProjectionHandler<DomainEvent>> _handlers;
  final LoggerService _logger;

  @override
  Future<void> projectAll(List<DomainEvent> events) async {
    if (events.isEmpty) return;

    final sortedEvents = List<DomainEvent>.from(events)..sort((a, b) => a.occurredAt.compareTo(b.occurredAt));

    for (final event in sortedEvents) {
      final eventName = event.eventName;
      final handler = _handlers.firstWhere(
        (h) => h.eventType == event.runtimeType,
        orElse: () => throw StateError('CRITICAL: No ProjectionHandler registered for ${event.runtimeType}.'),
      );

      final stopwatch = Stopwatch()..start();

      try {
        await handler.project(event);
        stopwatch.stop();

        _logger.info(
          'Projection finished: $eventName',
          context: LogContext(
            event: 'infra.projection_finished',
            payload: {
              'eventType': eventName,
              'duration_ms': stopwatch.elapsedMilliseconds,
            },
          ),
        );
      } catch (e, st) {
        _logger.error(
          'Projection failed: $eventName',
          error: e,
          stackTrace: st,
          context: LogContext(
            event: 'infra.projection_failed',
            payload: {
              'eventType': eventName,
              'error': e.toString(),
            },
          ),
        );
        rethrow;
      }
    }
  }
}
