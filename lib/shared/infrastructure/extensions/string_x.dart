extension StringX on String {
  String maskEmail() {
    final parts = split('@');
    if (parts.length != 2) return this;

    final username = parts[0];
    final domain = parts[1];

    if (username.length <= 2) {
      return '*@$domain';
    }

    final first = username[0];
    final last = username[username.length - 1];
    final maskedStars = '*' * (username.length - 2);

    return '$first$maskedStars$last@$domain';
  }
}
