import 'package:epp_backend/app/database/database.dart';
import 'package:epp_backend/contexts/auth/application/ports/user_repository.dart';
import 'package:epp_backend/contexts/auth/domain/aggregates/user.dart';
import 'package:epp_backend/contexts/auth/infrastructure/mappers/user_row_x.dart';
import 'package:epp_backend/shared/infrastructure/extensions/table_extension.dart';

class DriftUserRepository implements UserRepository {
  const DriftUserRepository({required this.db});

  final Database db;

  Future<User> _mapToAggregate(UserRow userRow) async {
    final id = userRow.id;

    final results = await Future.wait([
      db.authTokens.getWhere((tbl) => tbl.userId.equals(id)),
      db.authSessions.getWhere((tbl) => tbl.userId.equals(id)),
    ]);

    return userRow.toDomain(
      tokenRows: results[0] as List<AuthTokenRow>,
      sessionRows: results[1] as List<AuthSessionRow>,
    );
  }

  @override
  Future<User?> getUserByEmail(String email) async {
    final UserRow? userRow = await db.users.getOrNull((tbl) => tbl.email.equals(email));
    if (userRow == null) return null;

    return _mapToAggregate(userRow);
  }

  @override
  Future<User?> getUserById(String id) async {
    final UserRow? userRow = await db.users.getOrNull((tbl) => tbl.id.equals(id));
    if (userRow == null) return null;

    return _mapToAggregate(userRow);
  }
}
