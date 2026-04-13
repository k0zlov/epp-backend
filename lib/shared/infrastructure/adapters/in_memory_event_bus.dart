import 'package:epp_backend/shared/application/ports/event_bus.dart';
import 'package:epp_backend/shared/domain/base/event.dart';

class InMemoryEventBus implements EventBus {
  final Map<Type, List<Function>> _handlersMap = {};

  @override
  void publish<T extends Event>(T event) {
    final handlers = _handlersMap[event.runtimeType];

    if (handlers == null) return;
    for (final handler in handlers) {
      (handler as EventHandlerFunc<T>)(event);
    }
  }

  @override
  void subscribe<T extends Event>(EventHandlerFunc<T> handler, {Type? eventType}) {
    final Type type = eventType ?? T;
    _handlersMap[type] = (_handlersMap[type] ?? [])..add(handler);
  }
}
