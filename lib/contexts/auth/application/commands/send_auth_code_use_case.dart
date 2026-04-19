import 'dart:math';

import 'package:epp_backend/contexts/auth/application/application.dart';
import 'package:epp_backend/contexts/auth/application/mail_templates/auth_code_template.dart';
import 'package:epp_backend/contexts/auth/domain/domain.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/domain/base/result.dart';
import 'package:epp_backend/shared/infrastructure/extensions/either_x.dart';
import 'package:epp_backend/shared/infrastructure/extensions/string_x.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_auth_code_use_case.freezed.dart';

part 'send_auth_code_use_case.g.dart';

@freezed
abstract class SendAuthCodeParams with _$SendAuthCodeParams {
  const factory SendAuthCodeParams({
    required String email,
    required AuthCodeType type,
  }) = _SendAuthCodeParams;

  factory SendAuthCodeParams.fromJson(Map<String, dynamic> json) => _$SendAuthCodeParamsFromJson(json);
}

class SendAuthCodeUseCase extends UseCase<void, SendAuthCodeParams> {
  const SendAuthCodeUseCase({
    required this.mailService,
    required this.hashService,
    required this.repository,
    required this.unitOfWork,
    required this.eventBus,
    required this.projector,
  });

  final HashService hashService;
  final UserRepository repository;
  final UnitOfWork unitOfWork;
  final EventBus eventBus;
  final EventProjector projector;
  final MailService mailService;

  @override
  Future<Result<void>> call(SendAuthCodeParams params) {
    return unitOfWork.execute(
      errorMessage: 'Failed to send verification code to: ${params.email.maskEmail()}',
      () async {
        final User? user = await repository.getUserByEmail(params.email);

        if (user == null) return Failure(UserNotFound());

        final String code = (Random().nextInt(900000) + 100000).toString();
        final String codeHash = await hashService.hash(code);

        const AuthCodeType type = AuthCodeType.emailVerification;

        const codeExpiresInMinutes = 15;
        final codeExpiresAt = DateTime.timestamp().add(const Duration(minutes: codeExpiresInMinutes));

        final result = user.createAuthCode(codeHash: codeHash, type: type, expiresAt: codeExpiresAt);

        await projector.projectAll(user.events);
        eventBus.publishAll(user.events);

        if (result.isFailure) return result;

        try {
          await mailService.sendTemplate(
            to: [user.email.value],
            template: AuthCodeTemplate(
              displayName: user.displayName,
              code: code,
              type: type,
              codeExpiresInMinutes: codeExpiresInMinutes,
            ),
          );
        } on Exception catch (e, st) {
          throw InfrastructureException(
            message: 'External mail provider failure while sending ${params.type.name}',
            error: e,
            stackTrace: st,
          );
        }

        return const Success(null);
      },
    );
  }
}
