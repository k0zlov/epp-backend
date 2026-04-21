import 'package:epp_backend/shared/domain/domain.dart';

abstract class IntegrationEvent extends Event {
  String get eventName {
    final String typeName = runtimeType.toString().replaceFirst(RegExp(r'^[_$]+'), '');

    final String baseName = typeName.endsWith('IntegrationEvent')
        ? typeName.substring(0, typeName.length - 'IntegrationEvent'.length)
        : typeName;

    return baseName
        .replaceAllMapped(
          RegExp('(?<=[a-z])[A-Z]'),
          (m) => '_${m.group(0)}',
        )
        .toLowerCase();
  }
}
