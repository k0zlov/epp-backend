import 'package:epp_backend/contexts/auth/application/ports/user_repository.dart';
import 'package:epp_backend/contexts/auth/application/view/tokens_view.dart';
import 'package:epp_backend/contexts/auth/domain/domain.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/application/base/token_payload.dart';
import 'package:epp_backend/shared/domain/base/result.dart';
import 'package:epp_backend/shared/infrastructure/infrastructure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/v4.dart';

part 'login_use_case.g.dart';

part 'login_use_case.freezed.dart';

@freezed
abstract class LoginParams with _$LoginParams {
  const factory LoginParams({
    required String email,
    required String password,
    required String ipAddress,
    required String userAgent,
  }) = _LoginParams;

  factory LoginParams.fromJson(Map<String, dynamic> json) => _$LoginParamsFromJson(json);
}

class LoginUseCase extends UseCase<TokensView, LoginParams> {
  const LoginUseCase({
    required this.hashService,
    required this.tokenService,
    required this.unitOfWork,
    required this.projector,
    required this.repository,
    required this.eventBus,
  });

  final UnitOfWork unitOfWork;
  final EventProjector projector;
  final UserRepository repository;
  final TokenService tokenService;
  final HashService hashService;
  final EventBus eventBus;

  @override
  Future<Result<TokensView>> call(LoginParams params) {
    return unitOfWork.execute(errorMessage: 'Failed to login for email: ${params.email.maskEmail()}', () async {
      final User? user = await repository.getUserByEmail(params.email);

      if (user == null) {
        return Failure(InvalidCredentials());
      }

      final bool isPasswordCorrect = await hashService.verify(params.password, user.passwordHash);

      if (!isPasswordCorrect) {
        return Failure(InvalidCredentials());
      }

      if (!user.isVerified) {
        return Failure(UserNotVerified());
      }

      final String sessionId = const UuidV4().generate();

      final refreshToken = tokenService.issue(
        payload: TokenPayload(userId: user.id, sessionId: sessionId),
        type: TokenType.refresh,
      );

      final refreshTokenHash = await hashService.hash(refreshToken);

      final result = user.authenticate(
        sessionId: sessionId,
        refreshTokenHash: refreshTokenHash,
        ipAddress: params.ipAddress,
        userAgent: params.userAgent,
        expiresAt: DateTime.timestamp().add(tokenService.refreshTokenExpiresIn),
      );

      await projector.projectAll(user.events);
      eventBus.publishAll(user.events);

      return result.fold(Failure.new, (_) async {
        final accessToken = tokenService.issue(
          payload: TokenPayload(userId: user.id, sessionId: sessionId),
          type: TokenType.access,
        );

        return Success(TokensView(accessToken: accessToken, refreshToken: refreshToken));
      });
    });
  }
}
