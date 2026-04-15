import 'package:epp_backend/contexts/auth/domain/aggregates/user.dart';

abstract interface class UserRepository {
  Future<User?> getUserById(String id);

  Future<User?> getUserByEmail(String email);
}
