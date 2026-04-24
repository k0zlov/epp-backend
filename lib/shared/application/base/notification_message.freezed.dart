// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationTopic {

 NotificationScope get scope; String? get id;
/// Create a copy of NotificationTopic
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationTopicCopyWith<NotificationTopic> get copyWith => _$NotificationTopicCopyWithImpl<NotificationTopic>(this as NotificationTopic, _$identity);

  /// Serializes this NotificationTopic to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationTopic&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,scope,id);

@override
String toString() {
  return 'NotificationTopic(scope: $scope, id: $id)';
}


}

/// @nodoc
abstract mixin class $NotificationTopicCopyWith<$Res>  {
  factory $NotificationTopicCopyWith(NotificationTopic value, $Res Function(NotificationTopic) _then) = _$NotificationTopicCopyWithImpl;
@useResult
$Res call({
 NotificationScope scope, String? id
});




}
/// @nodoc
class _$NotificationTopicCopyWithImpl<$Res>
    implements $NotificationTopicCopyWith<$Res> {
  _$NotificationTopicCopyWithImpl(this._self, this._then);

  final NotificationTopic _self;
  final $Res Function(NotificationTopic) _then;

/// Create a copy of NotificationTopic
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scope = null,Object? id = freezed,}) {
  return _then(_self.copyWith(
scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as NotificationScope,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationTopic].
extension NotificationTopicPatterns on NotificationTopic {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationTopic value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationTopic() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationTopic value)  $default,){
final _that = this;
switch (_that) {
case _NotificationTopic():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationTopic value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationTopic() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NotificationScope scope,  String? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationTopic() when $default != null:
return $default(_that.scope,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NotificationScope scope,  String? id)  $default,) {final _that = this;
switch (_that) {
case _NotificationTopic():
return $default(_that.scope,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NotificationScope scope,  String? id)?  $default,) {final _that = this;
switch (_that) {
case _NotificationTopic() when $default != null:
return $default(_that.scope,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationTopic implements NotificationTopic {
  const _NotificationTopic({required this.scope, this.id});
  factory _NotificationTopic.fromJson(Map<String, dynamic> json) => _$NotificationTopicFromJson(json);

@override final  NotificationScope scope;
@override final  String? id;

/// Create a copy of NotificationTopic
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationTopicCopyWith<_NotificationTopic> get copyWith => __$NotificationTopicCopyWithImpl<_NotificationTopic>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationTopicToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationTopic&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,scope,id);

@override
String toString() {
  return 'NotificationTopic(scope: $scope, id: $id)';
}


}

/// @nodoc
abstract mixin class _$NotificationTopicCopyWith<$Res> implements $NotificationTopicCopyWith<$Res> {
  factory _$NotificationTopicCopyWith(_NotificationTopic value, $Res Function(_NotificationTopic) _then) = __$NotificationTopicCopyWithImpl;
@override @useResult
$Res call({
 NotificationScope scope, String? id
});




}
/// @nodoc
class __$NotificationTopicCopyWithImpl<$Res>
    implements _$NotificationTopicCopyWith<$Res> {
  __$NotificationTopicCopyWithImpl(this._self, this._then);

  final _NotificationTopic _self;
  final $Res Function(_NotificationTopic) _then;

/// Create a copy of NotificationTopic
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? scope = null,Object? id = freezed,}) {
  return _then(_NotificationTopic(
scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as NotificationScope,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$NotificationMessage {

 NotificationEvent get title; NotificationTopic get topic; NotificationMessageType get type; Map<String, dynamic>? get payload;
/// Create a copy of NotificationMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationMessageCopyWith<NotificationMessage> get copyWith => _$NotificationMessageCopyWithImpl<NotificationMessage>(this as NotificationMessage, _$identity);

  /// Serializes this NotificationMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationMessage&&(identical(other.title, title) || other.title == title)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.payload, payload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,topic,type,const DeepCollectionEquality().hash(payload));

@override
String toString() {
  return 'NotificationMessage(title: $title, topic: $topic, type: $type, payload: $payload)';
}


}

/// @nodoc
abstract mixin class $NotificationMessageCopyWith<$Res>  {
  factory $NotificationMessageCopyWith(NotificationMessage value, $Res Function(NotificationMessage) _then) = _$NotificationMessageCopyWithImpl;
@useResult
$Res call({
 NotificationEvent title, NotificationTopic topic, NotificationMessageType type, Map<String, dynamic>? payload
});


$NotificationTopicCopyWith<$Res> get topic;

}
/// @nodoc
class _$NotificationMessageCopyWithImpl<$Res>
    implements $NotificationMessageCopyWith<$Res> {
  _$NotificationMessageCopyWithImpl(this._self, this._then);

  final NotificationMessage _self;
  final $Res Function(NotificationMessage) _then;

/// Create a copy of NotificationMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? topic = null,Object? type = null,Object? payload = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as NotificationEvent,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as NotificationTopic,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationMessageType,payload: freezed == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of NotificationMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationTopicCopyWith<$Res> get topic {
  
  return $NotificationTopicCopyWith<$Res>(_self.topic, (value) {
    return _then(_self.copyWith(topic: value));
  });
}
}


/// Adds pattern-matching-related methods to [NotificationMessage].
extension NotificationMessagePatterns on NotificationMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationMessage value)  $default,){
final _that = this;
switch (_that) {
case _NotificationMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationMessage value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NotificationEvent title,  NotificationTopic topic,  NotificationMessageType type,  Map<String, dynamic>? payload)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationMessage() when $default != null:
return $default(_that.title,_that.topic,_that.type,_that.payload);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NotificationEvent title,  NotificationTopic topic,  NotificationMessageType type,  Map<String, dynamic>? payload)  $default,) {final _that = this;
switch (_that) {
case _NotificationMessage():
return $default(_that.title,_that.topic,_that.type,_that.payload);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NotificationEvent title,  NotificationTopic topic,  NotificationMessageType type,  Map<String, dynamic>? payload)?  $default,) {final _that = this;
switch (_that) {
case _NotificationMessage() when $default != null:
return $default(_that.title,_that.topic,_that.type,_that.payload);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationMessage implements NotificationMessage {
  const _NotificationMessage({required this.title, required this.topic, required this.type, final  Map<String, dynamic>? payload}): _payload = payload;
  factory _NotificationMessage.fromJson(Map<String, dynamic> json) => _$NotificationMessageFromJson(json);

@override final  NotificationEvent title;
@override final  NotificationTopic topic;
@override final  NotificationMessageType type;
 final  Map<String, dynamic>? _payload;
@override Map<String, dynamic>? get payload {
  final value = _payload;
  if (value == null) return null;
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of NotificationMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationMessageCopyWith<_NotificationMessage> get copyWith => __$NotificationMessageCopyWithImpl<_NotificationMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationMessage&&(identical(other.title, title) || other.title == title)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._payload, _payload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,topic,type,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'NotificationMessage(title: $title, topic: $topic, type: $type, payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$NotificationMessageCopyWith<$Res> implements $NotificationMessageCopyWith<$Res> {
  factory _$NotificationMessageCopyWith(_NotificationMessage value, $Res Function(_NotificationMessage) _then) = __$NotificationMessageCopyWithImpl;
@override @useResult
$Res call({
 NotificationEvent title, NotificationTopic topic, NotificationMessageType type, Map<String, dynamic>? payload
});


@override $NotificationTopicCopyWith<$Res> get topic;

}
/// @nodoc
class __$NotificationMessageCopyWithImpl<$Res>
    implements _$NotificationMessageCopyWith<$Res> {
  __$NotificationMessageCopyWithImpl(this._self, this._then);

  final _NotificationMessage _self;
  final $Res Function(_NotificationMessage) _then;

/// Create a copy of NotificationMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? topic = null,Object? type = null,Object? payload = freezed,}) {
  return _then(_NotificationMessage(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as NotificationEvent,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as NotificationTopic,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationMessageType,payload: freezed == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of NotificationMessage
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
