import 'package:epp_backend/shared/domain/base/event.dart';

abstract class ProjectionHandler<T extends DomainEvent> {
  Type get eventType => T;

  Future<void> project(T event);
}
