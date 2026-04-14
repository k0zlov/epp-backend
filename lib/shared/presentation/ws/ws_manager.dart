import 'dart:async';
import 'dart:convert';

import 'package:epp_backend/shared/presentation/base/client_info.dart';
import 'package:epp_backend/shared/presentation/base/presentation_error.dart';
import 'package:epp_backend/shared/presentation/base/ws_controller.dart';
import 'package:epp_backend/shared/presentation/base/ws_messages.dart';
import 'package:ruta/ruta.dart';
import 'package:uuid/v4.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

FutureOr<Response> wsHandler(
  Request req, {
  required FutureOr<void> Function(WebSocketChannel channel, String? subprotocol) onConnection,
}) {
  return webSocketHandler(onConnection)(req);
}

class WsManager {
  /// Web Socket Channel ID, Web Socket Channel
  final Map<String, WebSocketChannel> connections = {};

  /// WsClientInfo, Web Socket Channel IDs
  final Map<ClientInfo, Set<String>> clientConnections = {};

  /// Topic, Web Socket Channel IDs
  final Map<WsTopic, Set<String>> topicSubscriptions = {};

  final Map<String, Set<WsTopic>> connectionSubscriptions = {};

  /// Topic Name , Controller
  final Map<String, WsController> _controllers = {};

  void registerController(WsController controller) {
    final WsController? existingController = _controllers[controller.topicName];

    if (existingController != null) {
      throw Exception('A WsController with that topic has already been registered');
    }

    _controllers[controller.topicName] = controller;
  }

  Future<void> connect({
    required ClientInfo clientInfo,
    required WebSocketChannel channel,
  }) async {
    final String connectionId = const UuidV4().generate();

    connections[connectionId] = channel;
    clientConnections.putIfAbsent(clientInfo, () => {});
    clientConnections[clientInfo]!.add(connectionId);

    channel.stream.listen(
      (rawData) async => _handleClientMessage(rawData, channel, clientInfo, connectionId),
      onDone: () => disconnect(clientInfo: clientInfo, connectionId: connectionId),
      onError: (error) => disconnect(clientInfo: clientInfo, connectionId: connectionId),
    );
  }

  Future<void> disconnect({
    required ClientInfo clientInfo,
    required String connectionId,
  }) async {
    final channel = connections.remove(connectionId);
    await channel?.sink.close();

    final clientConns = clientConnections[clientInfo];
    if (clientConns != null) {
      clientConns.remove(connectionId);
      if (clientConns.isEmpty) clientConnections.remove(clientInfo);
    }

    final subscriptions = connectionSubscriptions.remove(connectionId);
    if (subscriptions != null) {
      for (final topic in subscriptions) {
        topicSubscriptions[topic]?.remove(connectionId);
        if (topicSubscriptions[topic]?.isEmpty ?? false) {
          topicSubscriptions.remove(topic);
        }
      }
    }
  }

  void send(WsServerMessage message) {
    final Set<String>? connectionIds = topicSubscriptions[message.topic];
    if (connectionIds == null || connectionIds.isEmpty) return;

    final String encodedMessage = jsonEncode(message.toJson());

    for (final connectionId in connectionIds) {
      final channel = connections[connectionId];
      if (channel == null) continue;
      channel.sink.add(encodedMessage);
    }
  }

  Future<void> _handleClientMessage(
    dynamic data,
    WebSocketChannel channel,
    ClientInfo clientInfo,
    String connectionId,
  ) async {
    WsClientMessage clientMessage;
    try {
      if (data is! String) return;
      final rawJson = jsonDecode(data);

      if (rawJson is! Map<String, dynamic>) return;
      clientMessage = WsClientMessage.fromJson(rawJson);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      channel.sink.add(
        jsonEncode(
          WsServerMessage.error(
            topic: const WsTopic(title: 'system'),
            error: const PresentationError(
              statusCode: 402,
              code: 'InvalidFormat',
              message: 'The format of your request is invalid',
            ),
          ).toJson(),
        ),
      );
      return;
    }

    final topic = clientMessage.topic;
    final controller = _controllers[topic.title];
    if (controller == null) {
      channel.sink.add(
        jsonEncode(
          WsServerMessage.error(
            topic: topic,
            error: const PresentationError(
              statusCode: 402,
              code: 'InvalidTopic',
              message: 'There is no such topic',
            ),
          ).toJson(),
        ),
      );
      return;
    }

    switch (clientMessage.action) {
      case WsClientAction.subscribe:
        final PresentationError? error = await controller.canSubscribe(topic);

        if (error != null) {
          channel.sink.add(jsonEncode(WsServerMessage.error(topic: topic, error: error).toJson()));
        } else {
          _subscribe(connectionId: connectionId, topic: topic);
        }
      case WsClientAction.unsubscribe:
        _unsubscribe(connectionId: connectionId, topic: topic);
    }
  }

  void _subscribe({required String connectionId, required WsTopic topic}) {
    topicSubscriptions.putIfAbsent(topic, () => {}).add(connectionId);
    connectionSubscriptions.putIfAbsent(connectionId, () => {}).add(topic);
  }

  void _unsubscribe({required String connectionId, required WsTopic topic}) {
    final connections = topicSubscriptions[topic];
    if (connections != null) {
      connections.remove(connectionId);
      if (connections.isEmpty) {
        topicSubscriptions.remove(topic);
      }
    }

    final topics = connectionSubscriptions[connectionId];
    if (topics != null) {
      topics.remove(topic);
      if (topics.isEmpty) {
        connectionSubscriptions.remove(connectionId);
      }
    }
  }
}
