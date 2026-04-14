abstract interface class MailService {
  Future<void> send({
    required List<String> to,
    required String subject,
    String? text,
    String? html,
    String from = 'no-reply',
  });

  Future<void> sendTemplate({
    required List<String> to,
    required String subject,
    required String templateName,
    Map<String, dynamic> vars = const {},
    String from = 'no-reply',
  });
}
