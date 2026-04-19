import 'package:epp_backend/contexts/auth/application/ports/user_repository.dart';
import 'package:epp_backend/contexts/auth/application/view/tokens_view.dart';
import 'package:epp_backend/contexts/auth/domain/domain.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/domain/base/result.dart';
import 'package:epp_backend/shared/infrastructure/infrastructure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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

      const accessExpiresIn = Duration(minutes: 30);
      const refreshExpiresIn = Duration(days: 30);

      final accessToken = tokenService.issueToken(
        userId: user.id,
        expiresIn: accessExpiresIn,
        type: TokenType.access,
      );

      final refreshToken = tokenService.issueToken(
        userId: user.id,
        expiresIn: refreshExpiresIn,
        type: TokenType.refresh,
      );

      final result = user.authenticate(
        refreshToken: refreshToken,
        ipAddress: params.ipAddress,
        userAgent: params.userAgent,
        expiresAt: DateTime.timestamp().add(refreshExpiresIn),
      );

      await projector.projectAll(user.events);
      eventBus.publishAll(user.events);

      return result.fold(Failure.new, (_) async {
        return Success(TokensView(accessToken: accessToken, refreshToken: refreshToken));
      });
    });
  }
}
