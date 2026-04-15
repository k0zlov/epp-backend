import 'package:dartz/dartz.dart';
import 'package:epp_backend/shared/domain/base/failure.dart';
export 'package:dartz/dartz.dart' show Left, Right;

typedef Result<T> = Either<BaseDomainFailure, T>;

typedef Failure<L, R> = Left<L, R>;

typedef Success<L, R> = Right<L, R>;
