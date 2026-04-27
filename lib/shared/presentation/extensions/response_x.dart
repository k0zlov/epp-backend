import 'package:epp_backend/shared/infrastructure/infrastructure.dart';
import 'package:ruta/ruta.dart';

extension ResponseX on Response {
  static String presentationErrorKey = 'presentation_error';

  PresentationError? get presentationError => context[presentationErrorKey] as PresentationError?;

  Response withError(PresentationError error) {
    return copyWith(
      context: {
        ...context,
        presentationErrorKey: error,
      },
    );
  }
}
