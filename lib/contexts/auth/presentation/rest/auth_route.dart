import 'package:epp_backend/contexts/auth/presentation/rest/auth_controller.dart';
import 'package:ruta/annotations.dart';
import 'package:ruta/ruta.dart';

@rutaRoute
class AuthRoute extends Route {
  AuthRoute({required this.controller});

  final AuthController controller;

  @override
  String get name => 'auth';

  Endpoint get signUp {
    return Endpoint.post(
      path: 'sign-up',
      handler: controller.signUp,
      body: [
        Field<String>('email'),
        Field<String>('password'),
        Field<String>('displayName'),
      ],
    );
  }

  Endpoint get login {
    return Endpoint.post(
      path: 'login',
      handler: controller.login,
      body: [
        Field<String>('email'),
        Field<String>('password'),
      ],
    );
  }

  Endpoint get confirmEmail {
    return Endpoint.post(
      path: 'confirm-email',
      handler: controller.confirmEmail,
      body: [
        Field<String>('email'),
        Field<String>('code'),
      ],
    );
  }

  Endpoint get sendAuthCode {
    return Endpoint.post(
      path: 'send-code',
      handler: controller.sendAuthCode,
      body: [
        Field<String>('email'),
        Field<String>('type'),
      ],
    );
  }
}
