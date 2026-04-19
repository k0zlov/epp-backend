import 'package:epp_backend/contexts/auth/application/commands/confirm_email_use_case.dart';
import 'package:epp_backend/contexts/auth/application/commands/login_use_case.dart';
import 'package:epp_backend/contexts/auth/application/commands/send_auth_code_use_case.dart';
import 'package:epp_backend/contexts/auth/application/commands/sign_up_use_case.dart';
import 'package:epp_backend/contexts/auth/presentation/errors/auth_failure_mapper.dart';
import 'package:epp_backend/shared/domain/base/failure.dart';
import 'package:epp_backend/shared/presentation/presentation.dart';
import 'package:ruta/ruta.dart';

class AuthController {
  const AuthController({
    required this.failureMapper,
    required this.signUpUseCase,
    required this.loginUseCase,
    required this.confirmEmailUseCase,
    required this.sendAuthCodeUseCase,
  });

  final SignUpUseCase signUpUseCase;
  final LoginUseCase loginUseCase;
  final ConfirmEmailUseCase confirmEmailUseCase;
  final SendAuthCodeUseCase sendAuthCodeUseCase;
  final AuthFailureMapper failureMapper;

  Response _ifLeft(DomainFailureBase failure) {
    return failureMapper.resolve(failure).toResponse();
  }

  Future<Response> signUp(Request request) async {
    final params = SignUpParams.fromJson(request.data);
    final result = await signUpUseCase(params);

    return result.fold(_ifLeft, (_) => Response());
  }

  Future<Response> login(Request request) async {
    final params = LoginParams.fromJson({
      ...request.data,
      'ipAddress': request.ip,
      'userAgent': request.userAgent,
    });

    final result = await loginUseCase(params);

    return result.fold(
      _ifLeft,
      (view) => Response.json(body: view.toJson()),
    );
  }

  Future<Response> confirmEmail(Request request) async {
    final params = ConfirmEmailParams.fromJson(request.data);
    final result = await confirmEmailUseCase(params);

    return result.fold(_ifLeft, (_) => Response());
  }

  Future<Response> sendAuthCode(Request request) async {
    final params = SendAuthCodeParams.fromJson(request.data);
    final result = await sendAuthCodeUseCase(params);

    return result.fold(_ifLeft, (_) => Response());
  }
}
