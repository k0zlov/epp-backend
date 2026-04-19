import 'package:epp_backend/shared/application/base/mail_template.dart';

abstract interface class MailService {
  Future<void> send({
    required List<String> to,
    required String subject,
    String? text,
    String? html,
    String from,
  });

  Future<void> sendTemplate({
    required List<String> to,
    required MailTemplate template,
    String from,
  });
}
