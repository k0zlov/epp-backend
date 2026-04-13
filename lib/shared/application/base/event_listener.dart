import 'dart:async';

import 'package:epp_backend/shared/application/ports/event_bus.dart';
import 'package:epp_backend/shared/domain/base/event.dart';

abstract class EventListener<T extends Event> {
  EventListener({required this.eventBus}) {
    eventBus.subscribe(handle, eventType: T);
  }

  final EventBus eventBus;

  FutureOr<void> handle(T event);
}
