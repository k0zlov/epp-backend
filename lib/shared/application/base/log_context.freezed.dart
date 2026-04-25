// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LogContext {

 String get event; Map<String, dynamic>? get payload;
/// Create a copy of LogContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogContextCopyWith<LogContext> get copyWith => _$LogContextCopyWithImpl<LogContext>(this as LogContext, _$identity);

  /// Serializes this LogContext to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogContext&&(identical(other.event, event) || other.event == event)&&const DeepCollectionEquality().equals(other.payload, payload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,event,const DeepCollectionEquality().hash(payload));

@override
String toString() {
  return 'LogContext(event: $event, payload: $payload)';
}


}

/// @nodoc
abstract mixin class $LogContextCopyWith<$Res>  {
  factory $LogContextCopyWith(LogContext value, $Res Function(LogContext) _then) = _$LogContextCopyWithImpl;
@useResult
$Res call({
 String event, Map<String, dynamic>? payload
});




}
/// @nodoc
class _$LogContextCopyWithImpl<$Res>
    implements $LogContextCopyWith<$Res> {
  _$LogContextCopyWithImpl(this._self, this._then);

  final LogContext _self;
  final $Res Function(LogContext) _then;

/// Create a copy of LogContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? event = null,Object? payload = freezed,}) {
  return _then(_self.copyWith(
event: null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as String,payload: freezed == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [LogContext].
extension LogContextPatterns on LogContext {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogContext() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogContext value)  $default,){
final _that = this;
switch (_that) {
case _LogContext():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogContext value)?  $default,){
final _that = this;
switch (_that) {
case _LogContext() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String event,  Map<String, dynamic>? payload)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogContext() when $default != null:
return $default(_that.event,_that.payload);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String event,  Map<String, dynamic>? payload)  $default,) {final _that = this;
switch (_that) {
case _LogContext():
return $default(_that.event,_that.payload);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String event,  Map<String, dynamic>? payload)?  $default,) {final _that = this;
switch (_that) {
case _LogContext() when $default != null:
return $default(_that.event,_that.payload);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LogContext implements LogContext {
  const _LogContext({required this.event, final  Map<String, dynamic>? payload}): _payload = payload;
  factory _LogContext.fromJson(Map<String, dynamic> json) => _$LogContextFromJson(json);

@override final  String event;
 final  Map<String, dynamic>? _payload;
@override Map<String, dynamic>? get payload {
  final value = _payload;
  if (value == null) return null;
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of LogContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogContextCopyWith<_LogContext> get copyWith => __$LogContextCopyWithImpl<_LogContext>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogContextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogContext&&(identical(other.event, event) || other.event == event)&&const DeepCollectionEquality().equals(other._payload, _payload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,event,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'LogContext(event: $event, payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$LogContextCopyWith<$Res> implements $LogContextCopyWith<$Res> {
  factory _$LogContextCopyWith(_LogContext value, $Res Function(_LogContext) _then) = __$LogContextCopyWithImpl;
@override @useResult
$Res call({
 String event, Map<String, dynamic>? payload
});




}
/// @nodoc
class __$LogContextCopyWithImpl<$Res>
    implements _$LogContextCopyWith<$Res> {
  __$LogContextCopyWithImpl(this._self, this._then);

  final _LogContext _self;
  final $Res Function(_LogContext) _then;

/// Create a copy of LogContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = null,Object? payload = freezed,}) {
  return _then(_LogContext(
event: null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as String,payload: freezed == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
