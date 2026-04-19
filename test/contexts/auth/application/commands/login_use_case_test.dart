import 'package:epp_backend/contexts/auth/application/commands/login_use_case.dart';
import 'package:epp_backend/contexts/auth/application/view/tokens_view.dart';
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
  late LoginUseCase useCase;

  setUp(() {
    bench = AuthTestBench<TokensView>();

    useCase = LoginUseCase(
      repository: bench.userRepository,
      hashService: bench.hashService,
      tokenService: bench.tokenService,
      unitOfWork: bench.unitOfWork,
      projector: bench.projector,
      eventBus: bench.eventBus,
    );
  });

  group('LoginUseCase Tests', () {
    MockUserRepository repo() => bench.userRepository;
    MockTokenService tokenService() => bench.tokenService;
    MockHashService hashService() => bench.hashService;

    String email() => bench.tEmail;
    String password() => bench.tPassword;
    String hash() => bench.tHash;

    LoginParams params() => LoginParams(
      email: email(),
      password: password(),
      ipAddress: bench.tIpAddress,
      userAgent: bench.tUserAgent,
    );

    test('should login successfully, issue tokens and sync events when credentials are valid', () async {
      final user = bench.tUser;

      when(() => repo().getUserByEmail(email())).thenAnswer((_) async => user);
      when(() => hashService().verify(password(), hash())).thenAnswer((_) async => true);

      when(
        () => tokenService().issueToken(
          userId: user.id,
          expiresIn: any(named: 'expiresIn'),
          type: TokenType.access,
        ),
      ).thenReturn('access_123');

      when(
        () => tokenService().issueToken(
          userId: user.id,
          expiresIn: any(named: 'expiresIn'),
          type: TokenType.refresh,
        ),
      ).thenReturn('refresh_123');

      final result = await useCase(params());

      expect(result.isSuccess, isTrue);
      final view = result.getSuccess;
      expect(view.accessToken, 'access_123');
      expect(view.refreshToken, 'refresh_123');

      verify(() => repo().getUserByEmail(email())).called(1);
      verify(() => hashService().verify(password(), hash())).called(1);
      verify(
        () => tokenService().issueToken(
          userId: user.id,
          expiresIn: any(named: 'expiresIn'),
          type: any(named: 'type'),
        ),
      ).called(2);

      final events = bench.expectEventsSynchronized();
      final event = expectEvent<UserLoggedInEvent>(events);
      expect(event.user.id, user.id);
    });

    test('should return InvalidCredentials when user is not found', () async {
      when(() => repo().getUserByEmail(any())).thenAnswer((_) async => null);

      final result = await useCase(params());

      expect(result.isFailure, isTrue);
      expect(result.getFailure, isA<InvalidCredentials>());
      verifyNever(() => hashService().verify(any(), any()));
    });

    test('should return InvalidCredentials when password hash does not match', () async {
      final user = bench.tUser;

      when(() => repo().getUserByEmail(email())).thenAnswer((_) async => user);
      when(() => hashService().verify(any(), any())).thenAnswer((_) async => false);

      final result = await useCase(params());

      expect(result.isFailure, isTrue);
      expect(result.getFailure, isA<InvalidCredentials>());
      verifyNever(
        () => tokenService().issueToken(
          userId: any(named: 'userId'),
          expiresIn: any(named: 'expiresIn'),
          type: any(named: 'type'),
        ),
      );
    });

    test('should return UserNotVerified when user exists but email is not verified', () async {
      final unverifiedUser = User(
        id: bench.tUserId,
        email: Email(email()),
        passwordHash: hash(),
        isVerified: false,
        createdAt: DateTime.now(),
        displayName: bench.tDisplayName,
        deletedAt: null,
        updatedAt: null,
      );

      when(() => repo().getUserByEmail(email())).thenAnswer((_) async => unverifiedUser);
      when(() => hashService().verify(any(), any())).thenAnswer((_) async => true);

      final result = await useCase(params());

      expect(result.isFailure, isTrue);
      expect(result.getFailure, isA<UserNotVerified>());
    });
  });
}
