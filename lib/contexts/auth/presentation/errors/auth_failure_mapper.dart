import 'dart:io';

import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/presentation/base/failure_mapper.dart';

class AuthFailureMapper extends FailureMapper<AuthFailure> {
  @override
  FailurePresentation map(AuthFailure failure) {
    return switch (failure) {
      EmailAlreadyInUse() => (HttpStatus.conflict, 'Email already in use.'),
      InvalidEmail() => (HttpStatus.badRequest, 'Invalid email.'),
      InvalidPassword() => (HttpStatus.badRequest, 'Invalid password.'),
    };
  }
}
