import 'package:drift/drift.dart';

class VoConverter<T, S> extends TypeConverter<T, S> {
  const VoConverter({
    required this.fromValue,
    required this.toValue,
  });

  final T Function(S value) fromValue;
  final S Function(T vo) toValue;

  @override
  T fromSql(S fromDb) => fromValue(fromDb);

  @override
  S toSql(T value) => toValue(value);
}
