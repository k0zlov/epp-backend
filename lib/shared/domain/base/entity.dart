// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

import 'package:uuid/v4.dart';

abstract class Entity {
  Entity({
    required String? id,
    required DateTime? updatedAt,
    required DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.timestamp(),
       updatedAt = updatedAt ?? DateTime.timestamp(),
       id = id ?? const UuidV4().generate();

  final String id;
  DateTime updatedAt;
  final DateTime createdAt;

  void updateTimestamp() {
    updatedAt = DateTime.timestamp();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    // If they aren't the exact same type, they aren't equal
    if (other.runtimeType != runtimeType) return false;

    // They are the same entity if their IDs match
    return other is Entity && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
