// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presentation_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PresentationError {

 int get statusCode; String get code; String get message; Map<String, dynamic>? get details;
/// Create a copy of PresentationError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresentationErrorCopyWith<PresentationError> get copyWith => _$PresentationErrorCopyWithImpl<PresentationError>(this as PresentationError, _$identity);

  /// Serializes this PresentationError to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresentationError&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.details, details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,code,message,const DeepCollectionEquality().hash(details));

@override
String toString() {
  return 'PresentationError(statusCode: $statusCode, code: $code, message: $message, details: $details)';
}


}

/// @nodoc
abstract mixin class $PresentationErrorCopyWith<$Res>  {
  factory $PresentationErrorCopyWith(PresentationError value, $Res Function(PresentationError) _then) = _$PresentationErrorCopyWithImpl;
@useResult
$Res call({
 int statusCode, String code, String message, Map<String, dynamic>? details
});




}
/// @nodoc
class _$PresentationErrorCopyWithImpl<$Res>
    implements $PresentationErrorCopyWith<$Res> {
  _$PresentationErrorCopyWithImpl(this._self, this._then);

  final PresentationError _self;
  final $Res Function(PresentationError) _then;

/// Create a copy of PresentationError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusCode = null,Object? code = null,Object? message = null,Object? details = freezed,}) {
  return _then(_self.copyWith(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [PresentationError].
extension PresentationErrorPatterns on PresentationError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PresentationError value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PresentationError() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PresentationError value)  $default,){
final _that = this;
switch (_that) {
case _PresentationError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PresentationError value)?  $default,){
final _that = this;
switch (_that) {
case _PresentationError() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int statusCode,  String code,  String message,  Map<String, dynamic>? details)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PresentationError() when $default != null:
return $default(_that.statusCode,_that.code,_that.message,_that.details);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int statusCode,  String code,  String message,  Map<String, dynamic>? details)  $default,) {final _that = this;
switch (_that) {
case _PresentationError():
return $default(_that.statusCode,_that.code,_that.message,_that.details);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int statusCode,  String code,  String message,  Map<String, dynamic>? details)?  $default,) {final _that = this;
switch (_that) {
case _PresentationError() when $default != null:
return $default(_that.statusCode,_that.code,_that.message,_that.details);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PresentationError implements PresentationError {
  const _PresentationError({required this.statusCode, required this.code, required this.message, final  Map<String, dynamic>? details}): _details = details;
  factory _PresentationError.fromJson(Map<String, dynamic> json) => _$PresentationErrorFromJson(json);

@override final  int statusCode;
@override final  String code;
@override final  String message;
 final  Map<String, dynamic>? _details;
@override Map<String, dynamic>? get details {
  final value = _details;
  if (value == null) return null;
  if (_details is EqualUnmodifiableMapView) return _details;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of PresentationError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresentationErrorCopyWith<_PresentationError> get copyWith => __$PresentationErrorCopyWithImpl<_PresentationError>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PresentationErrorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresentationError&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._details, _details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,code,message,const DeepCollectionEquality().hash(_details));

@override
String toString() {
  return 'PresentationError(statusCode: $statusCode, code: $code, message: $message, details: $details)';
}


}

/// @nodoc
abstract mixin class _$PresentationErrorCopyWith<$Res> implements $PresentationErrorCopyWith<$Res> {
  factory _$PresentationErrorCopyWith(_PresentationError value, $Res Function(_PresentationError) _then) = __$PresentationErrorCopyWithImpl;
@override @useResult
$Res call({
 int statusCode, String code, String message, Map<String, dynamic>? details
});




}
/// @nodoc
class __$PresentationErrorCopyWithImpl<$Res>
    implements _$PresentationErrorCopyWith<$Res> {
  __$PresentationErrorCopyWithImpl(this._self, this._then);

  final _PresentationError _self;
  final $Res Function(_PresentationError) _then;

/// Create a copy of PresentationError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCode = null,Object? code = null,Object? message = null,Object? details = freezed,}) {
  return _then(_PresentationError(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,details: freezed == details ? _self._details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
