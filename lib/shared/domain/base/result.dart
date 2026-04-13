import 'package:dartz/dartz.dart';
import 'package:epp_backend/shared/domain/base/failure.dart';
export 'package:dartz/dartz.dart' show Left, Right;

typedef Result<T> = Either<BaseDomainFailure, T>;
