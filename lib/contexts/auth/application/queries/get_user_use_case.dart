import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/domain/base/result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_use_case.g.dart';

part 'get_user_use_case.freezed.dart';

@freezed
abstract class GetUserParams with _$GetUserParams {
  const factory GetUserParams({required String userId}) = _GetUserParams;

  factory GetUserParams.fromJson(Map<String, dynamic> json) => _$GetUserParamsFromJson(json);
}

class GetUserUseCase extends UseCase<UserView, GetUserParams> {
  GetUserUseCase({required this.unitOfWork, required this.repository});

  final UserRepository repository;
  final UnitOfWork unitOfWork;

  @override
  Future<Result<UserView>> call(GetUserParams params) {
    return unitOfWork.execute(errorMessage: 'Could not get user data (${params.userId}).', () async {
      final user = await repository.getUserById(params.userId);

      if (user == null) return Failure(UserNotFound());

      return Success(UserView.fromDomain(user));
    });
  }
}
