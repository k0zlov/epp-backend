import 'package:epp_backend/app/database/database.dart';
import 'package:epp_backend/contexts/auth/domain/entities/auth_token.dart';

extension AuthTokenRowX on AuthTokenRow {
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
}
