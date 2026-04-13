// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ws_messages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WsTopic {

 String get title; String? get id;
/// Create a copy of WsTopic
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsTopicCopyWith<WsTopic> get copyWith => _$WsTopicCopyWithImpl<WsTopic>(this as WsTopic, _$identity);

  /// Serializes this WsTopic to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsTopic&&(identical(other.title, title) || other.title == title)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,id);

@override
String toString() {
  return 'WsTopic(title: $title, id: $id)';
}


}

/// @nodoc
abstract mixin class $WsTopicCopyWith<$Res>  {
  factory $WsTopicCopyWith(WsTopic value, $Res Function(WsTopic) _then) = _$WsTopicCopyWithImpl;
@useResult
$Res call({
 String title, String? id
});




}
/// @nodoc
class _$WsTopicCopyWithImpl<$Res>
    implements $WsTopicCopyWith<$Res> {
  _$WsTopicCopyWithImpl(this._self, this._then);

  final WsTopic _self;
  final $Res Function(WsTopic) _then;

/// Create a copy of WsTopic
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? id = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WsTopic].
extension WsTopicPatterns on WsTopic {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WsTopic value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WsTopic() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WsTopic value)  $default,){
final _that = this;
switch (_that) {
case _WsTopic():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WsTopic value)?  $default,){
final _that = this;
switch (_that) {
case _WsTopic() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WsTopic() when $default != null:
return $default(_that.title,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String? id)  $default,) {final _that = this;
switch (_that) {
case _WsTopic():
return $default(_that.title,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String? id)?  $default,) {final _that = this;
switch (_that) {
case _WsTopic() when $default != null:
return $default(_that.title,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WsTopic extends WsTopic {
  const _WsTopic({required this.title, this.id}): super._();
  factory _WsTopic.fromJson(Map<String, dynamic> json) => _$WsTopicFromJson(json);

@override final  String title;
@override final  String? id;

/// Create a copy of WsTopic
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WsTopicCopyWith<_WsTopic> get copyWith => __$WsTopicCopyWithImpl<_WsTopic>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WsTopicToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WsTopic&&(identical(other.title, title) || other.title == title)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,id);

@override
String toString() {
  return 'WsTopic(title: $title, id: $id)';
}


}

/// @nodoc
abstract mixin class _$WsTopicCopyWith<$Res> implements $WsTopicCopyWith<$Res> {
  factory _$WsTopicCopyWith(_WsTopic value, $Res Function(_WsTopic) _then) = __$WsTopicCopyWithImpl;
@override @useResult
$Res call({
 String title, String? id
});




}
/// @nodoc
class __$WsTopicCopyWithImpl<$Res>
    implements _$WsTopicCopyWith<$Res> {
  __$WsTopicCopyWithImpl(this._self, this._then);

  final _WsTopic _self;
  final $Res Function(_WsTopic) _then;

/// Create a copy of WsTopic
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? id = freezed,}) {
  return _then(_WsTopic(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$WsClientMessage {

 WsClientAction get action; WsTopic get topic;
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
 WsClientAction action, WsTopic topic
});


$WsTopicCopyWith<$Res> get topic;

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
as WsClientAction,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as WsTopic,
  ));
}
/// Create a copy of WsClientMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WsTopicCopyWith<$Res> get topic {
  
  return $WsTopicCopyWith<$Res>(_self.topic, (value) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WsClientAction action,  WsTopic topic)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WsClientAction action,  WsTopic topic)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WsClientAction action,  WsTopic topic)?  $default,) {final _that = this;
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

@override final  WsClientAction action;
@override final  WsTopic topic;

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
 WsClientAction action, WsTopic topic
});


@override $WsTopicCopyWith<$Res> get topic;

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
as WsClientAction,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as WsTopic,
  ));
}

/// Create a copy of WsClientMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WsTopicCopyWith<$Res> get topic {
  
  return $WsTopicCopyWith<$Res>(_self.topic, (value) {
    return _then(_self.copyWith(topic: value));
  });
}
}


/// @nodoc
mixin _$WsServerMessage {

/// Event or error title
 String get title; WsTopic get topic; WsServerMessageType get type; Map<String, dynamic>? get payload;
/// Create a copy of WsServerMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsServerMessageCopyWith<WsServerMessage> get copyWith => _$WsServerMessageCopyWithImpl<WsServerMessage>(this as WsServerMessage, _$identity);

  /// Serializes this WsServerMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsServerMessage&&(identical(other.title, title) || other.title == title)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.payload, payload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,topic,type,const DeepCollectionEquality().hash(payload));

@override
String toString() {
  return 'WsServerMessage(title: $title, topic: $topic, type: $type, payload: $payload)';
}


}

