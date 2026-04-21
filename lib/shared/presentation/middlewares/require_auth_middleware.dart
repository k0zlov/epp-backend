import 'dart:io';
import 'package:epp_backend/shared/presentation/presentation.dart';
import 'package:ruta/ruta.dart';

class RequireAuthMiddleware extends Middleware {
  @override
  Handler call(Handler handler) {
    return (Request request) async {
      final clientInfo = request.clientInfo;

      if (!clientInfo.isAuthorized) {
        return const PresentationError(
          statusCode: HttpStatus.unauthorized,
          code: 'Unauthorized',
          message: 'This action requires authentication.',
        ).toResponse();
      }

      return handler(request);
    };
  }
}
