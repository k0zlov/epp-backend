import 'package:epp_backend/app/database/database.dart';
import 'package:epp_backend/contexts/auth/domain/aggregates/user.dart';
import 'package:epp_backend/contexts/auth/infrastructure/mappers/auth_session_row_x.dart';
import 'package:epp_backend/contexts/auth/infrastructure/mappers/auth_token_row_x.dart';

extension UserRowX on UserRow {
  User toDomain({
    required List<AuthSessionRow> sessionRows,
    required List<AuthTokenRow> tokenRows,
  }) {
    return User(
      id: id,
      email: email,
      passwordHash: passwordHash,
      isVerified: isVerified,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      sessions: sessionRows.map((s) => s.toDomain()).toList(),
      tokens: tokenRows.map((t) => t.toDomain()).toList(),
    );
  }
}
