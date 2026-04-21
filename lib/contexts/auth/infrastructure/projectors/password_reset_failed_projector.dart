import 'package:epp_backend/app/database/database.dart';
import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/infrastructure/base/projection_handler.dart';
import 'package:epp_backend/shared/infrastructure/extensions/table_extension.dart';

class PasswordResetFailedProjector extends ProjectionHandler<PasswordResetFailedEvent> {
  const PasswordResetFailedProjector({required this.db});

  final Database db;

  @override
  Future<void> project(PasswordResetFailedEvent event) async {
    await db.users.updateWhereSameKey(UserRowMapper.fromDomain(event.user));

    await db.authCodes.updateWhereSameKey(
      AuthCodeRowMapper.fromDomain(event.code, userId: event.user.id),
    );
  }
}
