// ignore: one_member_abstracts
abstract interface class UnitOfWork {
  /// Executes a block of code within a single database transaction.
  /// If the action completes successfully, it commits.
  /// If the action throws an exception, it rolls back.
  Future<T> execute<T>(Future<T> Function() action);
}
