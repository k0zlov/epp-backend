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
  late ConfirmPasswordResetUseCase useCase;

  setUp(() {
    bench = AuthTestBench<void>();

    useCase = ConfirmPasswordResetUseCase(
      unitOfWork: bench.unitOfWork,
      repository: bench.userRepository,
      hashService: bench.hashService,
      projector: bench.projector,
      eventBus: bench.eventBus,
      notificationService: bench.notificationService,
    );
  });

  group('ConfirmPasswordResetUseCase Tests', () {
    MockUserRepository repo() => bench.userRepository;
    MockHashService hashService() => bench.hashService;
    MockNotificationService notify() => bench.notificationService;

    String email() => bench.tEmail;
    String newPassword() => 'NewPassword123!';
    String newPasswordHash() => 'new_hashed_password';
    String code() => '654321';
    String codeHash() => 'hashed_reset_code';

    ConfirmPasswordResetParams params() => ConfirmPasswordResetParams(
      email: email(),
      newPassword: newPassword(),
      code: code(),
    );

    AuthCode createResetCode() => AuthCode(
      id: 'reset_code_id',
      hash: codeHash(),
      type: AuthCodeType.passwordReset,
      createdAt: DateTime.now(),
      expiresAt: DateTime.now().add(const Duration(minutes: 15)),
      updatedAt: null,
      invalidatedAt: null,
      usedAt: null,
      attempts: 0,
    );

    User createUserWithResetCode() => User(
      id: bench.tUserId,
      email: Email(email()),
      passwordHash: 'old_hash',
      isVerified: true,
      createdAt: DateTime.now(),
      displayName: bench.tDisplayName,
      deletedAt: null,
      updatedAt: null,
      codes: [createResetCode()],
    );

    test('should successfully reset password, notify user and close all sessions', () async {
      final tUser = createUserWithResetCode();

      when(() => repo().getUserByEmail(email())).thenAnswer((_) async => tUser);
      when(() => hashService().verify(code(), codeHash())).thenAnswer((_) async => true);
      when(() => hashService().hash(newPassword())).thenAnswer((_) async => newPasswordHash());

      final result = await useCase(params());

      // Assertions: Domain
      expect(result.isSuccess, isTrue);
      expect(tUser.passwordHash, equals(newPasswordHash()));

      // Assertions: Notifications
      verify(
        () => notify().send(
          any(
            that: isA<NotificationMessage>().having(
              (m) => m.title,
              'title',
              NotificationEvent.authLogout,
            ),
          ),
        ),
      ).called(1);

      verify(() => notify().closeUser(tUser.id)).called(1);

      // Assertions: Infrastructure
      verify(() => repo().getUserByEmail(email())).called(1);

      final events = bench.expectEventsSynchronized();
      expectEvent<UserPasswordResetEvent>(events);
    });

    test('should return UserNotFound and not notify when user does not exist', () async {
      when(() => repo().getUserByEmail(any())).thenAnswer((_) async => null);

      final result = await useCase(params());

      expect(result.isFailure, isTrue);
      expect(result.getFailure, isA<UserNotFound>());

      verifyNever(() => notify().send(any()));
      verifyNever(() => notify().closeUser(any()));
    });

    test('should return AuthCodeNotFound when user has no reset code', () async {
      final tUser = bench.tUser;
      when(() => repo().getUserByEmail(email())).thenAnswer((_) async => tUser);

      final result = await useCase(params());

      expect(result.isFailure, isTrue);
      expect(result.getFailure, isA<AuthCodeNotFound>());

      verifyNever(() => notify().send(any()));
      verifyNever(() => notify().closeUser(any()));
    });

    test('should fail when code is incorrect and not notify/close sessions', () async {
      final tUser = createUserWithResetCode();

      when(() => repo().getUserByEmail(email())).thenAnswer((_) async => tUser);
      when(() => hashService().verify(code(), codeHash())).thenAnswer((_) async => false);
      when(() => hashService().hash(newPassword())).thenAnswer((_) async => newPasswordHash());

      final result = await useCase(params());

      expect(result.isFailure, isTrue);
      expect(tUser.passwordHash, equals('old_hash'));

      verifyNever(() => notify().send(any()));
      verifyNever(() => notify().closeUser(any()));

      final events = bench.expectEventsSynchronized();
      expectEvent<PasswordResetFailedEvent>(events);
    });
  });
}
