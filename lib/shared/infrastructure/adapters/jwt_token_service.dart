import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/application/base/infrastructure_error_code.dart';

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
    try {
      final jwt = JWT(payload.toJson());
      return jwt.sign(
        _secretKey(type),
        expiresIn: type == TokenType.access ? accessTokenExpiresIn : refreshTokenExpiresIn,
      );
    } on JWTException catch (e, st) {
      throw InfrastructureException(
        code: InfrastructureErrorCode.internalError,
        message: 'JWT signing failed: ${e.message}',
        error: e,
        stackTrace: st,
      );
    } catch (e, st) {
      throw InfrastructureException(
        code: InfrastructureErrorCode.unexpectedError,
        message: 'Unexpected error during JWT issuing',
        error: e,
        stackTrace: st,
      );
    }
  }

  @override
  bool verify(String token, {TokenType type = TokenType.access}) {
    try {
      JWT.verify(token, _secretKey(type));
      return true;
    } on JWTExpiredException {
      return false;
    } on JWTInvalidException {
      return false;
    } on JWTNotActiveException {
      return false;
    } on JWTException catch (e, st) {
      throw InfrastructureException(
        code: InfrastructureErrorCode.internalError,
        message: 'JWT verification infrastructure failure: ${e.message}',
        error: e,
        stackTrace: st,
      );
    } catch (e, st) {
      throw InfrastructureException(
        code: InfrastructureErrorCode.unexpectedError,
        message: 'Unexpected error during JWT verification',
        error: e,
        stackTrace: st,
      );
    }
  }

  @override
  TokenPayload? extractPayload(String token, {TokenType type = TokenType.access}) {
    try {
      final jwt = JWT.verify(token, _secretKey(type));

      final data = jwt.payload;
      if (data is! Map<String, dynamic>) return null;

      return TokenPayload.fromJson(data);
    } on JWTExpiredException {
      return null;
    } on JWTInvalidException {
      return null;
    } on JWTException catch (e, st) {
      throw InfrastructureException(
        code: InfrastructureErrorCode.internalError,
        message: 'JWT payload extraction failure: ${e.message}',
        error: e,
        stackTrace: st,
      );
    } catch (e, st) {
      throw InfrastructureException(
        code: InfrastructureErrorCode.unexpectedError,
        message: 'Unexpected error during JWT payload extraction',
        error: e,
        stackTrace: st,
      );
    }
  }
}
