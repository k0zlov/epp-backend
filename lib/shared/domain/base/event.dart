abstract class Event {
  Event() : occurredAt = DateTime.now();

  final DateTime occurredAt;
}

abstract class DomainEvent extends Event {
  String get title => runtimeType.toString();
}
