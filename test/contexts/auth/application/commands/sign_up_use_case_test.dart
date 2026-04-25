import 'package:epp_backend/contexts/auth/application/commands/sign_up_use_case.dart';
import 'package:epp_backend/contexts/auth/domain/domain.dart';
import 'package:epp_backend/shared/domain/domain.dart';
import 'package:epp_backend/shared/infrastructure/infrastructure.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../helpers/functions/expect_event.dart';
import '../../../../helpers/mocks/auth_mocks.dart';
import '../../../../helpers/mocks/shared_mocks.dart';
import '../../../../helpers/test_benches/auth_test_bench.dart';

void main() {
  late AuthTestBench<void> bench;
  late SignUpUseCase useCase;

  setUpAll(() {
    registerFallbackValue(const SignUpParams(email: '', password: '', displayName: ''));
  });

  setUp(() {
    bench = AuthTestBench<void>();

    useCase = SignUpUseCase(
      repository: bench.userRepository,
      hashService: bench.hashService,
      unitOfWork: bench.unitOfWork,
      projector: bench.projector,
      eventBus: bench.eventBus,
    );
  });

  group('SignUpUseCase Tests', () {
    MockUserRepository repo() => bench.userRepository;
    MockHashService hashService() => bench.hashService;

    String email() => bench.tEmail;
    String password() => bench.tPassword;
    String hash() => bench.tHash;
    String displayName() => bench.tDisplayName;

    SignUpParams params() => SignUpParams(
      email: email(),
      password: password(),
      displayName: displayName(),
    );

    test('should return ValidationFailures when input is invalid', () async {
      final invalidParams = SignUpParams(
        email: 'invalid-email',
        password: 'short',
        displayName: displayName(),
      );

      final result = await useCase(invalidParams);

      expect(result.isFailure, isTrue);
      expect(result.getFailure, isA<ValidationFailures>());
      verifyNever(() => repo().getUserByEmail(any()));
    });

    test('should return EmailAlreadyInUse when email exists', () async {
      final user = bench.tUser;

      when(() => repo().getUserByEmail(email())).thenAnswer((_) async => user);

      final result = await useCase(params());

      expect(result.isFailure, isTrue);
      expect(result.getFailure, isA<EmailAlreadyInUse>());
      verify(() => repo().getUserByEmail(email())).called(1);
      verifyNever(() => hashService().hash(any()));
    });

    test('should return Success and emit UserSignedUpEvent when email is available and data is valid', () async {
      when(() => repo().getUserByEmail(email())).thenAnswer((_) async => null);
      when(() => hashService().hash(password())).thenAnswer((_) async => hash());

      final result = await useCase(params());

      expect(result.isSuccess, isTrue);
      verify(() => repo().getUserByEmail(email())).called(1);
      verify(() => hashService().hash(password())).called(1);

      final events = bench.expectEventsSynchronized();
      final event = expectEvent<UserSignedUpEvent>(events);

      expect(event.user.email.value, equals(email()));
      expect(event.user.displayName, equals(displayName()));
    });
  });
}
