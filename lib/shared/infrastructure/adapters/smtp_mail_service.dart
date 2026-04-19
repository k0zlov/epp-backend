import 'package:epp_backend/shared/application/base/mail_template.dart';
import 'package:epp_backend/shared/application/ports/mail_service.dart';
import 'package:epp_backend/shared/infrastructure/mixins/mail_template_loader_mixin.dart';
import 'package:mailer/mailer.dart' as mailer;
import 'package:mailer/smtp_server.dart';

class SmtpMailService with MailTemplateLoaderMixin implements MailService {
  SmtpMailService({
    required this.templatesFolderPath,
    required this.domainTitle,
    required this.server,
  });

  final String templatesFolderPath;
  final String domainTitle;
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
      ..from = mailer.Address('${from ?? 'no-reply'}@$domainTitle')
      ..recipients.addAll(to)
      ..subject = subject
      ..text = text
      ..html = html;

    await mailer.send(message, server);
  }

  @override
  Future<void> sendTemplate({
    required List<String> to,
    required MailTemplate template,
    String? from,
  }) async {
    final t = await loadTemplate(
      templateName: template.templateName,
      templatesFolderPath: templatesFolderPath,
    );
    final html = t.renderString({...template.vars, 'subject': template.subject});
    return send(to: to, subject: template.subject, from: from, html: html);
  }
}
