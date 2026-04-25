import 'package:epp_backend/shared/infrastructure/ws/ws_notification_subscriber.dart';
import 'package:epp_backend/shared/presentation/extensions/request_x.dart';
import 'package:ruta/annotations.dart';
import 'package:ruta/ruta.dart';

@rutaRoute
class WsRoute extends Route {
  WsRoute({required this.wsNotificationSubscriber});

  final WsNotificationSubscriber wsNotificationSubscriber;

  @override
  String get name => 'ws';

  Endpoint get connect {
    return Endpoint.get(
      path: 'connect',
      handler: (req) async {
        return wsHandler(
          req,
          onConnection: (channel, subprotocol) {
            return wsNotificationSubscriber.subscribe(
              clientInfo: req.clientInfo,
              channel: channel,
            );
          },
        );
      },
    );
  }
}
