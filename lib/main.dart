import 'dart:io';

import 'package:epp_backend/app/di/register_dependencies.dart';
import 'package:epp_backend/shared/presentation/presentation.dart';
import 'package:ruta/ruta.dart';

Future<void> init() async {}

Future<HttpServer> run(
  Future<Handler> Function() handlerCallback,
  InternetAddress address,
  int port,
) async {
  await registerDependencies();

  final Handler handler = (await handlerCallback())
      .use(LogRequestsMiddleware(logger: (message, isError) {}))
      .use(getIt<ErrorMiddleware>())
      .use(getIt<AuthMiddleware>());

  return serve(handler, address, port);
}
