import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/application/base/token_payload.dart';
import 'package:epp_backend/shared/domain/domain.dart';
import 'package:meta/meta.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../mocks/shared_mocks.dart';

class SharedTestBench<T> {
  SharedTestBench() {
    registerFallbacks();
    setupDefaultBehaviors();
  }

  final hashService = MockHashService();
  final unitOfWork = MockUnitOfWork();
  final projector = MockEventProjector();
  final eventBus = MockEventBus();
  final tokenService = MockTokenService();
  final mailService = MockMailService();
  final notificationService = MockNotificationService();

  final String tIpAddress = '127.0.0.1';
  final String tUserAgent = 'Dart Test';

  @protected
  @mustCallSuper
  void registerFallbacks() {
    registerFallbackValue(Duration.zero);
    registerFallbackValue(TokenType.access);
    registerFallbackValue(const TokenPayload(userId: '', sessionId: ''));
    registerFallbackValue(const NotificationTopic(scope: NotificationScope.system));
    registerFallbackValue(
      NotificationMessage.event(
        topic: const NotificationTopic(scope: NotificationScope.system),
        title: NotificationEvent.systemError,
      ),
    );
  }

  @protected
  @mustCallSuper
  void setupDefaultBehaviors() {
    when(() => unitOfWork.execute<Result<T>>(any(), errorMessage: any(named: 'errorMessage'))).thenAnswer((
      invocation,
    ) async {
      final action = invocation.positionalArguments[0] as Future<Result<T>> Function();
      return action();
    });

    when(() => projector.projectAll(any())).thenAnswer((_) async => {});
    when(() => eventBus.publishAll(any())).thenAnswer((_) => {});
    when(
      () => tokenService.issue(
        payload: any(named: 'payload'),
        type: any(named: 'type'),
      ),
    ).thenReturn('mock_token');

    when(() => tokenService.accessTokenExpiresIn).thenReturn(const Duration(minutes: 30));
    when(() => tokenService.refreshTokenExpiresIn).thenReturn(const Duration(days: 15));
    when(() => notificationService.send(any())).thenReturn(null);
    when(() => notificationService.sendAll(any())).thenReturn(null);
    when(() => notificationService.closeSession(any())).thenAnswer((_) async {});
    when(() => notificationService.closeUser(any())).thenAnswer((_) async {});
  }

  List<DomainEvent> expectEventsSynchronized() {
    final projectedCaptured = verify(() => projector.projectAll(captureAny())).captured;
    final publishedCaptured = verify(() => eventBus.publishAll(captureAny())).captured;

    final projected = projectedCaptured.expand((e) => e as List<DomainEvent>).toList();
    final published = publishedCaptured.expand((e) => e as List<DomainEvent>).toList();

    expect(projected, equals(published), reason: 'Projected and Published events must be equal');

    return projected;
  }
}
