import 'package:epp_backend/contexts/auth/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_view.freezed.dart';

part 'user_view.g.dart';

@freezed
abstract class UserView with _$UserView {
  const factory UserView({
    required String id,
    required String email,
    required String displayName,
  }) = _UserView;

  factory UserView.fromDomain(User user) => UserView(
    id: user.id,
    email: user.email.value,
    displayName: user.displayName,
  );

  factory UserView.fromJson(Map<String, dynamic> json) => _$UserViewFromJson(json);
}
