import 'package:epp_backend/contexts/auth/application/application.dart';
import 'package:epp_backend/contexts/auth/domain/domain.dart';
import 'package:epp_backend/contexts/auth/domain/value_objects/password.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/domain/domain.dart';
import 'package:epp_backend/shared/infrastructure/extensions/either_x.dart';
import 'package:epp_backend/shared/infrastructure/extensions/string_x.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_use_case.g.dart';

part 'sign_up_use_case.freezed.dart';

@freezed
abstract class SignUpParams with _$SignUpParams {
  const factory SignUpParams({
    required String displayName,
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
    return unitOfWork.execute(
      errorMessage: 'Failed to complete sign up process for email: ${params.email.maskEmail()}',
      () async {
        final List<DomainFailureBase> failures = [];

        final email = Email.create(params.email).getOrElseNull(failures.add);
        final password = Password.create(params.password).getOrElseNull(failures.add);

        if (failures.isNotEmpty) {
          return Failure(ValidationFailures(failures: failures));
        }

        final User? existingUser = await repository.getUserByEmail(email!.value);

        if (existingUser != null) {
          return Failure(EmailAlreadyInUse(email.value));
        }

        final passwordHash = await hashService.hash(password!.value);

        final result = User.create(
          email: email,
          passwordHash: passwordHash,
          displayName: params.displayName,
        );

        if (result.isSuccess) {
          final user = result.getSuccess;

          await projector.projectAll(user.events);
          eventBus.publishAll(user.events);
        }

        return result;
      },
    );
  }
}
