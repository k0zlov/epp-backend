import 'dart:async';

import 'package:drift/drift.dart';

extension TableExtension<TableDsl extends Table, D> on TableInfo<TableDsl, D> {
  Future<D?> getOrNull(Expression<bool> Function(TableDsl tbl) filter) {
    return (select()..where(filter)).getSingleOrNull();
  }

  Future<List<D>> getWhere(Expression<bool> Function(TableDsl tbl) filter) {
    return (select()..where(filter)).get();
  }

  Future<D> getSingle(Expression<bool> Function(TableDsl tbl) filter) {
    return (select()..where(filter)).getSingle();
  }

  Future<int> updateWhere(
    Insertable<D> entity,
    Expression<bool> Function(TableDsl tbl) filter,
  ) {
    return (update()..where(filter)).write(entity);
  }

  Future<List<D>> updateWhereReturning(
    Insertable<D> entity,
    Expression<bool> Function(TableDsl tbl) filter,
  ) {
    return (update()..where(filter)).writeReturning(entity);
  }

  Future<int> updateWhereSameKey(
    Insertable<D> entity,
    Expression<bool> Function(TableDsl tbl) filter,
  ) {
    return (update()..whereSamePrimaryKey(entity)).write(entity);
  }

  void insertOneSync(Insertable<D> entity) {
    return unawaited(insertOne(entity));
  }

  void deleteOneSync(Insertable<D> entity) {
    return unawaited(deleteOne(entity));
  }

  Future<D?> getLastOrNull(
    Expression<bool> Function(TableDsl tbl) filter,
    List<OrderingTerm Function(TableDsl)> orderBy,
  ) {
    return (select()
          ..where(filter)
          ..orderBy(orderBy)
          ..limit(1))
        .getSingleOrNull();
  }

  Future<int> countWhere(Expression<bool> Function(TableDsl tbl) filter) {
    return count(where: filter).getSingle();
  }

  Stream<List<D>> watchWhere(Expression<bool> Function(TableDsl tbl) filter) {
    return (select()..where(filter)).watch();
  }

  Stream<List<D>> watchSingleWhere(
    Expression<bool> Function(TableDsl tbl) filter,
  ) {
    return (select()..where(filter)).watch();
  }
}
