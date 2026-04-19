import 'package:epp_backend/shared/application/base/token_payload.dart';

enum TokenType { access, refresh }

abstract interface class TokenService {
  Duration get accessTokenExpiresIn;

  Duration get refreshTokenExpiresIn;

  /// Used by the Auth Context during login
  String issue({required TokenPayload payload, required TokenType type});

  bool verify(String token, [TokenType type = TokenType.access]);

  TokenPayload? extractPayload(String token, [TokenType type = TokenType.access]);
}
