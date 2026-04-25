import 'package:dartz/dartz.dart';

extension EitherX<L, R> on Either<L, R> {
  bool get isFailure => isLeft();

  bool get isSuccess => isRight();

  R get getSuccess => fold((failure) => throw Exception(), (success) => success);

  L get getFailure => fold((failure) => failure, (success) => throw Exception());

  R? getOrElseNull(void Function(L l) ifLeft) => fold((l) {
    ifLeft(l);
    return null;
  }, id);
}
