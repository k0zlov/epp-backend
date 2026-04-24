part of 'register_dependencies.dart';

Future<void> _wsManager() async {
  final manager = WsManager();

  _registerSingleton<NotificationService>(manager);
  _registerSingleton<WsNotificationSubscriber>(manager);
}
