// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TokenPayload {

 String get userId; String get sessionId;
/// Create a copy of TokenPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenPayloadCopyWith<TokenPayload> get copyWith => _$TokenPayloadCopyWithImpl<TokenPayload>(this as TokenPayload, _$identity);

  /// Serializes this TokenPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenPayload&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,sessionId);

@override
String toString() {
  return 'TokenPayload(userId: $userId, sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $TokenPayloadCopyWith<$Res>  {
  factory $TokenPayloadCopyWith(TokenPayload value, $Res Function(TokenPayload) _then) = _$TokenPayloadCopyWithImpl;
@useResult
$Res call({
 String userId, String sessionId
});




}
/// @nodoc
class _$TokenPayloadCopyWithImpl<$Res>
    implements $TokenPayloadCopyWith<$Res> {
  _$TokenPayloadCopyWithImpl(this._self, this._then);

  final TokenPayload _self;
  final $Res Function(TokenPayload) _then;

/// Create a copy of TokenPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? sessionId = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TokenPayload].
extension TokenPayloadPatterns on TokenPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TokenPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TokenPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TokenPayload value)  $default,){
final _that = this;
switch (_that) {
case _TokenPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TokenPayload value)?  $default,){
final _that = this;
switch (_that) {
case _TokenPayload() when $default != null:
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
case _TokenPayload() when $default != null:
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
case _TokenPayload():
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
case _TokenPayload() when $default != null:
return $default(_that.userId,_that.sessionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TokenPayload implements TokenPayload {
  const _TokenPayload({required this.userId, required this.sessionId});
  factory _TokenPayload.fromJson(Map<String, dynamic> json) => _$TokenPayloadFromJson(json);

@override final  String userId;
@override final  String sessionId;

/// Create a copy of TokenPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenPayloadCopyWith<_TokenPayload> get copyWith => __$TokenPayloadCopyWithImpl<_TokenPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokenPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenPayload&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,sessionId);

@override
String toString() {
  return 'TokenPayload(userId: $userId, sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class _$TokenPayloadCopyWith<$Res> implements $TokenPayloadCopyWith<$Res> {
  factory _$TokenPayloadCopyWith(_TokenPayload value, $Res Function(_TokenPayload) _then) = __$TokenPayloadCopyWithImpl;
@override @useResult
$Res call({
 String userId, String sessionId
});




}
/// @nodoc
class __$TokenPayloadCopyWithImpl<$Res>
    implements _$TokenPayloadCopyWith<$Res> {
  __$TokenPayloadCopyWithImpl(this._self, this._then);

  final _TokenPayload _self;
  final $Res Function(_TokenPayload) _then;

/// Create a copy of TokenPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? sessionId = null,}) {
  return _then(_TokenPayload(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
