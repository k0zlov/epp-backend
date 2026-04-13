import 'dart:io';

import 'package:ruta/ruta.dart';

Future<void> init() async {}

Future<HttpServer> run(
  Future<Handler> Function() handlerCallback,
  InternetAddress address,
  int port,
) async {
  // await registerDependencies();

  final Handler handler = (await handlerCallback()).use(
    LogRequestsMiddleware(logger: (message, isError) {}),
  );

  return serve(handler, address, port);
}
