import 'package:epp_backend/contexts/auth/application/application.dart';
import 'package:epp_backend/contexts/auth/domain/domain.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/domain/base/result.dart';
import 'package:epp_backend/shared/infrastructure/extensions/either_x.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'confirm_password_reset_use_case.freezed.dart';

part 'confirm_password_reset_use_case.g.dart';

@freezed
abstract class ConfirmPasswordResetParams with _$ConfirmPasswordResetParams {
  const factory ConfirmPasswordResetParams({
    required String email,
    required String newPassword,
    required String code,
  }) = _ConfirmPasswordResetParams;

  factory ConfirmPasswordResetParams.fromJson(Map<String, dynamic> json) => _$ConfirmPasswordResetParamsFromJson(json);
}

class ConfirmPasswordResetUseCase extends UseCase<void, ConfirmPasswordResetParams> {
  const ConfirmPasswordResetUseCase({
    required this.notificationService,
    required this.unitOfWork,
    required this.repository,
    required this.eventBus,
    required this.projector,
    required this.hashService,
  });

  final UnitOfWork unitOfWork;
  final UserRepository repository;
  final EventBus eventBus;
  final EventProjector projector;
  final HashService hashService;
  final NotificationService notificationService;

  @override
  Future<Result<void>> call(ConfirmPasswordResetParams params) async {
    late final String userId;

    final Result<void> result = await unitOfWork.execute(() async {
      final User? user = await repository.getUserByEmail(params.email);

      if (user == null) return Failure(UserNotFound());

      userId = user.id;

      final codeResult = user.findCode(type: AuthCodeType.passwordReset);
      if (codeResult.isFailure) return codeResult;

      final AuthCode code = codeResult.getSuccess;
      final isCodeCorrect = await hashService.verify(params.code, code.hash);

      final newPasswordHash = await hashService.hash(params.newPassword);

      final result = user.resetPassword(
        codeId: code.id,
        isCodeCorrect: isCodeCorrect,
        newPasswordHash: newPasswordHash,
      );

      await projector.projectAll(user.events);
      eventBus.publishAll(user.events);
      return result;
    });

    if (result.isSuccess) {
      notificationService.send(
        NotificationMessage.event(
          topic: NotificationTopic(scope: NotificationScope.user, id: userId),
          title: NotificationEvent.authLogout,
        ),
      );

      await notificationService.closeUser(userId);
    }

    return result;
  }
}
