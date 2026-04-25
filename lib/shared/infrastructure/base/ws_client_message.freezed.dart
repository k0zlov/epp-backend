// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ws_client_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WsClientMessage {

 String get action; NotificationTopic get topic;
/// Create a copy of WsClientMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsClientMessageCopyWith<WsClientMessage> get copyWith => _$WsClientMessageCopyWithImpl<WsClientMessage>(this as WsClientMessage, _$identity);

  /// Serializes this WsClientMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsClientMessage&&(identical(other.action, action) || other.action == action)&&(identical(other.topic, topic) || other.topic == topic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,action,topic);

@override
String toString() {
  return 'WsClientMessage(action: $action, topic: $topic)';
}


}

/// @nodoc
abstract mixin class $WsClientMessageCopyWith<$Res>  {
  factory $WsClientMessageCopyWith(WsClientMessage value, $Res Function(WsClientMessage) _then) = _$WsClientMessageCopyWithImpl;
@useResult
$Res call({
 String action, NotificationTopic topic
});


$NotificationTopicCopyWith<$Res> get topic;

}
/// @nodoc
class _$WsClientMessageCopyWithImpl<$Res>
    implements $WsClientMessageCopyWith<$Res> {
  _$WsClientMessageCopyWithImpl(this._self, this._then);

  final WsClientMessage _self;
  final $Res Function(WsClientMessage) _then;

/// Create a copy of WsClientMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? action = null,Object? topic = null,}) {
  return _then(_self.copyWith(
action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as NotificationTopic,
  ));
}
/// Create a copy of WsClientMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationTopicCopyWith<$Res> get topic {
  
  return $NotificationTopicCopyWith<$Res>(_self.topic, (value) {
    return _then(_self.copyWith(topic: value));
  });
}
}


/// Adds pattern-matching-related methods to [WsClientMessage].
extension WsClientMessagePatterns on WsClientMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WsClientMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WsClientMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WsClientMessage value)  $default,){
final _that = this;
switch (_that) {
case _WsClientMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WsClientMessage value)?  $default,){
final _that = this;
switch (_that) {
case _WsClientMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String action,  NotificationTopic topic)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WsClientMessage() when $default != null:
return $default(_that.action,_that.topic);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String action,  NotificationTopic topic)  $default,) {final _that = this;
switch (_that) {
case _WsClientMessage():
return $default(_that.action,_that.topic);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String action,  NotificationTopic topic)?  $default,) {final _that = this;
switch (_that) {
case _WsClientMessage() when $default != null:
return $default(_that.action,_that.topic);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WsClientMessage implements WsClientMessage {
  const _WsClientMessage({required this.action, required this.topic});
  factory _WsClientMessage.fromJson(Map<String, dynamic> json) => _$WsClientMessageFromJson(json);

@override final  String action;
@override final  NotificationTopic topic;

/// Create a copy of WsClientMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WsClientMessageCopyWith<_WsClientMessage> get copyWith => __$WsClientMessageCopyWithImpl<_WsClientMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WsClientMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WsClientMessage&&(identical(other.action, action) || other.action == action)&&(identical(other.topic, topic) || other.topic == topic));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,action,topic);

@override
String toString() {
  return 'WsClientMessage(action: $action, topic: $topic)';
}


}

/// @nodoc
abstract mixin class _$WsClientMessageCopyWith<$Res> implements $WsClientMessageCopyWith<$Res> {
  factory _$WsClientMessageCopyWith(_WsClientMessage value, $Res Function(_WsClientMessage) _then) = __$WsClientMessageCopyWithImpl;
@override @useResult
$Res call({
 String action, NotificationTopic topic
});


@override $NotificationTopicCopyWith<$Res> get topic;

}
/// @nodoc
class __$WsClientMessageCopyWithImpl<$Res>
    implements _$WsClientMessageCopyWith<$Res> {
  __$WsClientMessageCopyWithImpl(this._self, this._then);

  final _WsClientMessage _self;
  final $Res Function(_WsClientMessage) _then;

/// Create a copy of WsClientMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? action = null,Object? topic = null,}) {
  return _then(_WsClientMessage(
action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as NotificationTopic,
  ));
}

/// Create a copy of WsClientMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationTopicCopyWith<$Res> get topic {
  
  return $NotificationTopicCopyWith<$Res>(_self.topic, (value) {
    return _then(_self.copyWith(topic: value));
  });
}
}

// dart format on
