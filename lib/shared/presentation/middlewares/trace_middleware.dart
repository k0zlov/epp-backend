import 'dart:async';

import 'package:ruta/ruta.dart';
import 'package:uuid/uuid.dart';

class TraceMiddleware extends Middleware {
  @override
  Handler call(Handler handler) {
    return (Request request) {
      final traceId = const Uuid().v4();

      return runZoned(
        () => handler(request),
        zoneValues: {#traceId: traceId},
      );
    };
  }
}
