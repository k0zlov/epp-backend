import 'package:epp_backend/shared/application/base/notification_message.dart';

abstract interface class NotificationService {
  void send(NotificationMessage message);

  void sendAll(List<NotificationMessage> messages);

  Future<void> closeSession(String sessionId);

  Future<void> closeUser(String userId);
}
