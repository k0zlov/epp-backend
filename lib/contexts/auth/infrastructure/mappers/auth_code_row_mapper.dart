import 'package:epp_backend/app/database/database.dart';
import 'package:epp_backend/contexts/auth/domain/entities/auth_code.dart';

extension AuthCodeRowMapper on AuthCodeRow {
  AuthCode toDomain() {
    return AuthCode(
      id: id,
      attempts: attempts,
      usedAt: usedAt,
      invalidatedAt: invalidatedAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
      hash: hash,
      type: type,
      expiresAt: expiresAt,

    );
  }

  static AuthCodeRow fromDomain(AuthCode code, {required String userId}) {
    return AuthCodeRow(
      id: code.id,
      userId: userId,
      hash: code.hash,
      type: code.type,
      expiresAt: code.expiresAt,
      createdAt: code.createdAt,
      updatedAt: code.updatedAt,
      attempts: code.attempts,
      invalidatedAt: code.invalidatedAt,
      usedAt: code.usedAt,
    );
  }
}
