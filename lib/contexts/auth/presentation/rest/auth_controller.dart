import 'package:epp_backend/contexts/auth/application/application.dart';
import 'package:epp_backend/contexts/auth/application/queries/get_user_use_case.dart';
import 'package:epp_backend/contexts/auth/presentation/errors/auth_failure_mapper.dart';
import 'package:epp_backend/shared/presentation/presentation.dart';
import 'package:ruta/ruta.dart';

class AuthController {
  const AuthController({
    required this.logoutUseCase,
    required this.refreshSessionUseCase,
    required this.confirmPasswordResetUseCase,
    required this.failureMapper,
    required this.signUpUseCase,
    required this.loginUseCase,
    required this.confirmEmailUseCase,
    required this.sendAuthCodeUseCase,
    required this.getUserUseCase,
  });

  final SignUpUseCase signUpUseCase;
  final LoginUseCase loginUseCase;
  final ConfirmEmailUseCase confirmEmailUseCase;
  final SendAuthCodeUseCase sendAuthCodeUseCase;
  final LogoutUseCase logoutUseCase;
  final RefreshSessionUseCase refreshSessionUseCase;
  final ConfirmPasswordResetUseCase confirmPasswordResetUseCase;
  final GetUserUseCase getUserUseCase;
  final AuthFailureMapper failureMapper;

  Future<Response> signUp(Request request) async {
    final params = SignUpParams.fromJson(request.data);
    final result = await signUpUseCase(params);

    return result.fold(
      (failure) => failureMapper.resolveToResponse(failure, request),
      (_) => Response(),
    );
  }

  Future<Response> login(Request request) async {
    final params = LoginParams.fromJson({
      ...request.data,
      'ipAddress': request.ip,
      'userAgent': request.userAgent,
    });

    final result = await loginUseCase(params);

    return result.fold(
      (failure) => failureMapper.resolveToResponse(failure, request),
      (view) => Response.json(body: view.toJson()),
    );
  }

  Future<Response> confirmEmail(Request request) async {
    final params = ConfirmEmailParams.fromJson(request.data);
    final result = await confirmEmailUseCase(params);

    return result.fold(
      (failure) => failureMapper.resolveToResponse(failure, request),
      (_) => Response(),
    );
  }

  Future<Response> sendAuthCode(Request request) async {
    final params = SendAuthCodeParams.fromJson(request.data);
    final result = await sendAuthCodeUseCase(params);

    return result.fold(
      (failure) => failureMapper.resolveToResponse(failure, request),
      (_) => Response(),
    );
  }

  Future<Response> refreshSession(Request request) async {
    final params = RefreshSessionParams.fromJson({
      ...request.data,
      'ipAddress': request.ip,
      'userAgent': request.userAgent,
    });

    final result = await refreshSessionUseCase(params);

    return result.fold(
      (failure) => failureMapper.resolveToResponse(failure, request),
      (view) => Response.json(body: view.toJson()),
    );
  }

  Future<Response> logout(Request request) async {
    final info = request.clientInfo;

    final params = LogoutParams(userId: info.userId!, sessionId: info.sessionId!);
    final result = await logoutUseCase(params);

    return result.fold(
      (failure) => failureMapper.resolveToResponse(failure, request),
      (_) => Response(),
    );
  }

  Future<Response> confirmPasswordReset(Request request) async {
    final params = ConfirmPasswordResetParams.fromJson(request.data);
    final result = await confirmPasswordResetUseCase(params);

    return result.fold(
      (failure) => failureMapper.resolveToResponse(failure, request),
      (_) => Response(),
    );
  }

  Future<Response> getUser(Request request) async {
    final params = GetUserParams(userId: request.clientInfo.userId!);
    final result = await getUserUseCase(params);

    return result.fold(
      (failure) => failureMapper.resolveToResponse(failure, request),
      (user) => Response.json(body: user),
    );
  }
}
