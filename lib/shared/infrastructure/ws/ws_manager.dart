import 'dart:async';
import 'dart:convert';

import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/application/base/metrics_definition.dart';
import 'package:epp_backend/shared/application/ports/metrics_service.dart';
import 'package:epp_backend/shared/infrastructure/base/client_info.dart';
import 'package:epp_backend/shared/infrastructure/base/presentation_error.dart';
import 'package:epp_backend/shared/infrastructure/base/ws_client_message.dart';
import 'package:epp_backend/shared/infrastructure/base/ws_controller.dart';
import 'package:epp_backend/shared/infrastructure/ws/ws_notification_subscriber.dart';
import 'package:uuid/v4.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WsManager implements NotificationService, WsNotificationSubscriber {
  WsManager({
    required this.metricsService,
    required this.logger,
  });

  final MetricsService metricsService;
  final LoggerService logger;

  final Map<String, WebSocketChannel> _connections = {};
  final Map<String, ClientInfo> _connectionInfo = {};
  final Map<String, Set<String>> _sessionToConnections = {};
  final Map<String, Set<String>> _userToConnections = {};
  final Map<NotificationTopic, Set<String>> _topicSubscriptions = {};
  final Map<String, Set<NotificationTopic>> _connectionSubscriptions = {};
  final Map<NotificationScope, WsController> _controllers = {};

  static const Set<NotificationScope> _protectedScopes = {
    NotificationScope.user,
    NotificationScope.session,
    NotificationScope.system,
  };

  void _updateActiveSessionsMetric() {
    metricsService.setGauge(MetricDefinition.activeSessions, _connections.length);
  }

  @override
  void registerController(WsController controller) {
    if (_controllers.containsKey(controller.scope)) {
      throw Exception('A WsController with that scope has already been registered');
    }
    _controllers[controller.scope] = controller;
  }

  @override
  void subscribe({required WebSocketChannel channel, required ClientInfo clientInfo}) {
    final String connectionId = const UuidV4().generate();
    _connections[connectionId] = channel;
    _connectionInfo[connectionId] = clientInfo;

    _updateActiveSessionsMetric();

    logger.info(
      'New WS connection established',
      context: LogContext(
        event: 'ws.connected',
        payload: {'connectionId': connectionId, 'userId': clientInfo.userId},
      ),
    );

    if (clientInfo.sessionId != null) {
      _sessionToConnections.putIfAbsent(clientInfo.sessionId!, () => {}).add(connectionId);
      _internalSubscribe(
        connectionId: connectionId,
        topic: NotificationTopic(scope: NotificationScope.session, id: clientInfo.sessionId),
      );
    }

    if (clientInfo.userId != null) {
      _userToConnections.putIfAbsent(clientInfo.userId!, () => {}).add(connectionId);
      _internalSubscribe(
        connectionId: connectionId,
        topic: NotificationTopic(scope: NotificationScope.user, id: clientInfo.userId),
      );
    }

    channel.stream.listen(
      (rawData) => _handleClientMessage(rawData, connectionId),
      onDone: () => _disconnect(connectionId),
      onError: (dynamic e) async {
        logger.error(
          'WS stream error',
          error: e,
          context: LogContext(event: 'ws.error', payload: {'id': connectionId}),
        );
        await _disconnect(connectionId);
      },
    );
  }

  @override
  void send(NotificationMessage message) {
    final Set<String>? connectionIds = _topicSubscriptions[message.topic];
    if (connectionIds == null || connectionIds.isEmpty) return;

    final String encodedMessage = jsonEncode(message.toJson());

    for (final id in connectionIds) {
      _connections[id]?.sink.add(encodedMessage);
    }
  }

  @override
  void sendAll(List<NotificationMessage> messages) {
    messages.forEach(send);
  }

  @override
  Future<void> closeSession(String sessionId) async {
    final ids = _sessionToConnections[sessionId];
    if (ids == null) return;
    for (final id in ids.toList()) {
      await _disconnect(id, code: 4001, reason: 'Session closed');
    }
  }

  @override
  Future<void> closeUser(String userId) async {
    final ids = _userToConnections[userId];
    if (ids == null) return;
    for (final id in ids.toList()) {
      await _disconnect(id, code: 4001, reason: 'User terminated');
    }
  }

  Future<void> _handleClientMessage(dynamic data, String connectionId) async {
    final channel = _connections[connectionId];
    final clientInfo = _connectionInfo[connectionId];
    if (channel == null || clientInfo == null) return;

    try {
      if (data is! String) return;
      final Map<String, dynamic> decoded = jsonDecode(data) as Map<String, dynamic>;
      final clientMessage = WsClientMessage.fromJson(decoded);

      final topic = clientMessage.topic;
      final action = clientMessage.action;
      final controller = _controllers[topic.scope];

      if (_protectedScopes.contains(topic.scope)) {
        _sendError(
          channel,
          const PresentationError(
            statusCode: 403,
            code: 'ForbiddenTopic',
            message: 'You cannot manually subscribe or unsubscribe from this topic',
          ),
          topic: topic,
        );
        return;
      }

      if (controller == null) {
        _sendError(
          channel,
          const PresentationError(
            statusCode: 402,
            code: 'InvalidTopic',
            message: 'There is no such topic scope',
          ),
          topic: topic,
        );
        return;
      }

      if (action == 'subscribe') {
        final error = await controller.canSubscribe(topic, clientInfo);
        if (error != null) {
          _sendError(channel, error, topic: topic);
        } else {
          _internalSubscribe(connectionId: connectionId, topic: topic);
          logger.info(
            'WS topic subscribed',
            context: LogContext(
              event: 'ws.subscribe',
              payload: {'connectionId': connectionId, 'topic': topic.scope.name},
            ),
          );
        }
      } else if (action == 'unsubscribe') {
        _internalUnsubscribe(connectionId: connectionId, topic: topic);
      }
    } catch (e) {
      logger.error(
        'Invalid WS message format',
        error: e,
        context: LogContext(event: 'ws.invalid_format', payload: {'data': data}),
      );
      _sendError(
        channel,
        const PresentationError(
          statusCode: 402,
          code: 'InvalidFormat',
          message: 'The format of your request is invalid',
        ),
      );
    }
  }

  void _internalSubscribe({required String connectionId, required NotificationTopic topic}) {
    _topicSubscriptions.putIfAbsent(topic, () => {}).add(connectionId);
    _connectionSubscriptions.putIfAbsent(connectionId, () => {}).add(topic);
  }

  void _internalUnsubscribe({required String connectionId, required NotificationTopic topic}) {
    _topicSubscriptions[topic]?.remove(connectionId);
    if (_topicSubscriptions[topic]?.isEmpty ?? false) {
      _topicSubscriptions.remove(topic);
    }
    _connectionSubscriptions[connectionId]?.remove(topic);
  }

  Future<void> _disconnect(String connectionId, {int? code, String? reason}) async {
    final channel = _connections.remove(connectionId);
    await channel?.sink.close(code, reason);

    _updateActiveSessionsMetric();

    logger.info(
      'WS connection closed',
      context: LogContext(
        event: 'ws.disconnected',
        payload: {'connectionId': connectionId, 'reason': reason ?? 'unknown'},
      ),
    );

    final info = _connectionInfo.remove(connectionId);
    if (info != null) {
      if (info.sessionId != null) {
        _sessionToConnections[info.sessionId]?.remove(connectionId);
        if (_sessionToConnections[info.sessionId]?.isEmpty ?? false) {
          _sessionToConnections.remove(info.sessionId);
        }
      }
      if (info.userId != null) {
        _userToConnections[info.userId]?.remove(connectionId);
        if (_userToConnections[info.userId]?.isEmpty ?? false) {
          _userToConnections.remove(info.userId);
        }
      }
    }

    final subscriptions = _connectionSubscriptions.remove(connectionId);
    if (subscriptions != null) {
      for (final topic in subscriptions) {
        _topicSubscriptions[topic]?.remove(connectionId);
        if (_topicSubscriptions[topic]?.isEmpty ?? false) {
          _topicSubscriptions.remove(topic);
        }
      }
    }
  }

  void _sendError(WebSocketChannel channel, PresentationError error, {NotificationTopic? topic}) {
    final message = NotificationMessage.error(
      message: error.message,
      topic: topic ?? const NotificationTopic(scope: NotificationScope.system),
    );
    channel.sink.add(jsonEncode(message.toJson()));
  }
}
