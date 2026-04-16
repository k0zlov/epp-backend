import 'package:epp_backend/contexts/auth/application/commands/sign_up_use_case.dart';
import 'package:epp_backend/contexts/auth/presentation/errors/auth_failure_mapper.dart';
import 'package:epp_backend/shared/domain/base/failure.dart';
import 'package:ruta/ruta.dart';

class AuthController {
  const AuthController({
    required this.failureMapper,
    required this.signUpUseCase,
  });

  final SignUpUseCase signUpUseCase;
  final AuthFailureMapper failureMapper;

  Response _ifLeft(DomainFailureBase failure) {
    return failureMapper.resolve(failure).toResponse();
  }

  Future<Response> signUp(Request request) async {
    final SignUpParams params = SignUpParams.fromJson(request.data);

    final result = await signUpUseCase(params);

    return result.fold(_ifLeft, (_) => Response());
  }
}
