import 'package:epp_backend/contexts/auth/domain/failures/auth_failures.dart';
import 'package:epp_backend/shared/domain/base/result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'email.freezed.dart';

@freezed
abstract class Email with _$Email {
  const factory Email(String value) = _Email;

  static Result<Email> create(String value) {
    final trimmed = value.trim().toLowerCase();

    if (!RegExp(r'^.+@.+\..+$').hasMatch(trimmed)) {
      return Failure(InvalidEmail(value));
    }

    return Success(Email(trimmed));
  }
}
