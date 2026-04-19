import 'package:epp_backend/shared/domain/domain.dart';

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

  static Result<AuthSession> create({
    required String refreshToken,
    required String ipAddress,
    required String userAgent,
    required DateTime expiresAt,
  }) {
    final AuthSession session = AuthSession(
      expiresAt: expiresAt,
      refreshToken: refreshToken,
      ipAddress: ipAddress,
      userAgent: userAgent,
      id: null,
      updatedAt: null,
      createdAt: null,
    );

    return Success(session);
  }

  final DateTime expiresAt;
  final String refreshToken;
  final String ipAddress;
  final String userAgent;
}
