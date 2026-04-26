import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/application/base/infrastructure_error_code.dart';
import 'package:epp_backend/shared/infrastructure/mixins/mail_template_loader_mixin.dart';
import 'package:mailer/mailer.dart' as mailer;
import 'package:mailer/smtp_server.dart';

class SmtpMailService with MailTemplateLoaderMixin implements MailService {
  SmtpMailService({
    required this.assetsFolderPath,
    required this.domainName,
    required this.server,
  });

  final String assetsFolderPath;
  final String domainName;
  final SmtpServer server;

  @override
  Future<void> send({
    required List<String> to,
    required String subject,
    String? text,
    String? html,
    String? from,
  }) async {
    final message = mailer.Message()
      ..from = mailer.Address('${from ?? 'no-reply'}@$domainName')
      ..recipients.addAll(to)
      ..subject = subject
      ..text = text
      ..html = html;

    try {
      await mailer.send(message, server);
    } on mailer.MailerException catch (e, st) {
      throw InfrastructureException(
        code: InfrastructureErrorCode.mailProviderFailure,
        message: 'SMTP mail provider failure: ${e.message}',
        error: e,
        stackTrace: st,
      );
    } on Exception catch (e, st) {
      throw InfrastructureException(
        code: InfrastructureErrorCode.unexpectedError,
        message: 'Unexpected failure while sending SMTP mail',
        error: e,
        stackTrace: st,
      );
    }
  }

  @override
  Future<void> sendTemplate({
    required List<String> to,
    required MailTemplate template,
    String? from,
  }) async {
    try {
      final t = await loadTemplate(
        templateName: template.templateName,
        assetsFolderPath: assetsFolderPath,
      );
      final html = t.renderString({...template.vars, 'subject': template.subject});
      return await send(to: to, subject: template.subject, from: from, html: html);
    } on InfrastructureException {
      rethrow;
    } on Exception catch (e, st) {
      throw InfrastructureException(
        code: InfrastructureErrorCode.internalError,
        message: 'Failed to load or render SMTP mail template',
        error: e,
        stackTrace: st,
      );
    }
  }
}
