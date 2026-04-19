// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refresh_session_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RefreshSessionParams {

 String get userId; String get sessionId; String get token; String get ipAddress; String get userAgent;
/// Create a copy of RefreshSessionParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshSessionParamsCopyWith<RefreshSessionParams> get copyWith => _$RefreshSessionParamsCopyWithImpl<RefreshSessionParams>(this as RefreshSessionParams, _$identity);

  /// Serializes this RefreshSessionParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshSessionParams&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.token, token) || other.token == token)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,sessionId,token,ipAddress,userAgent);

@override
String toString() {
  return 'RefreshSessionParams(userId: $userId, sessionId: $sessionId, token: $token, ipAddress: $ipAddress, userAgent: $userAgent)';
}


}

/// @nodoc
abstract mixin class $RefreshSessionParamsCopyWith<$Res>  {
  factory $RefreshSessionParamsCopyWith(RefreshSessionParams value, $Res Function(RefreshSessionParams) _then) = _$RefreshSessionParamsCopyWithImpl;
@useResult
$Res call({
 String userId, String sessionId, String token, String ipAddress, String userAgent
});




}
/// @nodoc
class _$RefreshSessionParamsCopyWithImpl<$Res>
    implements $RefreshSessionParamsCopyWith<$Res> {
  _$RefreshSessionParamsCopyWithImpl(this._self, this._then);

  final RefreshSessionParams _self;
  final $Res Function(RefreshSessionParams) _then;

/// Create a copy of RefreshSessionParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? sessionId = null,Object? token = null,Object? ipAddress = null,Object? userAgent = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,ipAddress: null == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String,userAgent: null == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RefreshSessionParams].
extension RefreshSessionParamsPatterns on RefreshSessionParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefreshSessionParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefreshSessionParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefreshSessionParams value)  $default,){
final _that = this;
switch (_that) {
case _RefreshSessionParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefreshSessionParams value)?  $default,){
final _that = this;
switch (_that) {
case _RefreshSessionParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String sessionId,  String token,  String ipAddress,  String userAgent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefreshSessionParams() when $default != null:
return $default(_that.userId,_that.sessionId,_that.token,_that.ipAddress,_that.userAgent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String sessionId,  String token,  String ipAddress,  String userAgent)  $default,) {final _that = this;
switch (_that) {
case _RefreshSessionParams():
return $default(_that.userId,_that.sessionId,_that.token,_that.ipAddress,_that.userAgent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String sessionId,  String token,  String ipAddress,  String userAgent)?  $default,) {final _that = this;
switch (_that) {
case _RefreshSessionParams() when $default != null:
return $default(_that.userId,_that.sessionId,_that.token,_that.ipAddress,_that.userAgent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefreshSessionParams implements RefreshSessionParams {
  const _RefreshSessionParams({required this.userId, required this.sessionId, required this.token, required this.ipAddress, required this.userAgent});
  factory _RefreshSessionParams.fromJson(Map<String, dynamic> json) => _$RefreshSessionParamsFromJson(json);

@override final  String userId;
@override final  String sessionId;
@override final  String token;
@override final  String ipAddress;
@override final  String userAgent;

/// Create a copy of RefreshSessionParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshSessionParamsCopyWith<_RefreshSessionParams> get copyWith => __$RefreshSessionParamsCopyWithImpl<_RefreshSessionParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefreshSessionParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshSessionParams&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.token, token) || other.token == token)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,sessionId,token,ipAddress,userAgent);

@override
String toString() {
  return 'RefreshSessionParams(userId: $userId, sessionId: $sessionId, token: $token, ipAddress: $ipAddress, userAgent: $userAgent)';
}


}

/// @nodoc
abstract mixin class _$RefreshSessionParamsCopyWith<$Res> implements $RefreshSessionParamsCopyWith<$Res> {
  factory _$RefreshSessionParamsCopyWith(_RefreshSessionParams value, $Res Function(_RefreshSessionParams) _then) = __$RefreshSessionParamsCopyWithImpl;
@override @useResult
$Res call({
 String userId, String sessionId, String token, String ipAddress, String userAgent
});




}
/// @nodoc
class __$RefreshSessionParamsCopyWithImpl<$Res>
    implements _$RefreshSessionParamsCopyWith<$Res> {
  __$RefreshSessionParamsCopyWithImpl(this._self, this._then);

  final _RefreshSessionParams _self;
  final $Res Function(_RefreshSessionParams) _then;

/// Create a copy of RefreshSessionParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? sessionId = null,Object? token = null,Object? ipAddress = null,Object? userAgent = null,}) {
  return _then(_RefreshSessionParams(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,ipAddress: null == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String,userAgent: null == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
