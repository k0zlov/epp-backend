import 'package:epp_backend/app/database/database.dart';
import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/infrastructure/base/projection_handler.dart';
import 'package:epp_backend/shared/infrastructure/extensions/table_extension.dart';

class UserLoggedOutProjector extends ProjectionHandler<UserLoggedOutEvent> {
  const UserLoggedOutProjector({required this.db});

  final Database db;

  @override
  Future<void> project(UserLoggedOutEvent event) async {
    await db.users.updateWhereSameKey(UserRowMapper.fromDomain(event.user));

    await db.authSessions.updateWhereSameKey(
      AuthSessionRowMapper.fromDomain(event.session, userId: event.user.id),
    );
  }
}
