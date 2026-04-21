import 'dart:io';

import 'package:epp_backend/contexts/auth/presentation/ws/auth_ws_topics.dart';
import 'package:epp_backend/shared/presentation/base/client_info.dart';
import 'package:epp_backend/shared/presentation/base/presentation_error.dart';
import 'package:epp_backend/shared/presentation/base/ws_controller.dart';
import 'package:epp_backend/shared/presentation/base/ws_messages.dart';

class UserWsController extends WsController {
  UserWsController({required super.manager});

  @override
  String get topicName => AuthWsTopics.user;

  @override
  Future<PresentationError?> canSubscribe(WsTopic topic, ClientInfo clientInfo) async {
    final String? targetUserId = topic.id;

    if (!clientInfo.isAuthorized) {
      return const PresentationError(
        statusCode: HttpStatus.unauthorized,
        code: 'Unauthorized',
        message: 'You must be logged in to subscribe to user updates.',
      );
    }

    if (clientInfo.userId != targetUserId) {
      return const PresentationError(
        statusCode: HttpStatus.forbidden,
        code: 'Forbidden',
        message: 'You can only subscribe to your own updates.',
      );
    }

    return null;
  }
}
