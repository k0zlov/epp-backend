import 'package:epp_backend/contexts/auth/auth.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class MockHashService extends Mock implements HashService {}

class MockUnitOfWork extends Mock implements UnitOfWork {
  void mockSuccess<T>() {
    when(() => execute<Result<T>>(any(), errorMessage: any(named: 'errorMessage'))).thenAnswer((invocation) async {
      final action = invocation.positionalArguments[0] as Future<Result<T>> Function();
      return action();
    });
  }
}

class MockEventProjector extends Mock implements EventProjector {}

class MockEventBus extends Mock implements EventBus {}
