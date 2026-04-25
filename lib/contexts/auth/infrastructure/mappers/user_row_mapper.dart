import 'package:epp_backend/app/database/database.dart';
import 'package:epp_backend/contexts/auth/domain/aggregates/user.dart';
import 'package:epp_backend/contexts/auth/infrastructure/mappers/auth_code_row_mapper.dart';
import 'package:epp_backend/contexts/auth/infrastructure/mappers/auth_session_row_mapper.dart';

extension UserRowMapper on UserRow {
  User toDomain({
    required List<AuthSessionRow> sessionRows,
    required List<AuthCodeRow> codeRows,
  }) {
    return User(
      id: id,
      displayName: displayName,
      email: email,
      passwordHash: passwordHash,
      isVerified: isVerified,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      sessions: sessionRows.map((s) => s.toDomain()).toList(),
      codes: codeRows.map((t) => t.toDomain()).toList(),
    );
  }

  static UserRow fromDomain(User user) {
    return UserRow(
      id: user.id,
      displayName: user.displayName,
      email: user.email,
      passwordHash: user.passwordHash,
      isVerified: user.isVerified,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
      deletedAt: user.deletedAt,
    );
  }
}
