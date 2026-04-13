// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClientInfo {

 String get clientId; bool get isAuthorized;
/// Create a copy of ClientInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientInfoCopyWith<ClientInfo> get copyWith => _$ClientInfoCopyWithImpl<ClientInfo>(this as ClientInfo, _$identity);

  /// Serializes this ClientInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientInfo&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.isAuthorized, isAuthorized) || other.isAuthorized == isAuthorized));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,isAuthorized);

@override
String toString() {
  return 'ClientInfo(clientId: $clientId, isAuthorized: $isAuthorized)';
}


}

/// @nodoc
abstract mixin class $ClientInfoCopyWith<$Res>  {
  factory $ClientInfoCopyWith(ClientInfo value, $Res Function(ClientInfo) _then) = _$ClientInfoCopyWithImpl;
@useResult
$Res call({
 String clientId, bool isAuthorized
});




}
/// @nodoc
class _$ClientInfoCopyWithImpl<$Res>
    implements $ClientInfoCopyWith<$Res> {
  _$ClientInfoCopyWithImpl(this._self, this._then);

  final ClientInfo _self;
  final $Res Function(ClientInfo) _then;

/// Create a copy of ClientInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientId = null,Object? isAuthorized = null,}) {
  return _then(_self.copyWith(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,isAuthorized: null == isAuthorized ? _self.isAuthorized : isAuthorized // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientInfo].
extension ClientInfoPatterns on ClientInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientInfo value)  $default,){
final _that = this;
switch (_that) {
case _ClientInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ClientInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String clientId,  bool isAuthorized)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientInfo() when $default != null:
return $default(_that.clientId,_that.isAuthorized);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String clientId,  bool isAuthorized)  $default,) {final _that = this;
switch (_that) {
case _ClientInfo():
return $default(_that.clientId,_that.isAuthorized);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String clientId,  bool isAuthorized)?  $default,) {final _that = this;
switch (_that) {
case _ClientInfo() when $default != null:
return $default(_that.clientId,_that.isAuthorized);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientInfo implements ClientInfo {
  const _ClientInfo({required this.clientId, required this.isAuthorized});
  factory _ClientInfo.fromJson(Map<String, dynamic> json) => _$ClientInfoFromJson(json);

@override final  String clientId;
@override final  bool isAuthorized;

/// Create a copy of ClientInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientInfoCopyWith<_ClientInfo> get copyWith => __$ClientInfoCopyWithImpl<_ClientInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientInfo&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.isAuthorized, isAuthorized) || other.isAuthorized == isAuthorized));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,isAuthorized);

@override
String toString() {
  return 'ClientInfo(clientId: $clientId, isAuthorized: $isAuthorized)';
}


}

/// @nodoc
abstract mixin class _$ClientInfoCopyWith<$Res> implements $ClientInfoCopyWith<$Res> {
  factory _$ClientInfoCopyWith(_ClientInfo value, $Res Function(_ClientInfo) _then) = __$ClientInfoCopyWithImpl;
@override @useResult
$Res call({
 String clientId, bool isAuthorized
});




}
/// @nodoc
class __$ClientInfoCopyWithImpl<$Res>
    implements _$ClientInfoCopyWith<$Res> {
  __$ClientInfoCopyWithImpl(this._self, this._then);

  final _ClientInfo _self;
  final $Res Function(_ClientInfo) _then;

/// Create a copy of ClientInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientId = null,Object? isAuthorized = null,}) {
  return _then(_ClientInfo(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,isAuthorized: null == isAuthorized ? _self.isAuthorized : isAuthorized // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
