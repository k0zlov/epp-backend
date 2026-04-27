import 'dart:convert';

import 'package:bcrypt/bcrypt.dart';
import 'package:crypto/crypto.dart';
import 'package:epp_backend/shared/application/application.dart';

class BcryptHashService implements HashService {
  String _normalize(String value) {
    if (value.length <= 72) return value;
    return sha256.convert(utf8.encode(value)).toString();
  }

  @override
  Future<String> hash(String value) async {
    try {
      return BCrypt.hashpw(_normalize(value), BCrypt.gensalt());
    } on Exception catch (e, st) {
      throw InfrastructureException(
        code: InfrastructureErrorCode.hashServiceFailure,
        message: 'Failed to hash value using BCrypt',
        error: e,
        stackTrace: st,
      );
    }
  }

  @override
  Future<bool> verify(String value, String hash) async {
    try {
      return BCrypt.checkpw(_normalize(value), hash);
    } on Exception catch (e, st) {
      throw InfrastructureException(
        code: InfrastructureErrorCode.hashServiceFailure,
        message: 'Failed to verify BCrypt hash',
        error: e,
        stackTrace: st,
      );
    }
  }
}
