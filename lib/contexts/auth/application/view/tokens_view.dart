import 'package:freezed_annotation/freezed_annotation.dart';

part 'tokens_view.freezed.dart';

part 'tokens_view.g.dart';

@freezed
abstract class TokensView with _$TokensView {
  const factory TokensView({
    required String accessToken,
    required String refreshToken,
    required String sessionId,
  }) = _TokensView;

  factory TokensView.fromJson(Map<String, dynamic> json) => _$TokensViewFromJson(json);
}
