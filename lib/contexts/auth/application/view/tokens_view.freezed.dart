// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tokens_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TokensView {

 String get accessToken; String get refreshToken; String get sessionId;
/// Create a copy of TokensView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokensViewCopyWith<TokensView> get copyWith => _$TokensViewCopyWithImpl<TokensView>(this as TokensView, _$identity);

  /// Serializes this TokensView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokensView&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,sessionId);

@override
String toString() {
  return 'TokensView(accessToken: $accessToken, refreshToken: $refreshToken, sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $TokensViewCopyWith<$Res>  {
  factory $TokensViewCopyWith(TokensView value, $Res Function(TokensView) _then) = _$TokensViewCopyWithImpl;
@useResult
$Res call({
 String accessToken, String refreshToken, String sessionId
});




}
/// @nodoc
class _$TokensViewCopyWithImpl<$Res>
    implements $TokensViewCopyWith<$Res> {
  _$TokensViewCopyWithImpl(this._self, this._then);

  final TokensView _self;
  final $Res Function(TokensView) _then;

/// Create a copy of TokensView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? refreshToken = null,Object? sessionId = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TokensView].
extension TokensViewPatterns on TokensView {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TokensView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TokensView() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TokensView value)  $default,){
final _that = this;
switch (_that) {
case _TokensView():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TokensView value)?  $default,){
final _that = this;
switch (_that) {
case _TokensView() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken,  String sessionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TokensView() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.sessionId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken,  String sessionId)  $default,) {final _that = this;
switch (_that) {
case _TokensView():
return $default(_that.accessToken,_that.refreshToken,_that.sessionId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accessToken,  String refreshToken,  String sessionId)?  $default,) {final _that = this;
switch (_that) {
case _TokensView() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.sessionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TokensView implements TokensView {
  const _TokensView({required this.accessToken, required this.refreshToken, required this.sessionId});
  factory _TokensView.fromJson(Map<String, dynamic> json) => _$TokensViewFromJson(json);

@override final  String accessToken;
@override final  String refreshToken;
@override final  String sessionId;

/// Create a copy of TokensView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokensViewCopyWith<_TokensView> get copyWith => __$TokensViewCopyWithImpl<_TokensView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokensViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokensView&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,sessionId);

@override
String toString() {
  return 'TokensView(accessToken: $accessToken, refreshToken: $refreshToken, sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class _$TokensViewCopyWith<$Res> implements $TokensViewCopyWith<$Res> {
  factory _$TokensViewCopyWith(_TokensView value, $Res Function(_TokensView) _then) = __$TokensViewCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, String refreshToken, String sessionId
});




}
/// @nodoc
class __$TokensViewCopyWithImpl<$Res>
    implements _$TokensViewCopyWith<$Res> {
  __$TokensViewCopyWithImpl(this._self, this._then);

  final _TokensView _self;
  final $Res Function(_TokensView) _then;

/// Create a copy of TokensView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? refreshToken = null,Object? sessionId = null,}) {
  return _then(_TokensView(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
