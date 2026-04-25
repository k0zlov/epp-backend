import 'package:epp_backend/contexts/auth/domain/domain.dart';
import 'package:epp_backend/shared/application/base/mail_template.dart';

class AuthCodeTemplate extends MailTemplate {
  AuthCodeTemplate({
    required this.codeExpiresInMinutes,
    required this.displayName,
    required this.code,
    required this.type,
  });

  final String displayName;
  final String code;
  final AuthCodeType type;
  final int codeExpiresInMinutes;

  @override
  String get templateName => 'auth_code';

  @override
  String get subject => switch (type) {
    AuthCodeType.emailVerification => 'Verify your email address',
    AuthCodeType.passwordReset => 'Reset your password',
  };

  @override
  Map<String, dynamic> get vars => {
    'displayName': displayName,
    'code': code,
    'is_email_verification': type == AuthCodeType.emailVerification,
    'is_password_reset': type == AuthCodeType.passwordReset,
    'codeExpiresInMinutes': codeExpiresInMinutes,
  };
}
