sealed class DomainFailureBase {
  const DomainFailureBase();
}

mixin DomainFailureDetails {
  Map<String, dynamic> getDetails();
}

abstract class DomainFailureContext extends DomainFailureBase with DomainFailureDetails {
  const DomainFailureContext({required this.failure});

  final DomainFailureBase failure;

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

abstract class DomainFailure extends DomainFailureBase {
  DomainFailure() : occurredAt = DateTime.timestamp();

  final DateTime occurredAt;
}

abstract class DomainFailureList extends DomainFailureBase {
  const DomainFailureList({required this.failures});

  final List<DomainFailureBase> failures;
}
