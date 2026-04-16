import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
abstract class ValueObject {
  const ValueObject();

  List<Object?> get props;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ValueObject &&
          runtimeType == other.runtimeType &&
          const ListEquality<Object?>().equals(props, other.props);

  @override
  int get hashCode => const ListEquality<Object?>().hash(props);

  @override
  String toString() => '$runtimeType($props)';
}
