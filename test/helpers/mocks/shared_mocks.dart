import 'package:epp_backend/shared/application/application.dart';
import 'package:mocktail/mocktail.dart';

class MockHashService extends Mock implements HashService {}

class MockUnitOfWork extends Mock implements UnitOfWork {}

class MockEventProjector extends Mock implements EventProjector {}

class MockEventBus extends Mock implements EventBus {}

class MockTokenService extends Mock implements TokenService {}

class MockMailService extends Mock implements MailService {}

class MockNotificationService extends Mock implements NotificationService {}
