import 'package:dartz/dartz.dart';

extension EitherListX<L, R> on List<Either<L, R>> {
  bool isAnyLeft() {
    for (final e in this) {
      if (e.isLeft()) {
        return true;
      }
    }
    return false;
  }
}
