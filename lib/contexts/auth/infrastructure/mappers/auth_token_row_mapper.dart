import 'package:epp_backend/app/database/database.dart';
import 'package:epp_backend/contexts/auth/domain/entities/auth_token.dart';

extension AuthTokenRowMapper on AuthTokenRow {
  AuthToken toDomain() {
    return AuthToken(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      tokenHash: tokenHash,
      type: type,
      expiresAt: expiresAt,
    );
  }

  static AuthTokenRow fromDomain(AuthToken token, {required String userId}) {
    return AuthTokenRow(
      id: token.id,
      userId: userId,
      tokenHash: token.tokenHash,
      type: token.type,
      expiresAt: token.expiresAt,
      createdAt: token.createdAt,
      updatedAt: token.updatedAt,
    );
  }
}
