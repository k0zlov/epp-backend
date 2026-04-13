import 'package:epp_backend/shared/domain/base/event.dart';

typedef EventHandlerFunc<T extends Event> = void Function(T);

abstract interface class EventBus {
  void publish<T extends Event>(T event);

  void subscribe<T extends Event>(EventHandlerFunc<T> handlerFunc, {Type? eventType});
}
