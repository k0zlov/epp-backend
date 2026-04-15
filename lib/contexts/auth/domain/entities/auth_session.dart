import 'package:epp_backend/shared/domain/base/entity.dart';

class AuthSession extends Entity {
  AuthSession({
    required this.expiresAt,
    required this.refreshToken,
    required this.ipAddress,
    required this.userAgent,
    required super.id,
    required super.updatedAt,
    required super.createdAt,
  });

  final DateTime expiresAt;
  final String refreshToken;
  final String ipAddress;
  final String userAgent;
}
