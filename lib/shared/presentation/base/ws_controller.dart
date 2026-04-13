import 'package:epp_backend/shared/presentation/base/presentation_error.dart';
import 'package:epp_backend/shared/presentation/base/ws_messages.dart';
import 'package:epp_backend/shared/presentation/ws/ws_manager.dart';

abstract class WsController {
  WsController({required WsManager manager}) {
    manager.registerController(this);
  }

  String get topicName;

  Future<PresentationError?> canSubscribe(WsTopic topic);
}
