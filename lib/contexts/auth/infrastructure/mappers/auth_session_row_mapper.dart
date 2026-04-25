import 'package:epp_backend/app/database/database.dart';
import 'package:epp_backend/contexts/auth/domain/entities/auth_session.dart';

extension AuthSessionRowMapper on AuthSessionRow {
  AuthSession toDomain() {
    return AuthSession(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      expiresAt: expiresAt,
      tokenHash: tokenHash,
      ipAddress: ipAddress,
      userAgent: userAgent,
      invalidatedAt: invalidatedAt,
    );
  }

  static AuthSessionRow fromDomain(AuthSession session, {required String userId}) {
    return AuthSessionRow(
      id: session.id,
      userId: userId,
      tokenHash: session.tokenHash,
      ipAddress: session.ipAddress,
      userAgent: session.userAgent,
      expiresAt: session.expiresAt,
      createdAt: session.createdAt,
      updatedAt: session.updatedAt,
      invalidatedAt: session.invalidatedAt,
    );
  }
}
