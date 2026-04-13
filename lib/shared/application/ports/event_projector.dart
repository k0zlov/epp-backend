import 'package:epp_backend/shared/domain/base/event.dart';

// ignore: one_member_abstracts
abstract interface class EventProjector {
  Future<void> projectAll(List<DomainEvent> events);
}
