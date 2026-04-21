import 'package:epp_backend/shared/presentation/base/client_info.dart';
import 'package:ruta/ruta.dart';

extension RequestX on Request {
  ClientInfo get clientInfo {
    final clientInfo = context['clientInfo'];

    if (clientInfo is! ClientInfo) {
      throw Exception('Could not access ClientInfo in Request');
    }

    return clientInfo;
  }

  String? get ip {
    return connectionInfo.remoteAddress.address;
  }

  String? get userAgent {
    final userAgent = headers['User-Agent'];

    if (userAgent is String) {
      return userAgent;
    }
    return null;
  }

  bool get isSocketConnection {
    return headers['Upgrade'] == 'websocket';
  }

  String? get bearerToken {
    return headers['Authorization']?.split(' ')[1];
  }

  String? get socketToken {
    return url.queryParameters['token'];
  }

  String? get socketClientId {
    return url.queryParameters['clientId'];
  }

  String? get clientId {
    return headers['X-Client-ID'];
  }
}
