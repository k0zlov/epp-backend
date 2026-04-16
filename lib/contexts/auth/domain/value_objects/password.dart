import 'package:epp_backend/contexts/auth/domain/failures/auth_failures.dart';
import 'package:epp_backend/shared/domain/base/result.dart';
import 'package:epp_backend/shared/domain/base/value_object.dart';

class Password extends ValueObject {
  const Password._(this.value);

  final String value;

  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  static Result<Password> create(String value) {
    if (value.isEmpty) {
      return Failure(InvalidPassword());
    }

    if (!_passwordRegExp.hasMatch(value)) {
      return Failure(InvalidPassword());
    }

    return Success(Password._(value));
  }

  @override
  List<Object?> get props => [value];
}
