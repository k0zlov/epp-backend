class LogSanitizer {
  static const _passwordKeys = {'password', 'newPassword', 'oldPassword', 'secret'};
  static const _tokenKeys = {'token', 'refreshToken', 'accessToken'};

  Map<String, dynamic> sanitize(Map<String, dynamic> data) {
    final sanitized = Map<String, dynamic>.from(
      data.map((key, value) {
        if (value is Map<String, dynamic>) {
          return MapEntry(key, sanitize(value));
        }
        return MapEntry(key, value);
      }),
    );

    for (final key in sanitized.keys.toList()) {
      final value = sanitized[key];

      if (_passwordKeys.contains(key)) {
        sanitized.remove(key);
        continue;
      }

      if (key == 'email' && value is String) {
        sanitized[key] = _maskEmail(value);
        continue;
      }

      if (_tokenKeys.contains(key) && value is String) {
        sanitized[key] = '***${value.substring(value.length > 4 ? value.length - 4 : 0)}';
      }
    }

    return sanitized;
  }

  String _maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return '***';
    final name = parts[0];
    final mask = name.length > 2 ? name.substring(0, 2) : name.substring(0, 1);
    return '$mask***@${parts[1]}';
  }
}
