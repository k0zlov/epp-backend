import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/infrastructure/mixins/mail_template_loader_mixin.dart';
import 'package:mailer/mailer.dart' as mailer;
import 'package:mailer/smtp_server.dart';

class SmtpMailService with MailTemplateLoaderMixin implements MailService {
  SmtpMailService({
    required this.assetsFolderPath,
    required this.domainName,
    required this.server,
    required this.metricsService,
    required this.loggerService,
  });

  final String assetsFolderPath;
  final String domainName;
  final SmtpServer server;
  final MetricsService metricsService;
  final LoggerService loggerService;

  @override
  Future<void> send({
    required List<String> to,
    required String subject,
    String? text,
    String? html,
    String? from,
    String templateName = 'raw',
  }) async {
    final message = mailer.Message()
      ..from = mailer.Address('${from ?? 'no-reply'}@$domainName')
      ..recipients.addAll(to)
      ..subject = subject
      ..text = text
      ..html = html;

    try {
      await mailer.send(message, server);

      metricsService.increment(
        MetricDefinition.mailSent,
        labels: {'template': templateName},
      );

      loggerService.info(
        'SMTP Email sent successfully',
        context: LogContext(
          event: 'infra.mail_sent',
          payload: {
            'to': to,
            'subject': subject,
            'template': templateName,
            'provider': 'smtp',
          },
        ),
      );
    } on mailer.MailerException catch (e, st) {
      throw InfrastructureException(
        code: InfrastructureErrorCode.mailProviderFailure,
        message: 'SMTP mail provider failure: ${e.message}',
        details: {'template': templateName, 'to': to},
        error: e,
        stackTrace: st,
      );
    } on Exception catch (e, st) {
      throw InfrastructureException(
        code: InfrastructureErrorCode.unexpectedError,
        message: 'Unexpected failure while sending SMTP mail',
        details: {'template': templateName},
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

      return await send(
        to: to,
        subject: template.subject,
        from: from,
        html: html,
        templateName: template.templateName,
      );
    } on InfrastructureException {
      rethrow;
    } on Exception catch (e, st) {
      throw InfrastructureException(
        code: InfrastructureErrorCode.internalError,
        message: 'Failed to load or render SMTP mail template',
        details: {'template': template.templateName},
        error: e,
        stackTrace: st,
      );
    }
  }
}
