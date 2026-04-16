import 'package:dartz/dartz.dart';

extension EitherX<L, R> on Either<L, R> {
  bool get isFailure => isLeft();

  bool get isSuccess => isRight();

  R get success => fold((failure) => throw Exception(), (success) => success);

  L get failure => fold((failure) => failure, (success) => throw Exception());

  R? getOrElseNull(void Function(L l) ifLeft) => fold((l) {
    ifLeft(l);
    return null;
  }, id);
}
