import 'package:epp_backend/shared/application/base/notification_message.dart';
import 'package:epp_backend/shared/application/base/notification_scope.dart';
import 'package:epp_backend/shared/infrastructure/base/client_info.dart';
import 'package:epp_backend/shared/infrastructure/base/presentation_error.dart';
import 'package:epp_backend/shared/infrastructure/ws/ws_notification_subscriber.dart';

abstract class WsController {
  WsController({required WsNotificationSubscriber notificationSubscriber}) {
    notificationSubscriber.registerController(this);
  }

  NotificationScope get scope;

  Future<PresentationError?> canSubscribe(NotificationTopic topic, ClientInfo clientInfo);
}
