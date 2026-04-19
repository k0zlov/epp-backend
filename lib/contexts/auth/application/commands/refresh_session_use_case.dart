import 'package:epp_backend/contexts/auth/application/application.dart';
import 'package:epp_backend/contexts/auth/application/view/tokens_view.dart';
import 'package:epp_backend/contexts/auth/domain/domain.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/application/base/token_payload.dart';
import 'package:epp_backend/shared/domain/base/result.dart';
import 'package:epp_backend/shared/infrastructure/extensions/either_x.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_session_use_case.g.dart';

part 'refresh_session_use_case.freezed.dart';

@freezed
abstract class RefreshSessionParams with _$RefreshSessionParams {
  const factory RefreshSessionParams({
    required String userId,
    required String sessionId,
    required String token,
    required String ipAddress,
    required String userAgent,
  }) = _RefreshSessionParams;

  factory RefreshSessionParams.fromJson(Map<String, dynamic> json) => _$RefreshSessionParamsFromJson(json);
}

class RefreshSessionUseCase extends UseCase<TokensView, RefreshSessionParams> {
  const RefreshSessionUseCase({
    required this.tokenService,
    required this.unitOfWork,
    required this.userRepository,
    required this.eventBus,
    required this.projector,
    required this.hashService,
  });

  final TokenService tokenService;
  final UnitOfWork unitOfWork;
  final UserRepository userRepository;
  final EventBus eventBus;
  final EventProjector projector;
  final HashService hashService;

  @override
  Future<Result<TokensView>> call(RefreshSessionParams params) {
    final String sessionId = params.sessionId;

    return unitOfWork.execute(
      errorMessage: 'Failed to refresh session ($sessionId) of user (${params.userId})',
      () async {
        final User? user = await userRepository.getUserById(params.userId);

        if (user == null) {
          return Failure(UserNotFound());
        }

        final sessionResult = user.findSession(sessionId: sessionId);
        if (sessionResult.isFailure) return Failure(sessionResult.getFailure);

        final AuthSession session = sessionResult.getSuccess;
        final bool isTokenValid = await hashService.verify(params.token, session.tokenHash);

        final String newRefreshToken = tokenService.issue(
          payload: TokenPayload(userId: user.id, sessionId: sessionId),
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

        return result.fold(Failure.new, (_) {
          final String accessToken = tokenService.issue(
            payload: TokenPayload(userId: user.id, sessionId: sessionId),
            type: TokenType.access,
          );

          return Success(
            TokensView(
              accessToken: accessToken,
              refreshToken: newRefreshToken,
            ),
          );
        });
      },
    );
  }
}
