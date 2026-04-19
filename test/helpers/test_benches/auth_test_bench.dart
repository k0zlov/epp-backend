import 'package:epp_backend/contexts/auth/auth.dart';

import '../mocks/auth_mocks.dart';
import 'shared_test_bench.dart';

class AuthTestBench<T> extends SharedTestBench<T> {
  final MockUserRepository userRepository = MockUserRepository();

  final String tEmail = 'test@example.com';
  final String tPassword = 'password123';
  final String tHash = 'hashed_password';
  final String tUserId = 'user_123';
  final String tDisplayName = 'Test User';

  User get tUser => User(
    id: tUserId,
    email: Email(tEmail),
    passwordHash: tHash,
    isVerified: true,
    createdAt: DateTime.now(),
    displayName: tDisplayName,
    deletedAt: null,
    updatedAt: null,
  );
}
