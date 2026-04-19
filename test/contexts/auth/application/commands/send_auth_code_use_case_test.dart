import 'package:epp_backend/contexts/auth/application/commands/send_auth_code_use_case.dart';
import 'package:epp_backend/contexts/auth/application/mail_templates/auth_code_template.dart';
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
  late SendAuthCodeUseCase useCase;

  setUpAll(() {
    registerFallbackValue(const SendAuthCodeParams(email: '', type: AuthCodeType.emailVerification));
    registerFallbackValue(
      AuthCodeTemplate(displayName: '', code: '', type: AuthCodeType.emailVerification, codeExpiresInMinutes: 0),
    );
  });

  setUp(() {
    bench = AuthTestBench<void>();

    useCase = SendAuthCodeUseCase(
      mailService: bench.mailService,
      hashService: bench.hashService,
      repository: bench.userRepository,
      unitOfWork: bench.unitOfWork,
      projector: bench.projector,
      eventBus: bench.eventBus,
    );
  });

  group('SendAuthCodeUseCase Tests', () {
    MockUserRepository repo() => bench.userRepository;
    MockHashService hashService() => bench.hashService;
    MockMailService mailService() => bench.mailService;

    String email() => bench.tEmail;
    SendAuthCodeParams params() => SendAuthCodeParams(
      email: email(),
      type: AuthCodeType.emailVerification,
    );

    User getVerifiedUser() => User(
      id: bench.tUserId,
      email: Email(email()),
      passwordHash: bench.tHash,
      isVerified: true,
      createdAt: DateTime.now(),
      displayName: bench.tDisplayName,
      deletedAt: null,
      updatedAt: null,
    );

    User getUnverifiedUser() => User(
      id: bench.tUserId,
      email: Email(email()),
      passwordHash: bench.tHash,
      isVerified: false,
      createdAt: DateTime.now().subtract(const Duration(minutes: 5)),
      displayName: bench.tDisplayName,
      deletedAt: null,
      updatedAt: null,
    );

    test('should successfully generate code, hash it, create auth code and send email', () async {
      final tUser = getUnverifiedUser();

      when(() => repo().getUserByEmail(email())).thenAnswer((_) async => tUser);
      when(() => hashService().hash(any())).thenAnswer((_) async => 'hashed_code');
      when(
        () => mailService().sendTemplate(
          to: any(named: 'to'),
          template: any(named: 'template'),
        ),
      ).thenAnswer((_) async => {});

      final result = await useCase(params());

      expect(result.isSuccess, isTrue);

      final capturedCode = verify(() => hashService().hash(captureAny())).captured.single as String;
      expect(capturedCode.length, equals(6));

      final capturedTemplate =
          verify(
                () => mailService().sendTemplate(
                  to: [tUser.email.value],
                  template: captureAny(named: 'template'),
                ),
              ).captured.single
              as AuthCodeTemplate;

      expect(capturedTemplate.code, equals(capturedCode));

      final events = bench.expectEventsSynchronized();
      expectEvent<AuthCodeCreatedEvent>(events);
    });

    test('should return UserNotFound when email does not exist', () async {
      when(() => repo().getUserByEmail(any())).thenAnswer((_) async => null);

      final result = await useCase(params());

      expect(result.isFailure, isTrue);
      expect(result.getFailure, isA<UserNotFound>());
      verifyNever(() => hashService().hash(any()));
    });

    test('should return Failure when domain logic fails', () async {
      final tUser = getVerifiedUser();

      when(() => repo().getUserByEmail(email())).thenAnswer((_) async => tUser);
      when(() => hashService().hash(any())).thenAnswer((_) async => 'hash');

      final result = await useCase(params());

      expect(result.isFailure, isTrue);
      expect(result.getFailure, isA<UserAlreadyVerified>());
      verifyNever(
        () => mailService().sendTemplate(
          to: any(named: 'to'),
          template: any(named: 'template'),
        ),
      );
    });

    test('should throw InfrastructureException when mail service fails', () async {
      final tUser = getUnverifiedUser();

      when(() => repo().getUserByEmail(email())).thenAnswer((_) async => tUser);
      when(() => hashService().hash(any())).thenAnswer((_) async => 'hash');
      when(
        () => mailService().sendTemplate(
          to: any(named: 'to'),
          template: any(named: 'template'),
        ),
      ).thenThrow(Exception());

      expect(() => useCase(params()), throwsA(isA<InfrastructureException>()));
    });
  });
}
