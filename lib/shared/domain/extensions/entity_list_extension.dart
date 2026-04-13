import 'package:collection/collection.dart';
import 'package:epp_backend/shared/domain/base/entity.dart';

extension EntityListX<T extends Entity> on List<T> {
  bool Function(T e) _testFunction(String id) {
    return (T e) => e.id == id;
  }

  T? findById(String id) {
    return firstWhereOrNull(_testFunction(id));
  }

  T? removeById(String id) {
    final T? e = findById(id);
    removeWhere(_testFunction(id));
    return e;
  }
}
