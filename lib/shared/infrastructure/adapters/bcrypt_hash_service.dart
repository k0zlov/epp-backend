import 'package:bcrypt/bcrypt.dart';
import 'package:epp_backend/shared/application/ports/hash_service.dart';

class BcryptHashService implements HashService {
  @override
  Future<String> hash(String value) async {
    return BCrypt.hashpw(value, BCrypt.gensalt());
  }

  @override
  Future<bool> verify(String value, String hash) async {
    return BCrypt.checkpw(value, hash);
  }
}
