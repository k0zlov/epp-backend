import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/infrastructure/infrastructure.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../helpers/functions/expect_event.dart';
import '../../../../helpers/mocks/auth_mocks.dart';
import '../../../../helpers/mocks/shared_mocks.dart';
import '../../../../helpers/test_benches/auth_test_bench.dart';

void main() {
  late AuthTestBench<void> bench;
  late ConfirmEmailUseCase useCase;

  setUp(() {
    bench = AuthTestBench<void>();

    useCase = ConfirmEmailUseCase(
      unitOfWork: bench.unitOfWork,
      repository: bench.userRepository,
      hashService: bench.hashService,
      projector: bench.projector,
      eventBus: bench.eventBus,
    );
  });

  group('ConfirmEmailUseCase Tests', () {
    MockUserRepository repo() => bench.userRepository;
    MockHashService hashService() => bench.hashService;

    String email() => bench.tEmail;
    String code() => '123456';
    String codeHash() => 'hashed_code';

    ConfirmEmailParams params() => ConfirmEmailParams(
      code: code(),
      email: email(),
    );

    AuthCode createAuthCode() => AuthCode(
      id: 'code_id',
      hash: codeHash(),
      type: AuthCodeType.emailVerification,
      createdAt: DateTime.now(),
      expiresAt: DateTime.now().add(const Duration(minutes: 15)),
      updatedAt: null,
      invalidatedAt: null,
      usedAt: null,
      attempts: 0,
    );

    User createUserWithCodes() => User(
      id: bench.tUserId,
      email: Email(email()),
      passwordHash: bench.tHash,
      isVerified: false,
      createdAt: DateTime.now(),
      displayName: bench.tDisplayName,
      deletedAt: null,
      updatedAt: null,
      codes: [createAuthCode()],
    );

    User createUserWithoutCodes() => bench.tUser;

    test('should successfully confirm email and sync events when code is correct', () async {
      final tUser = createUserWithCodes();

      when(() => repo().getUserByEmail(email())).thenAnswer((_) async => tUser);
      when(() => hashService().verify(code(), codeHash())).thenAnswer((_) async => true);

      final result = await useCase(params());

      expect(result.isSuccess, isTrue);
      expect(tUser.isVerified, isTrue);

      verify(() => repo().getUserByEmail(email())).called(1);
      verify(() => hashService().verify(code(), codeHash())).called(1);

      final events = bench.expectEventsSynchronized();
      expectEvent<EmailConfirmedEvent>(events);
    });

    test('should return UserNotFound when user does not exist', () async {
      when(() => repo().getUserByEmail(any())).thenAnswer((_) async => null);

      final result = await useCase(params());

      expect(result.isFailure, isTrue);
      expect(result.getFailure, isA<UserNotFound>());
      verifyNever(() => hashService().verify(any(), any()));
    });

    test('should return AuthCodeNotFound when user has no verification code', () async {
      final user = createUserWithoutCodes();
      when(() => repo().getUserByEmail(email())).thenAnswer((_) async => user);

      final result = await useCase(params());

      expect(result.isFailure, isTrue);
      expect(result.getFailure, isA<AuthCodeNotFound>());
      verifyNever(() => hashService().verify(any(), any()));
    });

    test('should return Failure and emit EmailConfirmationFailedEvent when code is incorrect', () async {
      final user = createUserWithCodes();

      when(() => repo().getUserByEmail(email())).thenAnswer((_) async => user);
      when(() => hashService().verify(code(), codeHash())).thenAnswer((_) async => false);

      final result = await useCase(params());

      expect(result.isFailure, isTrue);
      expect(user.isVerified, isFalse);

      final events = bench.expectEventsSynchronized();
      expectEvent<EmailConfirmationFailedEvent>(events);
    });
  });
}
