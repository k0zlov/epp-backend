import 'dart:convert';

import 'package:bcrypt/bcrypt.dart';
import 'package:crypto/crypto.dart';
import 'package:epp_backend/shared/application/ports/hash_service.dart';

class BcryptHashService implements HashService {
  String _normalize(String value) {
    if (value.length <= 72) return value;
    return sha256.convert(utf8.encode(value)).toString();
  }

  @override
  Future<String> hash(String value) async {
    return BCrypt.hashpw(_normalize(value), BCrypt.gensalt());
  }

  @override
  Future<bool> verify(String value, String hash) async {
    return BCrypt.checkpw(_normalize(value), hash);
  }
}
