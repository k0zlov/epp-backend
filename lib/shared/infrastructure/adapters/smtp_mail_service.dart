import 'dart:io';
import 'package:epp_backend/shared/application/ports/mail_service.dart';
import 'package:mailer/mailer.dart' as mailer;
import 'package:mailer/smtp_server.dart';
import 'package:mustache_template/mustache.dart';
import 'package:path/path.dart' as path;

class SmtpMailService implements MailService {
  const SmtpMailService({
    required this.templatesPath,
    required this.domainTitle,
    required this.server,
  });

  final String templatesPath;
  final String domainTitle;
  final SmtpServer server;

  Future<String> _loadTemplate(String name) async {
    final file = File(path.join(templatesPath, '$name.html'));

    if (!file.existsSync()) {
      throw Exception('Template $name not found at ${file.path}');
    }

    return file.readAsString();
  }

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
    required String subject,
    required String templateName,
    Map<String, dynamic> vars = const {},
    String? from,
  }) async {
    final source = await _loadTemplate(templateName);
    final html = Template(source).renderString(vars);
    return send(to: to, subject: subject, from: from, html: html);
  }
}
