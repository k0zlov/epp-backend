import 'package:epp_backend/contexts/auth/application/commands/sign_up_use_case.dart';
import 'package:epp_backend/contexts/auth/domain/domain.dart';
import 'package:epp_backend/shared/domain/domain.dart';
import 'package:epp_backend/shared/infrastructure/infrastructure.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../shared/shared_mocks.dart';
import '../../auth_mocks.dart';

void main() {
  late SignUpUseCase useCase;
  late MockUserRepository repository;
  late MockHashService hashService;
  late MockUnitOfWork unitOfWork;
  late MockEventProjector projector;
  late MockEventBus eventBus;

  setUpAll(() {
    registerFallbackValue(const SignUpParams(email: '', password: ''));
  });

  setUp(() {
    repository = MockUserRepository();
    hashService = MockHashService();
    unitOfWork = MockUnitOfWork();
    projector = MockEventProjector();
    eventBus = MockEventBus();

    useCase = SignUpUseCase(
      repository: repository,
      hashService: hashService,
      unitOfWork: unitOfWork,
      projector: projector,
      eventBus: eventBus,
    );

    unitOfWork.mockSuccess<void>();
  });

  group('SignUpUseCase Tests', () {
    const tEmail = 'test@example.com';
    const tPassword = 'password123A';
    const tParams = SignUpParams(email: tEmail, password: tPassword);
    const tHash = 'hashed_password';

    test('should return ValidationFailures when input is invalid', () async {
      const invalidParams = SignUpParams(email: 'invalid', password: '123');

      final result = await useCase(invalidParams);

      expect(result.isFailure, isTrue);
      expect(result.failure, isA<ValidationFailures>());
      verifyNever(() => repository.getUserByEmail(any()));
    });

    test('should return EmailAlreadyInUse when email exists', () async {
      when(() => repository.getUserByEmail(any())).thenAnswer(
        (_) async => User(
          id: '1',
          email: const Email(tEmail),
          passwordHash: tHash,
          isVerified: true,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: null,
        ),
      );

      final result = await useCase(tParams);

      expect(result.isFailure, isTrue);
      expect(result.failure, isA<EmailAlreadyInUse>());
      verify(() => repository.getUserByEmail(tEmail)).called(1);
      verifyNever(() => hashService.hash(any()));
    });

    test('should return Success when data is valid', () async {
      when(() => repository.getUserByEmail(any())).thenAnswer((_) async => null);
      when(() => hashService.hash(any())).thenAnswer((_) async => tHash);
      when(() => projector.projectAll(any())).thenAnswer((_) async => {});
      when(() => eventBus.publishAll(any())).thenAnswer((_) => {});

      final result = await useCase(tParams);

      expect(result.isSuccess, isTrue);
      verify(() => repository.getUserByEmail(tEmail)).called(1);
      verify(() => hashService.hash(tPassword)).called(1);
      verify(() => projector.projectAll(any())).called(1);
      verify(() => eventBus.publishAll(any())).called(1);
    });
  });
}
