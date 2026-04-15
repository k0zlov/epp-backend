import 'package:epp_backend/shared/domain/domain.dart';

sealed class AuthFailure extends DomainFailure {}

class EmailAlreadyInUse extends AuthFailure with DomainFailureDetails {
  EmailAlreadyInUse(this.email);

  final String email;

  @override
  Map<String, dynamic> getDetails() => {'email': email};
}
