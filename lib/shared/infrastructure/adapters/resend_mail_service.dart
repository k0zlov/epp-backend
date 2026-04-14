import 'dart:io';

import 'package:dart_resend/dart_resend.dart';
import 'package:epp_backend/shared/application/ports/mail_service.dart';
import 'package:mustache_template/mustache.dart';
import 'package:path/path.dart' as path;

class ResendMailService implements MailService {
  const ResendMailService({
    required this.templatesPath,
    required this.domainTitle,
    required this.client,
  });

  final ResendClient client;

  final String domainTitle;
  final String templatesPath;

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
    required String subject,
    required String templateName,
    Map<String, dynamic> vars = const {},
    String? from,
  }) async {
    final String source = await _loadTemplate(templateName);

    final String html = Template(source).renderString(vars);

    return send(to: to, subject: subject, from: from, html: html);
  }
}
