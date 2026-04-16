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
      ],
    );
  }
}
