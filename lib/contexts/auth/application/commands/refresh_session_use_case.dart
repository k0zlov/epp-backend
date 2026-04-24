import 'package:epp_backend/contexts/auth/application/application.dart';
import 'package:epp_backend/contexts/auth/domain/domain.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/domain/base/result.dart';
import 'package:epp_backend/shared/infrastructure/extensions/either_x.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_session_use_case.g.dart';

part 'refresh_session_use_case.freezed.dart';

@freezed
abstract class RefreshSessionParams with _$RefreshSessionParams {
  const factory RefreshSessionParams({
    required String refreshToken,
    required String ipAddress,
    required String userAgent,
  }) = _RefreshSessionParams;

  factory RefreshSessionParams.fromJson(Map<String, dynamic> json) => _$RefreshSessionParamsFromJson(json);
}

class RefreshSessionUseCase extends UseCase<TokensView, RefreshSessionParams> {
  const RefreshSessionUseCase({
    required this.notificationService,
    required this.tokenService,
    required this.unitOfWork,
    required this.repository,
    required this.eventBus,
    required this.projector,
    required this.hashService,
  });

  final TokenService tokenService;
  final UnitOfWork unitOfWork;
  final UserRepository repository;
  final EventBus eventBus;
  final EventProjector projector;
  final HashService hashService;
  final NotificationService notificationService;

  @override
  Future<Result<TokensView>> call(RefreshSessionParams params) async {
    final TokenPayload? payload = tokenService.extractPayload(params.refreshToken, type: TokenType.refresh);

    if (payload == null) return Failure(AuthTokenInvalid());

    final String sessionId = payload.sessionId;
    final String userId = payload.userId;

    final Result<TokensView> result = await unitOfWork.execute(
      errorMessage: 'Failed to refresh session ($sessionId) of user ($userId)',
      () async {
        final User? user = await repository.getUserById(userId);

        if (user == null) {
          return Failure(UserNotFound());
        }

        final sessionResult = user.findSession(sessionId: sessionId);
        if (sessionResult.isFailure) return Failure(sessionResult.getFailure);

        final AuthSession session = sessionResult.getSuccess;
        final bool isTokenValid = await hashService.verify(params.refreshToken, session.tokenHash);

        final String newRefreshToken = tokenService.issue(
          payload: TokenPayload(userId: userId, sessionId: sessionId),
          type: TokenType.refresh,
        );

        final String newRefreshTokenHash = await hashService.hash(newRefreshToken);

        final result = user.refreshSession(
          isTokenValid: isTokenValid,
          newTokenHash: newRefreshTokenHash,
          ipAddress: params.ipAddress,
          userAgent: params.userAgent,
          expiresAt: DateTime.timestamp().add(tokenService.refreshTokenExpiresIn),
          sessionId: sessionId,
        );

        await projector.projectAll(user.events);
        eventBus.publishAll(user.events);

        if (result.isFailure) return Failure(result.getFailure);

        final String accessToken = tokenService.issue(
          payload: TokenPayload(userId: userId, sessionId: sessionId),
          type: TokenType.access,
        );

        final TokensView view = TokensView(
          accessToken: accessToken,
          refreshToken: newRefreshToken,
          sessionId: sessionId,
        );

        return Success(view);
      },
    );

    if (result.isSuccess) {
      notificationService.send(
        NotificationMessage.event(
          topic: NotificationTopic(scope: NotificationScope.session, id: sessionId),
          title: NotificationEvent.authTokenRefreshed,
          payload: result.getSuccess.toJson(),
        ),
      );
    }

    return result;
  }
}
