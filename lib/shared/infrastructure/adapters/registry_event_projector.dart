import 'package:epp_backend/shared/application/ports/event_projector.dart';
import 'package:epp_backend/shared/domain/base/event.dart';
import 'package:epp_backend/shared/infrastructure/base/projection_handler.dart';

class RegistryEventProjector implements EventProjector {
  RegistryEventProjector(this._handlers);

  /// The registry of all available projection handlers in your app
  final List<ProjectionHandler> _handlers;

  @override
  Future<void> projectAll(List<DomainEvent> events) async {
    if (events.isEmpty) return;

    // Sort events by timestamp to ensure state is updated sequentially
    final sortedEvents = List<DomainEvent>.from(events)..sort((a, b) => a.occurredAt.compareTo(b.occurredAt));

    for (final event in sortedEvents) {
      final handler = _handlers.firstWhere(
        (h) => h.eventType == event.runtimeType,
        orElse: () => throw StateError('CRITICAL: No ProjectionHandler registered for ${event.runtimeType}. '),
      );

      await handler.project(event);
    }
  }
}
