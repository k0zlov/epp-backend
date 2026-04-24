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
  late AuthTestBench<void> bench;
  late LogoutUseCase useCase;

  setUp(() {
    bench = AuthTestBench<void>();

    useCase = LogoutUseCase(
      unitOfWork: bench.unitOfWork,
      repository: bench.userRepository,
      projector: bench.projector,
      eventBus: bench.eventBus,
      notificationService: bench.notificationService,
    );
  });

  group('LogoutUseCase Tests', () {
    MockUserRepository repo() => bench.userRepository;
    MockNotificationService notify() => bench.notificationService;

    LogoutParams params() => LogoutParams(
      userId: bench.tUserId,
      sessionId: bench.tSessionId,
    );

    AuthSession createActiveSession() => AuthSession(
      id: bench.tSessionId,
      tokenHash: 'hash',
      ipAddress: bench.tIpAddress,
      userAgent: bench.tUserAgent,
      createdAt: DateTime.now(),
      expiresAt: DateTime.now().add(const Duration(days: 1)),
      invalidatedAt: null,
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

    test('should successfully logout and notify session', () async {
      final tUser = createUserWithSession();

      when(() => repo().getUserById(bench.tUserId)).thenAnswer((_) async => tUser);

      final result = await useCase(params());

      expect(result.isSuccess, isTrue);
      expect(tUser.sessions.first.invalidatedAt, isNotNull);

      verify(
        () => notify().send(
          any(
            that: isA<NotificationMessage>()
                .having((m) => m.topic.scope, 'scope', NotificationScope.session)
                .having((m) => m.topic.id, 'id', bench.tSessionId)
                .having((m) => m.title, 'title', NotificationEvent.authLogout),
          ),
        ),
      ).called(1);

      verify(() => notify().closeSession(bench.tSessionId)).called(1);

      final events = bench.expectEventsSynchronized();
      expectEvent<UserLoggedOutEvent>(events);
    });

    test('should return UserNotFound and not notify when user missing', () async {
      when(() => repo().getUserById(any())).thenAnswer((_) async => null);

      final result = await useCase(params());

      expect(result.isFailure, isTrue);
      expect(result.getFailure, isA<UserNotFound>());

      verifyNever(() => notify().send(any()));
      verifyNever(() => notify().closeSession(any()));
    });

    test('should return Failure when session missing', () async {
      final tUser = bench.tUser;
      when(() => repo().getUserById(bench.tUserId)).thenAnswer((_) async => tUser);

      final result = await useCase(params());

      expect(result.isFailure, isTrue);
      expect(result.getFailure, isA<AuthSessionNotFound>());

      verifyNever(() => notify().send(any()));
      verifyNever(() => notify().closeSession(any()));
    });
  });
}
