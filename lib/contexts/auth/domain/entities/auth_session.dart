import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/domain/domain.dart';

class AuthSession extends Entity {
  AuthSession({
    required this.expiresAt,
    required this.tokenHash,
    required this.ipAddress,
    required this.userAgent,
    required super.id,
    required super.updatedAt,
    required super.createdAt,
    this.invalidatedAt,
  });

  static Result<AuthSession> create({
    required String tokenHash,
    required String ipAddress,
    required String userAgent,
    required DateTime expiresAt,
    String? id,
  }) {
    final AuthSession session = AuthSession(
      expiresAt: expiresAt,
      tokenHash: tokenHash,
      ipAddress: ipAddress,
      userAgent: userAgent,
      id: id,
      updatedAt: null,
      createdAt: null,
    );

    return Success(session);
  }

  DateTime expiresAt;
  String tokenHash;
  String ipAddress;
  String userAgent;
  DateTime? invalidatedAt;

  bool get isExpired => DateTime.timestamp().isAfter(expiresAt);

  bool get isInvalidated => invalidatedAt != null;

  bool get isValid => !isExpired && !isInvalidated;

  Result<void> refresh({
    required bool isTokenValid,
    required String newTokenHash,
    required String ipAddress,
    required String userAgent,
    required DateTime expiresAt,
  }) {
    if (!isTokenValid) return Failure(AuthTokenInvalid());
    if (!isValid) return Failure(AuthSessionInvalid());

    tokenHash = newTokenHash;
    this.ipAddress = ipAddress;
    this.userAgent = userAgent;
    this.expiresAt = expiresAt;

    updateTimestamp();
    return const Success(null);
  }
}
