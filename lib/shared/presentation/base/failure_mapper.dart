import 'package:epp_backend/shared/domain/base/failure.dart';
import 'package:epp_backend/shared/presentation/base/presentation_error.dart';

typedef FailurePresentation = (int statusCode, String message);

abstract class FailureMapper<T extends DomainFailure> {
  FailurePresentation map(T failure);

  PresentationError resolve(BaseDomainFailure failure) {
    final Map<String, dynamic> details = {};

    if (failure is DomainFailureDetails) {
      details.addAll((failure as DomainFailureDetails).getDetails());
    }

    DomainFailure? rootFailure;

    if (failure is DomainFailure) rootFailure = failure;
    if (failure is DomainFailureContext) rootFailure = failure.root;

    if (rootFailure is! T) {
      throw Exception(
        'FailureMapper Exception: Expected failure of type $T, '
        'but received ${rootFailure.runtimeType}. '
        'Check if the correct mapper is being used for this context.',
      );
    }

    final (statusCode, message) = map(rootFailure);

    return PresentationError(
      statusCode: statusCode,
      code: rootFailure.title,
      message: message,
      details: details,
    );
  }
}
