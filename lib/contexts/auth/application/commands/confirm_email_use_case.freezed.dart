// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'confirm_email_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConfirmEmailParams {

 String get code; String get email;
/// Create a copy of ConfirmEmailParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfirmEmailParamsCopyWith<ConfirmEmailParams> get copyWith => _$ConfirmEmailParamsCopyWithImpl<ConfirmEmailParams>(this as ConfirmEmailParams, _$identity);

  /// Serializes this ConfirmEmailParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmEmailParams&&(identical(other.code, code) || other.code == code)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,email);

@override
String toString() {
  return 'ConfirmEmailParams(code: $code, email: $email)';
}


}

/// @nodoc
abstract mixin class $ConfirmEmailParamsCopyWith<$Res>  {
  factory $ConfirmEmailParamsCopyWith(ConfirmEmailParams value, $Res Function(ConfirmEmailParams) _then) = _$ConfirmEmailParamsCopyWithImpl;
@useResult
$Res call({
 String code, String email
});




}
/// @nodoc
class _$ConfirmEmailParamsCopyWithImpl<$Res>
    implements $ConfirmEmailParamsCopyWith<$Res> {
  _$ConfirmEmailParamsCopyWithImpl(this._self, this._then);

  final ConfirmEmailParams _self;
  final $Res Function(ConfirmEmailParams) _then;

/// Create a copy of ConfirmEmailParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? email = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ConfirmEmailParams].
extension ConfirmEmailParamsPatterns on ConfirmEmailParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConfirmEmailParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConfirmEmailParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConfirmEmailParams value)  $default,){
final _that = this;
switch (_that) {
case _ConfirmEmailParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConfirmEmailParams value)?  $default,){
final _that = this;
switch (_that) {
case _ConfirmEmailParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConfirmEmailParams() when $default != null:
return $default(_that.code,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String email)  $default,) {final _that = this;
switch (_that) {
case _ConfirmEmailParams():
return $default(_that.code,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String email)?  $default,) {final _that = this;
switch (_that) {
case _ConfirmEmailParams() when $default != null:
return $default(_that.code,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConfirmEmailParams implements ConfirmEmailParams {
  const _ConfirmEmailParams({required this.code, required this.email});
  factory _ConfirmEmailParams.fromJson(Map<String, dynamic> json) => _$ConfirmEmailParamsFromJson(json);

@override final  String code;
@override final  String email;

/// Create a copy of ConfirmEmailParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfirmEmailParamsCopyWith<_ConfirmEmailParams> get copyWith => __$ConfirmEmailParamsCopyWithImpl<_ConfirmEmailParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConfirmEmailParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfirmEmailParams&&(identical(other.code, code) || other.code == code)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,email);

@override
String toString() {
  return 'ConfirmEmailParams(code: $code, email: $email)';
}


}

/// @nodoc
abstract mixin class _$ConfirmEmailParamsCopyWith<$Res> implements $ConfirmEmailParamsCopyWith<$Res> {
  factory _$ConfirmEmailParamsCopyWith(_ConfirmEmailParams value, $Res Function(_ConfirmEmailParams) _then) = __$ConfirmEmailParamsCopyWithImpl;
@override @useResult
$Res call({
 String code, String email
});




}
/// @nodoc
class __$ConfirmEmailParamsCopyWithImpl<$Res>
    implements _$ConfirmEmailParamsCopyWith<$Res> {
  __$ConfirmEmailParamsCopyWithImpl(this._self, this._then);

  final _ConfirmEmailParams _self;
  final $Res Function(_ConfirmEmailParams) _then;

/// Create a copy of ConfirmEmailParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? email = null,}) {
  return _then(_ConfirmEmailParams(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
