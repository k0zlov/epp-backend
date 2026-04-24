// ignore_for_file: one_member_abstracts

import 'dart:async';

import 'package:epp_backend/shared/infrastructure/base/client_info.dart';
import 'package:epp_backend/shared/infrastructure/base/ws_controller.dart';
import 'package:ruta/ruta.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

FutureOr<Response> wsHandler(
  Request req, {
  required FutureOr<void> Function(WebSocketChannel channel, String? subprotocol) onConnection,
}) {
  return webSocketHandler(onConnection)(req);
}

abstract interface class WsNotificationSubscriber {
  void subscribe({required WebSocketChannel channel, required ClientInfo clientInfo});

  void registerController(WsController controller);
}
