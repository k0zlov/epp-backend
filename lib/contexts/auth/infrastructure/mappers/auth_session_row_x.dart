import 'package:epp_backend/app/database/database.dart';
import 'package:epp_backend/contexts/auth/domain/entities/auth_session.dart';

extension AuthSessionRowX on AuthSessionRow {
  AuthSession toDomain() {
    return AuthSession(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      expiresAt: expiresAt,
      refreshToken: refreshToken,
      ipAddress: ipAddress,
      userAgent: userAgent,
    );
  }
}
