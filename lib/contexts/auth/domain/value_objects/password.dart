import 'package:epp_backend/contexts/auth/domain/failures/auth_failures.dart';
import 'package:epp_backend/shared/domain/base/result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'password.freezed.dart';

@freezed
abstract class Password with _$Password {
  const factory Password({
    required String value,
  }) = _Password;

  static Result<Password> create(String value) {
    if (value.isEmpty) {
      return Failure(InvalidPassword());
    }

    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(value)) {
      return Failure(InvalidPassword());
    }

    return Success(Password(value: value));
  }
}
