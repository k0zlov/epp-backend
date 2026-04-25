import 'package:epp_backend/shared/application/base/token_payload.dart';
import 'package:epp_backend/shared/application/ports/token_service.dart';
import 'package:epp_backend/shared/infrastructure/base/client_info.dart';
import 'package:epp_backend/shared/presentation/extensions/request_x.dart';
import 'package:ruta/ruta.dart';
import 'package:uuid/v4.dart';

class AuthMiddleware extends Middleware {
  AuthMiddleware({required this.tokenService});

  final TokenService tokenService;

  String? _extractToken(Request request) {
    if (request.isSocketConnection) {
      return request.socketToken;
    }
    return request.bearerToken;
  }

  String? _extractClientId(Request request) {
    if (request.isSocketConnection) {
      return request.socketClientId;
    }
    return request.clientId;
  }

  @override
  Handler call(Handler handler) {
    return (Request request) async {
      final String? token = _extractToken(request);
      final String? clientId = _extractClientId(request);

      TokenPayload? tokenPayload;

      if (token != null && tokenService.verify(token)) {
        tokenPayload = tokenService.extractPayload(token);
      }

      final clientInfo = ClientInfo(
        clientId: clientId ?? const UuidV4().generate(),
        userId: tokenPayload?.userId,
        sessionId: tokenPayload?.sessionId,
      );

      final newRequest = request.copyWith(
        context: {...request.context, 'clientInfo': clientInfo},
      );

      return handler(newRequest);
    };
  }
}
