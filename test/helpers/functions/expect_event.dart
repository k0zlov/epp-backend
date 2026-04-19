import 'package:epp_backend/shared/domain/domain.dart';
import 'package:test/test.dart';

E expectEvent<E extends DomainEvent>(List<DomainEvent> events) {
  final event = events.whereType<E>().firstOrNull;
  expect(event, isNotNull, reason: 'Event of type $E was not found');
  return event!;
}
