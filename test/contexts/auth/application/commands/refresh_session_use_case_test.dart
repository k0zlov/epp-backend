import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/infrastructure/infrastructure.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../helpers/functions/expect_event.dart';
import '../../../../helpers/mocks/auth_mocks.dart';
import '../../../../helpers/mocks/shared_mocks.dart';
import '../../../../helpers/test_benches/auth_test_bench.dart';

void main() {
  late AuthTestBench<TokensView> bench;
  late RefreshSessionUseCase useCase;

  setUp(() {
    bench = AuthTestBench<TokensView>();

    useCase = RefreshSessionUseCase(
      notificationService: bench.notificationService,
      tokenService: bench.tokenService,
      unitOfWork: bench.unitOfWork,
      repository: bench.userRepository,
      eventBus: bench.eventBus,
      projector: bench.projector,
      hashService: bench.hashService,
    );
  });

  group('RefreshSessionUseCase Tests', () {
    MockUserRepository repo() => bench.userRepository;
    MockTokenService tokenService() => bench.tokenService;
    MockHashService hashService() => bench.hashService;
    MockNotificationService notify() => bench.notificationService;

    RefreshSessionParams params() => RefreshSessionParams(
      refreshToken: bench.tOldRefreshToken,
      ipAddress: bench.tIpAddress,
      userAgent: bench.tUserAgent,
    );

    AuthSession createActiveSession() => AuthSession(
      id: bench.tSessionId,
      tokenHash: bench.tHash,
      ipAddress: bench.tIpAddress,
      userAgent: bench.tUserAgent,
      createdAt: DateTime.now(),
      expiresAt: DateTime.now().add(const Duration(days: 1)),
      updatedAt: null,
    );

    User createUserWithSession() => User(
      id: bench.tUserId,
      email: Email(bench.tEmail),
      passwordHash: bench.tHash,
      isVerified: true,
      createdAt: DateTime.now(),
      displayName: bench.tDisplayName,
      deletedAt: null,
      updatedAt: null,
      sessions: [createActiveSession()],
    );

    test('should successfully refresh session and send notification', () async {
      final tUser = createUserWithSession();
      final tPayload = TokenPayload(userId: bench.tUserId, sessionId: bench.tSessionId);

      when(() => tokenService().extractPayload(bench.tOldRefreshToken, type: TokenType.refresh)).thenReturn(tPayload);
      when(() => repo().getUserById(bench.tUserId)).thenAnswer((_) async => tUser);
      when(() => hashService().verify(bench.tOldRefreshToken, bench.tHash)).thenAnswer((_) async => true);

      when(
        () => tokenService().issue(
          payload: any(named: 'payload'),
          type: TokenType.refresh,
        ),
      ).thenReturn(bench.tNewRefreshToken);
      when(() => hashService().hash(bench.tNewRefreshToken)).thenAnswer((_) async => bench.tNewHash);
      when(
        () => tokenService().issue(
          payload: any(named: 'payload'),
          type: TokenType.access,
        ),
      ).thenReturn(bench.tNewAccessToken);

      final result = await useCase(params());

      expect(result.isSuccess, isTrue);
      expect(result.getSuccess.accessToken, bench.tNewAccessToken);
      expect(result.getSuccess.refreshToken, bench.tNewRefreshToken);
      expect(tUser.sessions.first.tokenHash, bench.tNewHash);

      verify(
        () => notify().send(
          any(
            that: isA<NotificationMessage>()
                .having((m) => m.topic.scope, 'scope', NotificationScope.session)
                .having((m) => m.topic.id, 'id', bench.tSessionId)
                .having((m) => m.title, 'title', NotificationEvent.authTokenRefreshed),
          ),
        ),
      ).called(1);

      final events = bench.expectEventsSynchronized();
      expectEvent<AuthSessionRefreshedEvent>(events);
    });

    test('should return AuthTokenInvalid when payload extraction fails', () async {
      when(() => tokenService().extractPayload(any(), type: TokenType.refresh)).thenReturn(null);

      final result = await useCase(params());

      expect(result.isFailure, isTrue);
      expect(result.getFailure, isA<AuthTokenInvalid>());
      verifyNever(() => repo().getUserById(any()));
      verifyNever(() => notify().send(any()));
    });

    test('should return Failure and not notify when token reuse detected', () async {
      final tUser = createUserWithSession();
      final tPayload = TokenPayload(userId: bench.tUserId, sessionId: bench.tSessionId);

      when(() => tokenService().extractPayload(bench.tOldRefreshToken, type: TokenType.refresh)).thenReturn(tPayload);
      when(() => repo().getUserById(bench.tUserId)).thenAnswer((_) async => tUser);
      when(() => hashService().verify(bench.tOldRefreshToken, bench.tHash)).thenAnswer((_) async => false);

      when(
        () => tokenService().issue(
          payload: any(named: 'payload'),
          type: TokenType.refresh,
        ),
      ).thenReturn(bench.tNewRefreshToken);
      when(() => hashService().hash(bench.tNewRefreshToken)).thenAnswer((_) async => bench.tNewHash);

      final result = await useCase(params());

      expect(result.isFailure, isTrue);
      verifyNever(() => notify().send(any()));

      final events = bench.expectEventsSynchronized();
      expectEvent<AuthTokenReuseDetectedEvent>(events);
    });

    test('should return UserNotFound when user is missing', () async {
      final tPayload = TokenPayload(userId: bench.tUserId, sessionId: bench.tSessionId);
      when(() => tokenService().extractPayload(any(), type: TokenType.refresh)).thenReturn(tPayload);
      when(() => repo().getUserById(any())).thenAnswer((_) async => null);

      final result = await useCase(params());

      expect(result.isFailure, isTrue);
      expect(result.getFailure, isA<UserNotFound>());
      verifyNever(() => notify().send(any()));
    });
  });
}
