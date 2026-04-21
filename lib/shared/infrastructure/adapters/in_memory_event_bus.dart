import 'package:epp_backend/shared/application/ports/event_bus.dart';
import 'package:epp_backend/shared/domain/base/event.dart';

class InMemoryEventBus implements EventBus {
  final Map<String, List<Function>> _handlersMap = {};

  String _normalize(String typeName) {
    return typeName.replaceAll('_', '').replaceAll(r'$', '');
  }

  @override
  void publish<T extends Event>(T event) {
    final String key = _normalize(event.runtimeType.toString());
    final handlers = _handlersMap[key];

    if (handlers == null) return;
    for (final handler in handlers) {
      (handler as EventHandlerFunc<T>)(event);
    }
  }

  @override
  void subscribe<T extends Event>(EventHandlerFunc<T> handler, {Type? eventType}) {
    final Type type = eventType ?? T;
    final String key = _normalize(type.toString());
    _handlersMap[key] = (_handlersMap[key] ?? [])..add(handler);
  }

  @override
  void publishAll(List<Event> events) {
    events.forEach(publish);
  }
}
