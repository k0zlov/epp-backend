import 'dart:async';

import 'package:epp_backend/contexts/auth/presentation/ws/auth_ws_topics.dart';
import 'package:epp_backend/shared/application/application.dart';
import 'package:epp_backend/shared/application/events/auth_integration_events.dart';
import 'package:epp_backend/shared/presentation/presentation.dart';

class UserLoggedOutIntegrationListener extends EventListener<UserLoggedOutIntegrationEvent> {
  UserLoggedOutIntegrationListener({required super.eventBus, required this.wsManager});

  final WsManager wsManager;

  @override
  FutureOr<void> handle(UserLoggedOutIntegrationEvent event) async {
    final WsServerMessage message = WsServerMessage.event(
      topic: WsTopic(title: AuthWsTopics.user, id: event.userId),
      title: event.eventName,
      payload: event.toJson(),
    );

    wsManager.send(message);
    await wsManager.disconnectBySession(event.sessionId);
  }
}
