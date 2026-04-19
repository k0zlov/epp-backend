import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/v4.dart';

@immutable
abstract class Event {
  Event() : occurredAt = DateTime.now(), eventId = const UuidV4().generate();

  final String eventId;
  final DateTime occurredAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Event && runtimeType == other.runtimeType && eventId == other.eventId;

  @override
  int get hashCode => eventId.hashCode;
}

abstract class DomainEvent extends Event {
  String get title => runtimeType.toString();
}
