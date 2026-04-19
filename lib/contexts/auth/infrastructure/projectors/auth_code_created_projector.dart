import 'package:drift/drift.dart';
import 'package:epp_backend/app/database/database.dart';
import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/infrastructure/base/projection_handler.dart';
import 'package:epp_backend/shared/infrastructure/extensions/table_extension.dart';

class AuthCodeCreatedProjector extends ProjectionHandler<AuthCodeCreatedEvent> {
  const AuthCodeCreatedProjector({required this.db});

  final Database db;

  @override
  Future<void> project(AuthCodeCreatedEvent event) async {
    await db.users.updateWhereSameKey(UserRowMapper.fromDomain(event.user));

    await db.authCodes.insertOne(AuthCodeRowMapper.fromDomain(event.code, userId: event.user.id));

    await db.batch((batch) {
      for (final code in event.invalidatedCodes) {
        batch.update(
          db.authCodes,
          AuthCodeRowMapper.fromDomain(code, userId: event.user.id),
          where: (t) => t.id.equals(code.id),
        );
      }
    });
  }
}
