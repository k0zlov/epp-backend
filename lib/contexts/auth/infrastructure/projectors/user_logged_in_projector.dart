import 'package:drift/drift.dart';
import 'package:epp_backend/app/database/database.dart';
import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/infrastructure/infrastructure.dart';

class UserLoggedInProjector extends ProjectionHandler<UserLoggedInEvent> {
  const UserLoggedInProjector({required this.db});

  final Database db;

  @override
  Future<void> project(UserLoggedInEvent event) async {
    await db.users.updateWhereSameKey(UserRowMapper.fromDomain(event.user));

    await db.authSessions.insertOne(AuthSessionRowMapper.fromDomain(event.session, userId: event.user.id));
  }
}
