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
  String passwordHash;
  String displayName;
  bool isVerified;
  final DateTime? deletedAt;

  final List<AuthSession> _sessions;
  final List<AuthCode> _codes;

  List<AuthSession> get sessions => List.unmodifiable(_sessions);

  List<AuthCode> get codes => List.unmodifiable(_codes);

  Result<void> authenticate({
    required String sessionId,
    required String refreshTokenHash,
    required String ipAddress,
    required String userAgent,
    required DateTime expiresAt,
  }) {
    final sessionResult = AuthSession.create(
      id: sessionId,
      tokenHash: refreshTokenHash,
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

  Result<AuthCode> findCode({required AuthCodeType type}) {
    final AuthCode? code = _codes.firstWhereOrNull(
      (e) => e.canBeUsed && e.type == AuthCodeType.emailVerification,
    );

    if (code == null) {
      return Failure(AuthCodeNotFound());
    }

    return Success(code);
  }

  Result<void> confirmEmail({required String codeId, required bool isCodeCorrect}) {
    final AuthCode? code = _codes.firstWhereOrNull((e) => e.id == codeId);

    if (code == null) {
      return Failure(AuthCodeNotFound());
    }

    if (isVerified) {
      return Failure(UserAlreadyVerified());
    }

    final result = code.use(isCodeCorrect: isCodeCorrect);

    updateTimestamp();

    if (result.isFailure) {
      addEvent(EmailConfirmationFailedEvent(user: this, code: code));
      return result;
    }

    isVerified = true;

    addEvent(EmailConfirmedEvent(user: this, code: code));
    return const Success(null);
  }

  Result<void> createAuthCode({
    required String codeHash,
    required AuthCodeType type,
    required DateTime expiresAt,
  }) {
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

  Result<AuthSession> findSession({required String sessionId}) {
    final session = _sessions.firstWhereOrNull((e) => e.id == sessionId);

    if (session == null) {
      return Failure(AuthSessionNotFound());
    }

    return Success(session);
  }

  Result<void> refreshSession({
    required bool isTokenValid,
    required String newTokenHash,
    required String sessionId,
    required String ipAddress,
    required String userAgent,
    required DateTime expiresAt,
  }) {
    final sessionResult = findSession(sessionId: sessionId);

    if (sessionResult.isFailure) return sessionResult;

    final session = sessionResult.getSuccess;

    final result = session.refresh(
      isTokenValid: isTokenValid,
      newTokenHash: newTokenHash,
      ipAddress: ipAddress,
      userAgent: userAgent,
      expiresAt: expiresAt,
    );

    if (result.isFailure && !isTokenValid) {
      updateTimestamp();
      addEvent(AuthTokenReuseDetectedEvent(user: this, session: session));
    }

    if (result.isFailure) return result;

    updateTimestamp();
    addEvent(AuthSessionRefreshedEvent(user: this, session: session));
    return const Success(null);
  }

  Result<void> logout({required String sessionId}) {
    final sessionResult = findSession(sessionId: sessionId);

    if (sessionResult.isFailure) return sessionResult;

    final AuthSession session = sessionResult.getSuccess;
    final result = session.logout();

    if (result.isFailure) return result;

    updateTimestamp();
    addEvent(UserLoggedOutEvent(user: this, session: session));
    return const Success(null);
  }

  Result<void> resetPassword({
    required String codeId,
    required bool isCodeCorrect,
    required String newPasswordHash,
  }) {
    final AuthCode? code = _codes.firstWhereOrNull((e) => e.id == codeId);

    if (code == null) return Failure(AuthCodeNotFound());

    final result = code.use(isCodeCorrect: isCodeCorrect);

    if (result.isFailure) {
      updateTimestamp();
      addEvent(PasswordResetFailedEvent(user: this, code: code));
      return result;
    }

    passwordHash = newPasswordHash;

    for (final e in _sessions) {
      e.invalidate();
    }

    updateTimestamp();
    addEvent(UserPasswordResetEvent(user: this, code: code, sessions: sessions));
    return const Success(null);
  }
}
