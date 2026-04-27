import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/domain/base/event.dart';

class InMemoryEventBus implements EventBus {
  final Map<String, List<Function>> _handlersMap = {};

  String _normalize(String typeName) {
    return typeName.replaceAll('_', '').replaceAll(r'$', '');
  }

  @override
  void publish<T extends Event>(T event) {
    _dispatch(_normalize(event.runtimeType.toString()), event);

    if (event is DomainEvent) {
      _dispatch('DomainEvent', event);
    }

    if (event is IntegrationEvent) {
      _dispatch('IntegrationEvent', event);
    }

    _dispatch('Event', event);
  }

  void _dispatch(String key, Event event) {
    final handlers = _handlersMap[key];
    if (handlers == null) return;

    for (final handler in handlers) {
      // ignore: avoid_dynamic_calls
      handler(event);
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