/// @nodoc
abstract mixin class $WsServerMessageCopyWith<$Res>  {
  factory $WsServerMessageCopyWith(WsServerMessage value, $Res Function(WsServerMessage) _then) = _$WsServerMessageCopyWithImpl;
@useResult
$Res call({
 String title, WsTopic topic, WsServerMessageType type, Map<String, dynamic>? payload
});


$WsTopicCopyWith<$Res> get topic;

}
/// @nodoc
class _$WsServerMessageCopyWithImpl<$Res>
    implements $WsServerMessageCopyWith<$Res> {
  _$WsServerMessageCopyWithImpl(this._self, this._then);

  final WsServerMessage _self;
  final $Res Function(WsServerMessage) _then;

/// Create a copy of WsServerMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? topic = null,Object? type = null,Object? payload = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as WsTopic,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as WsServerMessageType,payload: freezed == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of WsServerMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WsTopicCopyWith<$Res> get topic {
  
  return $WsTopicCopyWith<$Res>(_self.topic, (value) {
    return _then(_self.copyWith(topic: value));
  });
}
}


/// Adds pattern-matching-related methods to [WsServerMessage].
extension WsServerMessagePatterns on WsServerMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WsServerMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WsServerMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WsServerMessage value)  $default,){
final _that = this;
switch (_that) {
case _WsServerMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WsServerMessage value)?  $default,){
final _that = this;
switch (_that) {
case _WsServerMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  WsTopic topic,  WsServerMessageType type,  Map<String, dynamic>? payload)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WsServerMessage() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  WsTopic topic,  WsServerMessageType type,  Map<String, dynamic>? payload)  $default,) {final _that = this;
switch (_that) {
case _WsServerMessage():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  WsTopic topic,  WsServerMessageType type,  Map<String, dynamic>? payload)?  $default,) {final _that = this;
switch (_that) {
case _WsServerMessage() when $default != null:
return $default(_that.title,_that.topic,_that.type,_that.payload);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WsServerMessage implements WsServerMessage {
  const _WsServerMessage({required this.title, required this.topic, required this.type, final  Map<String, dynamic>? payload}): _payload = payload;
  factory _WsServerMessage.fromJson(Map<String, dynamic> json) => _$WsServerMessageFromJson(json);

/// Event or error title
@override final  String title;
@override final  WsTopic topic;
@override final  WsServerMessageType type;
 final  Map<String, dynamic>? _payload;
@override Map<String, dynamic>? get payload {
  final value = _payload;
  if (value == null) return null;
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of WsServerMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WsServerMessageCopyWith<_WsServerMessage> get copyWith => __$WsServerMessageCopyWithImpl<_WsServerMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WsServerMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WsServerMessage&&(identical(other.title, title) || other.title == title)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._payload, _payload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,topic,type,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'WsServerMessage(title: $title, topic: $topic, type: $type, payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$WsServerMessageCopyWith<$Res> implements $WsServerMessageCopyWith<$Res> {
  factory _$WsServerMessageCopyWith(_WsServerMessage value, $Res Function(_WsServerMessage) _then) = __$WsServerMessageCopyWithImpl;
@override @useResult
$Res call({
 String title, WsTopic topic, WsServerMessageType type, Map<String, dynamic>? payload
});


@override $WsTopicCopyWith<$Res> get topic;

}
/// @nodoc
class __$WsServerMessageCopyWithImpl<$Res>
    implements _$WsServerMessageCopyWith<$Res> {
  __$WsServerMessageCopyWithImpl(this._self, this._then);

  final _WsServerMessage _self;
  final $Res Function(_WsServerMessage) _then;

/// Create a copy of WsServerMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? topic = null,Object? type = null,Object? payload = freezed,}) {
  return _then(_WsServerMessage(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as WsTopic,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as WsServerMessageType,payload: freezed == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of WsServerMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WsTopicCopyWith<$Res> get topic {
  
  return $WsTopicCopyWith<$Res>(_self.topic, (value) {
    return _then(_self.copyWith(topic: value));
  });
}
}

// dart format on
