// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LogoutParams {

 String get userId; String get sessionId;
/// Create a copy of LogoutParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogoutParamsCopyWith<LogoutParams> get copyWith => _$LogoutParamsCopyWithImpl<LogoutParams>(this as LogoutParams, _$identity);

  /// Serializes this LogoutParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutParams&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,sessionId);

@override
String toString() {
  return 'LogoutParams(userId: $userId, sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $LogoutParamsCopyWith<$Res>  {
  factory $LogoutParamsCopyWith(LogoutParams value, $Res Function(LogoutParams) _then) = _$LogoutParamsCopyWithImpl;
@useResult
$Res call({
 String userId, String sessionId
});




}
/// @nodoc
class _$LogoutParamsCopyWithImpl<$Res>
    implements $LogoutParamsCopyWith<$Res> {
  _$LogoutParamsCopyWithImpl(this._self, this._then);

  final LogoutParams _self;
  final $Res Function(LogoutParams) _then;

/// Create a copy of LogoutParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? sessionId = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LogoutParams].
extension LogoutParamsPatterns on LogoutParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogoutParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogoutParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogoutParams value)  $default,){
final _that = this;
switch (_that) {
case _LogoutParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogoutParams value)?  $default,){
final _that = this;
switch (_that) {
case _LogoutParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String sessionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogoutParams() when $default != null:
return $default(_that.userId,_that.sessionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String sessionId)  $default,) {final _that = this;
switch (_that) {
case _LogoutParams():
return $default(_that.userId,_that.sessionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String sessionId)?  $default,) {final _that = this;
switch (_that) {
case _LogoutParams() when $default != null:
return $default(_that.userId,_that.sessionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LogoutParams implements LogoutParams {
  const _LogoutParams({required this.userId, required this.sessionId});
  factory _LogoutParams.fromJson(Map<String, dynamic> json) => _$LogoutParamsFromJson(json);

@override final  String userId;
@override final  String sessionId;

/// Create a copy of LogoutParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogoutParamsCopyWith<_LogoutParams> get copyWith => __$LogoutParamsCopyWithImpl<_LogoutParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogoutParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutParams&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,sessionId);

@override
String toString() {
  return 'LogoutParams(userId: $userId, sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class _$LogoutParamsCopyWith<$Res> implements $LogoutParamsCopyWith<$Res> {
  factory _$LogoutParamsCopyWith(_LogoutParams value, $Res Function(_LogoutParams) _then) = __$LogoutParamsCopyWithImpl;
@override @useResult
$Res call({
 String userId, String sessionId
});




}
/// @nodoc
class __$LogoutParamsCopyWithImpl<$Res>
    implements _$LogoutParamsCopyWith<$Res> {
  __$LogoutParamsCopyWithImpl(this._self, this._then);

  final _LogoutParams _self;
  final $Res Function(_LogoutParams) _then;

/// Create a copy of LogoutParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? sessionId = null,}) {
  return _then(_LogoutParams(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
