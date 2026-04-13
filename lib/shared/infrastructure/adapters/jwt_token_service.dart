import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:epp_backend/shared/application/ports/token_service.dart';

class JwtTokenService implements TokenService {
  const JwtTokenService({required String refreshKey, required String accessKey})
    : _refreshKey = refreshKey,
      _accessKey = accessKey;

  final String _refreshKey;
  final String _accessKey;

  SecretKey _secretKey(TokenType type) => SecretKey(type == TokenType.access ? _accessKey : _refreshKey);

  @override
  String issueToken({
    required String userId,
    required Duration expiresIn,
    required TokenType type,
  }) {
    final jwt = JWT({'userId': userId});
    return jwt.sign(_secretKey(type), expiresIn: expiresIn);
  }

  @override
  bool isValid(String token, [TokenType type = TokenType.access]) {
    try {
      JWT.verify(token, _secretKey(type));
      return true;
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return false;
    }
  }

  @override
  String? extractUserId(String token, [TokenType type = TokenType.access]) {
    if (!isValid(token, type)) return null;

    final jwt = JWT.decode(token);
    // ignore: avoid_dynamic_calls
    return jwt.payload['userId'] as String;
  }
}
