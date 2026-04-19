import 'package:epp_backend/contexts/auth/domain/enums/auth_code_type.dart';
import 'package:epp_backend/contexts/auth/domain/failures/auth_failures.dart';
import 'package:epp_backend/shared/domain/domain.dart';

class AuthCode extends Entity {
  AuthCode({
    required super.id,
    required super.updatedAt,
    required super.createdAt,
    required this.hash,
    required this.type,
    required this.expiresAt,
    required this.invalidatedAt,
    required this.usedAt,
    required this.attempts,
  });

  static Result<AuthCode> create({
    required String hash,
    required AuthCodeType type,
    required DateTime expiresAt,
  }) {
    final secret = AuthCode(
      id: null,
      updatedAt: null,
      createdAt: null,
      invalidatedAt: null,
      hash: hash,
      type: type,
      expiresAt: expiresAt,
      usedAt: null,
      attempts: 0,
    );

    return Success(secret);
  }

  final String hash;
  final AuthCodeType type;
  final DateTime expiresAt;

  DateTime? usedAt;
  DateTime? invalidatedAt;
  int attempts;

  bool get isUsed => usedAt != null;

  bool get isInvalidated => invalidatedAt != null;

  bool get isMaxAttemptsReached => attempts >= 5;

  bool get isExpired => DateTime.now().isAfter(expiresAt);

  bool get canBeUsed => !isExpired && !isUsed && !isMaxAttemptsReached && !isInvalidated;

  void invalidate() {
    if (isInvalidated || isUsed) return;

    invalidatedAt = DateTime.now();
    updateTimestamp();
  }

  Result<void> use({required bool isCodeCorrect}) {
    if (isUsed) {
      return Failure(AuthCodeAlreadyUsed());
    }

    if (isExpired) {
      return Failure(AuthCodeExpired());
    }

    if (isMaxAttemptsReached) {
      return Failure(AuthCodeMaxAttemptsReached());
    }

    if (!isCodeCorrect) {
      attempts++;
      updateTimestamp();

      if (isMaxAttemptsReached) {
        return Failure(AuthCodeMaxAttemptsReached());
      }

      return Failure(AuthCodeIncorrect(remainingAttempts: 5 - attempts));
    }

    usedAt = DateTime.timestamp();
    updateTimestamp();
    return const Success(null);
  }
}
