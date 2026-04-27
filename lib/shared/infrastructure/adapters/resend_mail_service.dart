import 'package:dart_resend/dart_resend.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/infrastructure/mixins/mail_template_loader_mixin.dart';
import 'package:mustache_template/mustache.dart';

class ResendMailService with MailTemplateLoaderMixin implements MailService {
  const ResendMailService({
    required this.metricsService,
    required this.loggerService,
    required this.assetsFolderPath,
    required this.domainName,
    required this.client,
  });

  final ResendClient client;
  final String domainName;
  final String assetsFolderPath;

  final LoggerService loggerService;
  final MetricsService metricsService;

  @override
  Future<void> send({
    required List<String> to,
    required String subject,
    String? text,
    String? html,
    String? from,
    String templateName = 'raw',
  }) async {
    final result = await client.email.sendEmail(
      from: '${from ?? 'no-reply'}@$domainName',
      to: to,
      subject: subject,
      text: text,
      html: html,
    );

    await result.fold(
      onSuccess: (data) {
        metricsService.increment(
          MetricDefinition.mailSent,
          labels: {'template': templateName},
        );

        loggerService.info(
          'Email sent successfully',
          context: LogContext(
            event: 'infra.mail_sent',
            payload: {
              'to': to,
              'subject': subject,
              'template': templateName,
            },
          ),
        );
      },
      onFailure: (error, message) {
        InfrastructureErrorCode code = InfrastructureErrorCode.mailProviderFailure;

        final errorId = error?.id;

        if (errorId == 'rate_limit_exceeded' || errorId == 'daily_quota_exceeded') {
          code = InfrastructureErrorCode.mailRateLimit;
        } else if (errorId == 'invalid_from_address' || errorId == 'invalid_to_address') {
          code = InfrastructureErrorCode.mailInvalidRecipient;
        }

        throw InfrastructureException(
          code: code,
          message: message ?? 'Resend service failed to send email',
          error: errorId,
        );
      },
    );
  }

  @override
  Future<void> sendTemplate({
    required List<String> to,
    required MailTemplate template,
    String from = 'no-reply',
  }) async {
    try {
      final Template t = await loadTemplate(
        templateName: template.templateName,
        assetsFolderPath: assetsFolderPath,
      );

      final String html = t.renderString({...template.vars, 'subject': template.subject});

      return await send(to: to, subject: template.subject, from: from, html: html);
    } on InfrastructureException {
      rethrow;
    } on Exception catch (e, st) {
      throw InfrastructureException(
        code: InfrastructureErrorCode.internalError,
        message: 'Failed to load or render mail template',
        error: e,
        stackTrace: st,
      );
    }
  }
}
