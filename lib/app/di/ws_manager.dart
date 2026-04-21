part of 'register_dependencies.dart';

Future<void> _wsManager() async {
  _registerLazySingleton<WsManager>(WsManager.new);
}
