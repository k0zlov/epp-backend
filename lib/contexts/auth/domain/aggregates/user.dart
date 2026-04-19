import 'package:collection/collection.dart';
import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/domain/base/aggregate.dart';
import 'package:epp_backend/shared/domain/base/result.dart';
import 'package:epp_backend/shared/infrastructure/infrastructure.dart';

class User extends Aggregate {
  User({
    required this.deletedAt,
    required this.email,
    required this.passwordHash,
    required this.isVerified,
    required super.id,
    required super.updatedAt,
    required super.createdAt,
    required this.displayName,
    List<AuthCode>? codes,
    List<AuthSession>? sessions,
  }) : _codes = codes ?? [],
       _sessions = sessions ?? [];

  static Result<User> create({
    required Email email,
    required String passwordHash,
    required String displayName,
  }) {
    final User user = User(
      displayName: displayName,
      email: email,
      passwordHash: passwordHash,
      isVerified: false,
      id: null,
      deletedAt: null,
      updatedAt: null,
      createdAt: null,
    );

    user.addEvent(UserSignedUpEvent(user: user));
    return Success(user);
  }

  final Email email;
  final String passwordHash;
  String displayName;
  bool isVerified;
  final DateTime? deletedAt;

  final List<AuthSession> _sessions;
  final List<AuthCode> _codes;

  List<AuthSession> get sessions => List.unmodifiable(_sessions);

  List<AuthCode> get codes => List.unmodifiable(_codes);

  Result<void> authenticate({
    required String refreshToken,
    required String ipAddress,
    required String userAgent,
    required DateTime expiresAt,
  }) {
    final sessionResult = AuthSession.create(
      refreshToken: refreshToken,
      ipAddress: ipAddress,
      userAgent: userAgent,
      expiresAt: expiresAt,
    );

    return sessionResult.fold(Failure.new, (session) {
      _sessions.add(session);

      updateTimestamp();

      addEvent(UserLoggedInEvent(user: this, session: session));

      return const Success(null);
    });
  }

  Result<AuthCode> findSecret({required AuthCodeType type}) {
    final AuthCode? code = _codes.firstWhereOrNull(
      (e) => e.canBeUsed && e.type == AuthCodeType.emailVerification,
    );

    if (code == null) {
      return Failure(AuthCodeNotFound());
    }

    return Success(code);
  }

  Result<void> confirmEmail({required String secretId, required bool isSecretCorrect}) {
    final AuthCode? code = _codes.firstWhereOrNull((e) => e.id == secretId);

    if (code == null) {
      return Failure(AuthCodeNotFound());
    }

    if (isVerified) {
      return Failure(UserAlreadyVerified());
    }

    final result = code.use(isCodeCorrect: isSecretCorrect);

    updateTimestamp();

    if (result.isFailure) {
      addEvent(EmailConfirmationFailedEvent(user: this, code: code));
      return result;
    }

    isVerified = true;

    addEvent(EmailConfirmedEvent(user: this, code: code));
    return const Success(null);
  }

  Result<void> createAuthCode({required String codeHash, required AuthCodeType type}) {
    if (type == AuthCodeType.emailVerification && isVerified) return Failure(UserAlreadyVerified());

    final lastCode = _codes.where((e) => e.type == type).lastOrNull;

    if (lastCode != null) {
      final now = DateTime.timestamp();
      final difference = now.difference(lastCode.createdAt);

      if (difference < const Duration(minutes: 1)) {
        return Failure(AuthCodeRequestTooFrequent(retryAfterSeconds: 60 - difference.inSeconds));
      }
    }

    final List<AuthCode> invalidatedCodes = _codes.where((e) => e.type == type).toList()
      ..forEach((e) => e.invalidate());

    final expiresAt = DateTime.now().add(const Duration(minutes: 15));

    final result = AuthCode.create(
      hash: codeHash,
      type: type,
      expiresAt: expiresAt,
    );

    if (result.isFailure) return result;

    final AuthCode authCode = result.getSuccess;
    _codes.add(authCode);

    updateTimestamp();

    addEvent(
      AuthCodeCreatedEvent(
        user: this,
        code: authCode,
        invalidatedCodes: invalidatedCodes,
      ),
    );
    return const Success(null);
  }
}
