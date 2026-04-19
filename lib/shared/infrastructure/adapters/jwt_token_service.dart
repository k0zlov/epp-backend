import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:epp_backend/shared/application/base/token_payload.dart';
import 'package:epp_backend/shared/application/ports/token_service.dart';

class JwtTokenService implements TokenService {
  const JwtTokenService({
    required String refreshKey,
    required String accessKey,
    this.accessTokenExpiresIn = const Duration(minutes: 30),
    this.refreshTokenExpiresIn = const Duration(days: 15),
  }) : _refreshKey = refreshKey,
       _accessKey = accessKey;

  final String _refreshKey;
  final String _accessKey;

  SecretKey _secretKey(TokenType type) => SecretKey(type == TokenType.access ? _accessKey : _refreshKey);

  @override
  final Duration accessTokenExpiresIn;
  @override
  final Duration refreshTokenExpiresIn;

  @override
  String issue({
    required TokenPayload payload,
    required TokenType type,
  }) {
    final jwt = JWT(payload.toJson());
    return jwt.sign(
      _secretKey(type),
      expiresIn: type == TokenType.access ? accessTokenExpiresIn : refreshTokenExpiresIn,
    );
  }

  @override
  bool verify(String token, [TokenType type = TokenType.access]) {
    try {
      JWT.verify(token, _secretKey(type));
      return true;
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return false;
    }
  }

  @override
  TokenPayload? extractPayload(String token, [TokenType type = TokenType.access]) {
    try {
      final jwt = JWT.verify(token, _secretKey(type));

      final data = jwt.payload;
      if (data is! Map<String, dynamic>) return null;

      return TokenPayload.fromJson(data);
    } catch (_) {
      return null;
    }
  }
}
