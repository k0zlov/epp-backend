import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/domain/base/aggregate.dart';
import 'package:epp_backend/shared/domain/base/result.dart';

class User extends Aggregate {
  User({
    required this.deletedAt,
    required this.email,
    required this.passwordHash,
    required this.isVerified,
    required super.id,
    required super.updatedAt,
    required super.createdAt,
    this.tokens = const [],
    this.sessions = const [],
  });

  static Result<User> create({required Email email, required String passwordHash}) {
    final User user = User(
      email: email,
      passwordHash: passwordHash,
      isVerified: false,
      id: null,
      deletedAt: null,
      updatedAt: null,
      createdAt: null,
    );

    user.addEvent(UserSignedUpEvent(user: user));
    return Success(user);
  }

  final Email email;
  final String passwordHash;
  final bool isVerified;
  final DateTime? deletedAt;

  final List<AuthSession> sessions;
  final List<AuthToken> tokens;
}
