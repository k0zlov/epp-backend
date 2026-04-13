// ignore_for_file:one_member_abstracts

import 'package:epp_backend/shared/domain/base/result.dart';

class NoParams {}

abstract class UseCase<T, P> {
  const UseCase();

  Future<Result<T>> call(P params);
}
