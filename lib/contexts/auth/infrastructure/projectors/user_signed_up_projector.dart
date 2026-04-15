import 'package:drift/drift.dart';
import 'package:epp_backend/app/database/database.dart';
import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/contexts/auth/domain/events/user_events.dart';
import 'package:epp_backend/shared/infrastructure/base/projection_handler.dart';

class UserSignedUpProjector extends ProjectionHandler<UserSignedUpEvent> {
  const UserSignedUpProjector({required this.db});

  final Database db;

  @override
  Future<void> project(UserSignedUpEvent event) async {
    await db.users.insertOne(UserRowMapper.fromDomain(event.user));
  }
}
