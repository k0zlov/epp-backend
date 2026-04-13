import 'package:epp_backend/shared/domain/base/entity.dart';
import 'package:epp_backend/shared/domain/base/event.dart';

abstract class Aggregate extends Entity {
  Aggregate({
    required super.id,
    super.updatedAt,
    super.createdAt,
  });

  final List<DomainEvent> _events = [];

  List<DomainEvent> get events => _events;

  void addEvent(DomainEvent event) {
    _events.add(event);
  }
}
