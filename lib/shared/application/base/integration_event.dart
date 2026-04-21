import 'package:epp_backend/shared/domain/domain.dart';

abstract class IntegrationEvent extends Event {
  @override
  String get eventName => formatEventName('IntegrationEvent');
}
