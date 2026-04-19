import 'package:epp_backend/contexts/auth/application/application.dart';
import 'package:epp_backend/contexts/auth/domain/domain.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/domain/base/result.dart';
import 'package:epp_backend/shared/infrastructure/infrastructure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'confirm_email_use_case.g.dart';

part 'confirm_email_use_case.freezed.dart';

@freezed
abstract class ConfirmEmailParams with _$ConfirmEmailParams {
  const factory ConfirmEmailParams({
    required String code,
    required String email,
  }) = _ConfirmEmailParams;

  factory ConfirmEmailParams.fromJson(Map<String, dynamic> json) => _$ConfirmEmailParamsFromJson(json);
}

class ConfirmEmailUseCase extends UseCase<void, ConfirmEmailParams> {
  const ConfirmEmailUseCase({
    required this.unitOfWork,
    required this.repository,
    required this.hashService,
    required this.projector,
    required this.eventBus,
  });

  final UnitOfWork unitOfWork;
  final UserRepository repository;
  final HashService hashService;
  final EventProjector projector;
  final EventBus eventBus;

  @override
  Future<Result<void>> call(ConfirmEmailParams params) {
    return unitOfWork.execute(errorMessage: 'Failed to confirm email for: ${params.email.maskEmail()}', () async {
      final User? user = await repository.getUserByEmail(params.email);

      if (user == null) {
        return Failure(UserNotFound());
      }

      final findSecretResult = user.findSecret(type: AuthCodeType.emailVerification);
      if (findSecretResult.isFailure) return findSecretResult;

      final secret = findSecretResult.getSuccess;
      final isCodeCorrect = await hashService.verify(params.code, secret.hash);

      final result = user.confirmEmail(secretId: secret.id, isSecretCorrect: isCodeCorrect);

      await projector.projectAll(user.events);
      eventBus.publishAll(user.events);

      return result;
    });
  }
}
