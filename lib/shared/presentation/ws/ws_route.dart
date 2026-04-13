import 'package:epp_backend/shared/presentation/extensions/request_x.dart';
import 'package:epp_backend/shared/presentation/ws/ws_manager.dart';
import 'package:ruta/annotations.dart';
import 'package:ruta/ruta.dart';

@rutaRoute
class WsRoute extends Route {
  WsRoute({required this.wsManager});

  final WsManager wsManager;

  @override
  String get name => 'ws';

  Endpoint get connect {
    return Endpoint.get(
      path: 'connect',
      handler: (req) async {
        return wsHandler(
          req,
          onConnection: (channel, subprotocol) {
            return wsManager.connect(
              clientInfo: req.clientInfo,
              channel: channel,
            );
          },
        );
      },
    );
  }
}
