import 'package:epp_backend/contexts/auth/application/application.dart';
import 'package:epp_backend/contexts/auth/domain/aggregates/user.dart';
import 'package:epp_backend/contexts/auth/domain/failures/auth_failures.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/domain/base/result.dart';
import 'package:epp_backend/shared/infrastructure/extensions/either_x.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_use_case.g.dart';

part 'logout_use_case.freezed.dart';

@freezed
abstract class LogoutParams with _$LogoutParams {
  const factory LogoutParams({
    required String userId,
    required String sessionId,
  }) = _LogoutParams;

  factory LogoutParams.fromJson(Map<String, dynamic> json) => _$LogoutParamsFromJson(json);
}

class LogoutUseCase extends UseCase<void, LogoutParams> {
  const LogoutUseCase({
    required this.notificationService,
    required this.projector,
    required this.unitOfWork,
    required this.repository,
    required this.eventBus,
  });

  final UnitOfWork unitOfWork;
  final UserRepository repository;
  final EventBus eventBus;
  final EventProjector projector;
  final NotificationService notificationService;

  @override
  Future<Result<void>> call(LogoutParams params) async {
    final sessionId = params.sessionId;

    final Result<void> result = await unitOfWork.execute(errorMessage: 'Failed to logout session $sessionId', () async {
      final User? user = await repository.getUserById(params.userId);

      if (user == null) {
        return Failure(UserNotFound());
      }

      final result = user.logout(sessionId: sessionId);

      await projector.projectAll(user.events);
      eventBus.publishAll(user.events);

      return result;
    });

    if (result.isSuccess) {
      notificationService.send(
        NotificationMessage.event(
          topic: NotificationTopic(
            scope: NotificationScope.session,
            id: sessionId,
          ),
          title: NotificationEvent.authLogout,
        ),
      );

      await notificationService.closeSession(sessionId);
    }

    return result;
  }
}
