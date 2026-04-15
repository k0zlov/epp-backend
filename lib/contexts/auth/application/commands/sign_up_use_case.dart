import 'package:epp_backend/contexts/auth/application/application.dart';
import 'package:epp_backend/contexts/auth/domain/domain.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/domain/base/result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_use_case.g.dart';

part 'sign_up_use_case.freezed.dart';

@freezed
abstract class SignUpParams with _$SignUpParams {
  const factory SignUpParams({
    required String email,
    required String password,
  }) = _SignUpParams;

  factory SignUpParams.fromJson(Map<String, dynamic> json) => _$SignUpParamsFromJson(json);
}

class SignUpUseCase extends UseCase<void, SignUpParams> {
  const SignUpUseCase({
    required this.projector,
    required this.repository,
    required this.unitOfWork,
    required this.hashService,
    required this.eventBus,
  });

  final EventProjector projector;
  final UserRepository repository;
  final UnitOfWork unitOfWork;
  final HashService hashService;
  final EventBus eventBus;

  @override
  Future<Result<void>> call(SignUpParams params) {
    return unitOfWork.execute(errorMessage: 'Failed to complete sign up process for email: ${params.email}', () async {
      final User? existingUser = await repository.getUserByEmail(params.email);

      if (existingUser != null) {
        return Failure(EmailAlreadyInUse(params.email));
      }

      final passwordHash = await hashService.hash(params.password);

      return User.create(email: params.email, passwordHash: passwordHash).fold(
        Failure.new,
        (user) async {
          await projector.projectAll(user.events);
          eventBus.publishAll(user.events);
          return const Success(null);
        },
      );
    });
  }
}
