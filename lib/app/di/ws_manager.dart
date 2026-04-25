part of 'register_dependencies.dart';

Future<void> _wsManager() async {
  final manager = WsManager(metricsService: getIt(), logger: getIt());

  _registerSingleton<NotificationService>(manager);
  _registerSingleton<WsNotificationSubscriber>(manager);
}
