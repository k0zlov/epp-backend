import 'package:epp_backend/contexts/auth/domain/enums/auth_token_type.dart';
import 'package:epp_backend/shared/domain/base/entity.dart';

class AuthToken extends Entity {
  AuthToken({
    required super.id,
    required super.updatedAt,
    required super.createdAt,
    required this.tokenHash,
    required this.type,
    required this.expiresAt,
  });

  final String tokenHash;
  final AuthTokenType type;
  final DateTime expiresAt;
}
