import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/v4.dart';

@immutable
abstract class Event {
  Event() : occurredAt = DateTime.timestamp(), eventId = const UuidV4().generate();

  final String eventId;
  final DateTime occurredAt;

  String get eventName;

  Map<String, dynamic> toDetails() => {};

  @protected
  String formatEventName(String suffixToRemove) {
    // 1. Clean technical prefixes (_, $) from runtimeType
    final String typeName = runtimeType.toString().replaceFirst(RegExp(r'^[_$]+'), '');

    // 2. Strip the specific suffix
    final String baseName = typeName.endsWith(suffixToRemove)
        ? typeName.substring(0, typeName.length - suffixToRemove.length)
        : typeName;

    // 3. PascalCase to snake_case
    return baseName
        .replaceAllMapped(
          RegExp('(?<=[a-z])[A-Z]'),
          (m) => '_${m.group(0)}',
        )
        .toLowerCase();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Event && runtimeType == other.runtimeType && eventId == other.eventId;

  @override
  int get hashCode => eventId.hashCode;
}

abstract class DomainEvent extends Event {
  @override
  String get eventName => formatEventName('Event');
}
