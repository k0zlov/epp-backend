/// Shared Kernel (base classes)
sealed class BaseDomainFailure {
  const BaseDomainFailure();
}

mixin DomainFailureDetails {
  Map<String, dynamic> getDetails();
}

abstract class DomainFailureContext extends BaseDomainFailure with DomainFailureDetails {
  const DomainFailureContext({required this.failure});

  final BaseDomainFailure failure;

  Map<String, dynamic> getContextDetails();

  @override
  Map<String, dynamic> getDetails() {
    final Map<String, dynamic> details = {};

    if (failure is DomainFailureDetails) {
      details.addAll((failure as DomainFailureDetails).getDetails());
    }

    details.addAll(getContextDetails());
    return details;
  }

  DomainFailure? get root {
    final current = failure;
    if (current is DomainFailure) return current;
    if (current is DomainFailureContext) return current.root;
    return null;
  }
}

abstract class DomainFailure extends BaseDomainFailure {
  DomainFailure() : occurredAt = DateTime.now();

  final DateTime occurredAt;

  String get title => runtimeType.toString();
}

/// Domain layer (Context)
sealed class AuthFailure extends DomainFailure {}

class SessionFailureContext extends DomainFailureContext {
  SessionFailureContext({required this.sessionId, required super.failure});

  final String sessionId;

  @override
  Map<String, dynamic> getContextDetails() => {'sessionId': sessionId};
}

class UserFailureContext extends DomainFailureContext {
  UserFailureContext({required this.userId, required super.failure});

  final String userId;

  @override
  Map<String, dynamic> getContextDetails() => {'userId': userId};
}

/// if there are any params in domain failure
class SessionExpired extends AuthFailure with DomainFailureDetails {
  @override
  Map<String, dynamic> getDetails() {
    return {'test': 123};
  }
}
