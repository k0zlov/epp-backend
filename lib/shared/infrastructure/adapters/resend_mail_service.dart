import 'package:dart_resend/dart_resend.dart';
import 'package:epp_backend/shared/application/base/mail_template.dart';
import 'package:epp_backend/shared/application/ports/mail_service.dart';
import 'package:epp_backend/shared/infrastructure/mixins/mail_template_loader_mixin.dart';
import 'package:mustache_template/mustache.dart';

class ResendMailService with MailTemplateLoaderMixin implements MailService {
  const ResendMailService({
    required this.templatesFolderPath,
    required this.domainTitle,
    required this.client,
  });

  final ResendClient client;

  final String domainTitle;
  final String templatesFolderPath;

  @override
  Future<void> send({
    required List<String> to,
    required String subject,
    String? text,
    String? html,
    String? from,
  }) async {
    await client.email.sendEmail(
      from: '${from ?? 'no-reply'}@$domainTitle',
      to: to,
      subject: subject,
      text: text,
      html: html,
    );
  }

  @override
  Future<void> sendTemplate({
    required List<String> to,
    required MailTemplate template,
    String from = 'no-reply',
  }) async {
    final Template t = await loadTemplate(
      templateName: template.templateName,
      templatesFolderPath: templatesFolderPath,
    );

    final String html = t.renderString({...template.vars, 'subject': template.subject});

    return send(to: to, subject: template.subject, from: from, html: html);
  }
}
