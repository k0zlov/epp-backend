import 'package:epp_backend/app/database/database.dart';
import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/infrastructure/base/projection_handler.dart';
import 'package:epp_backend/shared/infrastructure/extensions/table_extension.dart';

class AuthTokenReuseDetectedProjector extends ProjectionHandler<AuthTokenReuseDetectedEvent> {
  const AuthTokenReuseDetectedProjector({required this.db});

  final Database db;

  @override
  Future<void> project(AuthTokenReuseDetectedEvent event) async {
    await db.users.updateWhereSameKey(UserRowMapper.fromDomain(event.user));

    await db.authSessions.updateWhereSameKey(
      AuthSessionRowMapper.fromDomain(event.session, userId: event.user.id),
    );
  }
}
