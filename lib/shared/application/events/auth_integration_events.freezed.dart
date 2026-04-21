// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_integration_events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserSignedUpIntegrationEvent {

 String get userId; String get email;
/// Create a copy of UserSignedUpIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSignedUpIntegrationEventCopyWith<UserSignedUpIntegrationEvent> get copyWith => _$UserSignedUpIntegrationEventCopyWithImpl<UserSignedUpIntegrationEvent>(this as UserSignedUpIntegrationEvent, _$identity);

  /// Serializes this UserSignedUpIntegrationEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSignedUpIntegrationEvent&&super == other&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,userId,email);

@override
String toString() {
  return 'UserSignedUpIntegrationEvent(userId: $userId, email: $email)';
}


}

/// @nodoc
abstract mixin class $UserSignedUpIntegrationEventCopyWith<$Res>  {
  factory $UserSignedUpIntegrationEventCopyWith(UserSignedUpIntegrationEvent value, $Res Function(UserSignedUpIntegrationEvent) _then) = _$UserSignedUpIntegrationEventCopyWithImpl;
@useResult
$Res call({
 String userId, String email
});




}
/// @nodoc
class _$UserSignedUpIntegrationEventCopyWithImpl<$Res>
    implements $UserSignedUpIntegrationEventCopyWith<$Res> {
  _$UserSignedUpIntegrationEventCopyWithImpl(this._self, this._then);

  final UserSignedUpIntegrationEvent _self;
  final $Res Function(UserSignedUpIntegrationEvent) _then;

/// Create a copy of UserSignedUpIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? email = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserSignedUpIntegrationEvent].
extension UserSignedUpIntegrationEventPatterns on UserSignedUpIntegrationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSignedUpIntegrationEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSignedUpIntegrationEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSignedUpIntegrationEvent value)  $default,){
final _that = this;
switch (_that) {
case _UserSignedUpIntegrationEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSignedUpIntegrationEvent value)?  $default,){
final _that = this;
switch (_that) {
case _UserSignedUpIntegrationEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSignedUpIntegrationEvent() when $default != null:
return $default(_that.userId,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String email)  $default,) {final _that = this;
switch (_that) {
case _UserSignedUpIntegrationEvent():
return $default(_that.userId,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String email)?  $default,) {final _that = this;
switch (_that) {
case _UserSignedUpIntegrationEvent() when $default != null:
return $default(_that.userId,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSignedUpIntegrationEvent extends UserSignedUpIntegrationEvent {
   _UserSignedUpIntegrationEvent({required this.userId, required this.email}): super._();
  factory _UserSignedUpIntegrationEvent.fromJson(Map<String, dynamic> json) => _$UserSignedUpIntegrationEventFromJson(json);

@override final  String userId;
@override final  String email;

/// Create a copy of UserSignedUpIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSignedUpIntegrationEventCopyWith<_UserSignedUpIntegrationEvent> get copyWith => __$UserSignedUpIntegrationEventCopyWithImpl<_UserSignedUpIntegrationEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserSignedUpIntegrationEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSignedUpIntegrationEvent&&super == other&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,userId,email);

@override
String toString() {
  return 'UserSignedUpIntegrationEvent(userId: $userId, email: $email)';
}


}

/// @nodoc
abstract mixin class _$UserSignedUpIntegrationEventCopyWith<$Res> implements $UserSignedUpIntegrationEventCopyWith<$Res> {
  factory _$UserSignedUpIntegrationEventCopyWith(_UserSignedUpIntegrationEvent value, $Res Function(_UserSignedUpIntegrationEvent) _then) = __$UserSignedUpIntegrationEventCopyWithImpl;
@override @useResult
$Res call({
 String userId, String email
});




}
/// @nodoc
class __$UserSignedUpIntegrationEventCopyWithImpl<$Res>
    implements _$UserSignedUpIntegrationEventCopyWith<$Res> {
  __$UserSignedUpIntegrationEventCopyWithImpl(this._self, this._then);

  final _UserSignedUpIntegrationEvent _self;
  final $Res Function(_UserSignedUpIntegrationEvent) _then;

/// Create a copy of UserSignedUpIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? email = null,}) {
  return _then(_UserSignedUpIntegrationEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UserLoggedInIntegrationEvent {

 String get userId; String get sessionId; String get ipAddress; String get userAgent;
/// Create a copy of UserLoggedInIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserLoggedInIntegrationEventCopyWith<UserLoggedInIntegrationEvent> get copyWith => _$UserLoggedInIntegrationEventCopyWithImpl<UserLoggedInIntegrationEvent>(this as UserLoggedInIntegrationEvent, _$identity);

  /// Serializes this UserLoggedInIntegrationEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLoggedInIntegrationEvent&&super == other&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,userId,sessionId,ipAddress,userAgent);

@override
String toString() {
  return 'UserLoggedInIntegrationEvent(userId: $userId, sessionId: $sessionId, ipAddress: $ipAddress, userAgent: $userAgent)';
}


}

/// @nodoc
abstract mixin class $UserLoggedInIntegrationEventCopyWith<$Res>  {
  factory $UserLoggedInIntegrationEventCopyWith(UserLoggedInIntegrationEvent value, $Res Function(UserLoggedInIntegrationEvent) _then) = _$UserLoggedInIntegrationEventCopyWithImpl;
@useResult
$Res call({
 String userId, String sessionId, String ipAddress, String userAgent
});




}
/// @nodoc
class _$UserLoggedInIntegrationEventCopyWithImpl<$Res>
    implements $UserLoggedInIntegrationEventCopyWith<$Res> {
  _$UserLoggedInIntegrationEventCopyWithImpl(this._self, this._then);

  final UserLoggedInIntegrationEvent _self;
  final $Res Function(UserLoggedInIntegrationEvent) _then;

/// Create a copy of UserLoggedInIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? sessionId = null,Object? ipAddress = null,Object? userAgent = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,ipAddress: null == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String,userAgent: null == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserLoggedInIntegrationEvent].
extension UserLoggedInIntegrationEventPatterns on UserLoggedInIntegrationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserLoggedInIntegrationEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserLoggedInIntegrationEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserLoggedInIntegrationEvent value)  $default,){
final _that = this;
switch (_that) {
case _UserLoggedInIntegrationEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserLoggedInIntegrationEvent value)?  $default,){
final _that = this;
switch (_that) {
case _UserLoggedInIntegrationEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String sessionId,  String ipAddress,  String userAgent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserLoggedInIntegrationEvent() when $default != null:
return $default(_that.userId,_that.sessionId,_that.ipAddress,_that.userAgent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String sessionId,  String ipAddress,  String userAgent)  $default,) {final _that = this;
switch (_that) {
case _UserLoggedInIntegrationEvent():
return $default(_that.userId,_that.sessionId,_that.ipAddress,_that.userAgent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String sessionId,  String ipAddress,  String userAgent)?  $default,) {final _that = this;
switch (_that) {
case _UserLoggedInIntegrationEvent() when $default != null:
return $default(_that.userId,_that.sessionId,_that.ipAddress,_that.userAgent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserLoggedInIntegrationEvent extends UserLoggedInIntegrationEvent {
   _UserLoggedInIntegrationEvent({required this.userId, required this.sessionId, required this.ipAddress, required this.userAgent}): super._();
  factory _UserLoggedInIntegrationEvent.fromJson(Map<String, dynamic> json) => _$UserLoggedInIntegrationEventFromJson(json);

@override final  String userId;
@override final  String sessionId;
@override final  String ipAddress;
@override final  String userAgent;

/// Create a copy of UserLoggedInIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserLoggedInIntegrationEventCopyWith<_UserLoggedInIntegrationEvent> get copyWith => __$UserLoggedInIntegrationEventCopyWithImpl<_UserLoggedInIntegrationEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserLoggedInIntegrationEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserLoggedInIntegrationEvent&&super == other&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,userId,sessionId,ipAddress,userAgent);

@override
String toString() {
  return 'UserLoggedInIntegrationEvent(userId: $userId, sessionId: $sessionId, ipAddress: $ipAddress, userAgent: $userAgent)';
}


}

/// @nodoc
abstract mixin class _$UserLoggedInIntegrationEventCopyWith<$Res> implements $UserLoggedInIntegrationEventCopyWith<$Res> {
  factory _$UserLoggedInIntegrationEventCopyWith(_UserLoggedInIntegrationEvent value, $Res Function(_UserLoggedInIntegrationEvent) _then) = __$UserLoggedInIntegrationEventCopyWithImpl;
@override @useResult
$Res call({
 String userId, String sessionId, String ipAddress, String userAgent
});




}
/// @nodoc
class __$UserLoggedInIntegrationEventCopyWithImpl<$Res>
    implements _$UserLoggedInIntegrationEventCopyWith<$Res> {
  __$UserLoggedInIntegrationEventCopyWithImpl(this._self, this._then);

  final _UserLoggedInIntegrationEvent _self;
  final $Res Function(_UserLoggedInIntegrationEvent) _then;

/// Create a copy of UserLoggedInIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? sessionId = null,Object? ipAddress = null,Object? userAgent = null,}) {
  return _then(_UserLoggedInIntegrationEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,ipAddress: null == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String,userAgent: null == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$EmailConfirmedIntegrationEvent {

 String get userId; String get codeId;
/// Create a copy of EmailConfirmedIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailConfirmedIntegrationEventCopyWith<EmailConfirmedIntegrationEvent> get copyWith => _$EmailConfirmedIntegrationEventCopyWithImpl<EmailConfirmedIntegrationEvent>(this as EmailConfirmedIntegrationEvent, _$identity);

  /// Serializes this EmailConfirmedIntegrationEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailConfirmedIntegrationEvent&&super == other&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.codeId, codeId) || other.codeId == codeId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,userId,codeId);

@override
String toString() {
  return 'EmailConfirmedIntegrationEvent(userId: $userId, codeId: $codeId)';
}


}

/// @nodoc
abstract mixin class $EmailConfirmedIntegrationEventCopyWith<$Res>  {
  factory $EmailConfirmedIntegrationEventCopyWith(EmailConfirmedIntegrationEvent value, $Res Function(EmailConfirmedIntegrationEvent) _then) = _$EmailConfirmedIntegrationEventCopyWithImpl;
@useResult
$Res call({
 String userId, String codeId
});




}
/// @nodoc
class _$EmailConfirmedIntegrationEventCopyWithImpl<$Res>
    implements $EmailConfirmedIntegrationEventCopyWith<$Res> {
  _$EmailConfirmedIntegrationEventCopyWithImpl(this._self, this._then);

  final EmailConfirmedIntegrationEvent _self;
  final $Res Function(EmailConfirmedIntegrationEvent) _then;

/// Create a copy of EmailConfirmedIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? codeId = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,codeId: null == codeId ? _self.codeId : codeId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EmailConfirmedIntegrationEvent].
extension EmailConfirmedIntegrationEventPatterns on EmailConfirmedIntegrationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmailConfirmedIntegrationEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmailConfirmedIntegrationEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmailConfirmedIntegrationEvent value)  $default,){
final _that = this;
switch (_that) {
case _EmailConfirmedIntegrationEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmailConfirmedIntegrationEvent value)?  $default,){
final _that = this;
switch (_that) {
case _EmailConfirmedIntegrationEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String codeId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmailConfirmedIntegrationEvent() when $default != null:
return $default(_that.userId,_that.codeId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String codeId)  $default,) {final _that = this;
switch (_that) {
case _EmailConfirmedIntegrationEvent():
return $default(_that.userId,_that.codeId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String codeId)?  $default,) {final _that = this;
switch (_that) {
case _EmailConfirmedIntegrationEvent() when $default != null:
return $default(_that.userId,_that.codeId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmailConfirmedIntegrationEvent extends EmailConfirmedIntegrationEvent {
   _EmailConfirmedIntegrationEvent({required this.userId, required this.codeId}): super._();
  factory _EmailConfirmedIntegrationEvent.fromJson(Map<String, dynamic> json) => _$EmailConfirmedIntegrationEventFromJson(json);

@override final  String userId;
@override final  String codeId;

/// Create a copy of EmailConfirmedIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailConfirmedIntegrationEventCopyWith<_EmailConfirmedIntegrationEvent> get copyWith => __$EmailConfirmedIntegrationEventCopyWithImpl<_EmailConfirmedIntegrationEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmailConfirmedIntegrationEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailConfirmedIntegrationEvent&&super == other&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.codeId, codeId) || other.codeId == codeId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,userId,codeId);

@override
String toString() {
  return 'EmailConfirmedIntegrationEvent(userId: $userId, codeId: $codeId)';
}


}

/// @nodoc
abstract mixin class _$EmailConfirmedIntegrationEventCopyWith<$Res> implements $EmailConfirmedIntegrationEventCopyWith<$Res> {
  factory _$EmailConfirmedIntegrationEventCopyWith(_EmailConfirmedIntegrationEvent value, $Res Function(_EmailConfirmedIntegrationEvent) _then) = __$EmailConfirmedIntegrationEventCopyWithImpl;
@override @useResult
$Res call({
 String userId, String codeId
});




}
/// @nodoc
class __$EmailConfirmedIntegrationEventCopyWithImpl<$Res>
    implements _$EmailConfirmedIntegrationEventCopyWith<$Res> {
  __$EmailConfirmedIntegrationEventCopyWithImpl(this._self, this._then);

  final _EmailConfirmedIntegrationEvent _self;
  final $Res Function(_EmailConfirmedIntegrationEvent) _then;

/// Create a copy of EmailConfirmedIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? codeId = null,}) {
  return _then(_EmailConfirmedIntegrationEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,codeId: null == codeId ? _self.codeId : codeId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$EmailConfirmationFailedIntegrationEvent {

 String get userId; String get codeId; int get attempts;
/// Create a copy of EmailConfirmationFailedIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailConfirmationFailedIntegrationEventCopyWith<EmailConfirmationFailedIntegrationEvent> get copyWith => _$EmailConfirmationFailedIntegrationEventCopyWithImpl<EmailConfirmationFailedIntegrationEvent>(this as EmailConfirmationFailedIntegrationEvent, _$identity);

  /// Serializes this EmailConfirmationFailedIntegrationEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailConfirmationFailedIntegrationEvent&&super == other&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.codeId, codeId) || other.codeId == codeId)&&(identical(other.attempts, attempts) || other.attempts == attempts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,userId,codeId,attempts);

@override
String toString() {
  return 'EmailConfirmationFailedIntegrationEvent(userId: $userId, codeId: $codeId, attempts: $attempts)';
}


}

/// @nodoc
abstract mixin class $EmailConfirmationFailedIntegrationEventCopyWith<$Res>  {
  factory $EmailConfirmationFailedIntegrationEventCopyWith(EmailConfirmationFailedIntegrationEvent value, $Res Function(EmailConfirmationFailedIntegrationEvent) _then) = _$EmailConfirmationFailedIntegrationEventCopyWithImpl;
@useResult
$Res call({
 String userId, String codeId, int attempts
});




}
/// @nodoc
class _$EmailConfirmationFailedIntegrationEventCopyWithImpl<$Res>
    implements $EmailConfirmationFailedIntegrationEventCopyWith<$Res> {
  _$EmailConfirmationFailedIntegrationEventCopyWithImpl(this._self, this._then);

  final EmailConfirmationFailedIntegrationEvent _self;
  final $Res Function(EmailConfirmationFailedIntegrationEvent) _then;

/// Create a copy of EmailConfirmationFailedIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? codeId = null,Object? attempts = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,codeId: null == codeId ? _self.codeId : codeId // ignore: cast_nullable_to_non_nullable
as String,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [EmailConfirmationFailedIntegrationEvent].
extension EmailConfirmationFailedIntegrationEventPatterns on EmailConfirmationFailedIntegrationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmailConfirmationFailedIntegrationEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmailConfirmationFailedIntegrationEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmailConfirmationFailedIntegrationEvent value)  $default,){
final _that = this;
switch (_that) {
case _EmailConfirmationFailedIntegrationEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmailConfirmationFailedIntegrationEvent value)?  $default,){
final _that = this;
switch (_that) {
case _EmailConfirmationFailedIntegrationEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String codeId,  int attempts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmailConfirmationFailedIntegrationEvent() when $default != null:
return $default(_that.userId,_that.codeId,_that.attempts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String codeId,  int attempts)  $default,) {final _that = this;
switch (_that) {
case _EmailConfirmationFailedIntegrationEvent():
return $default(_that.userId,_that.codeId,_that.attempts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String codeId,  int attempts)?  $default,) {final _that = this;
switch (_that) {
case _EmailConfirmationFailedIntegrationEvent() when $default != null:
return $default(_that.userId,_that.codeId,_that.attempts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmailConfirmationFailedIntegrationEvent extends EmailConfirmationFailedIntegrationEvent {
   _EmailConfirmationFailedIntegrationEvent({required this.userId, required this.codeId, required this.attempts}): super._();
  factory _EmailConfirmationFailedIntegrationEvent.fromJson(Map<String, dynamic> json) => _$EmailConfirmationFailedIntegrationEventFromJson(json);

@override final  String userId;
@override final  String codeId;
@override final  int attempts;

/// Create a copy of EmailConfirmationFailedIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailConfirmationFailedIntegrationEventCopyWith<_EmailConfirmationFailedIntegrationEvent> get copyWith => __$EmailConfirmationFailedIntegrationEventCopyWithImpl<_EmailConfirmationFailedIntegrationEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmailConfirmationFailedIntegrationEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailConfirmationFailedIntegrationEvent&&super == other&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.codeId, codeId) || other.codeId == codeId)&&(identical(other.attempts, attempts) || other.attempts == attempts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,userId,codeId,attempts);

@override
String toString() {
  return 'EmailConfirmationFailedIntegrationEvent(userId: $userId, codeId: $codeId, attempts: $attempts)';
}


}

/// @nodoc
abstract mixin class _$EmailConfirmationFailedIntegrationEventCopyWith<$Res> implements $EmailConfirmationFailedIntegrationEventCopyWith<$Res> {
  factory _$EmailConfirmationFailedIntegrationEventCopyWith(_EmailConfirmationFailedIntegrationEvent value, $Res Function(_EmailConfirmationFailedIntegrationEvent) _then) = __$EmailConfirmationFailedIntegrationEventCopyWithImpl;
@override @useResult
$Res call({
 String userId, String codeId, int attempts
});




}
/// @nodoc
class __$EmailConfirmationFailedIntegrationEventCopyWithImpl<$Res>
    implements _$EmailConfirmationFailedIntegrationEventCopyWith<$Res> {
  __$EmailConfirmationFailedIntegrationEventCopyWithImpl(this._self, this._then);

  final _EmailConfirmationFailedIntegrationEvent _self;
  final $Res Function(_EmailConfirmationFailedIntegrationEvent) _then;

/// Create a copy of EmailConfirmationFailedIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? codeId = null,Object? attempts = null,}) {
  return _then(_EmailConfirmationFailedIntegrationEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,codeId: null == codeId ? _self.codeId : codeId // ignore: cast_nullable_to_non_nullable
as String,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$AuthCodeCreatedIntegrationEvent {

 String get userId; String get codeId; String get type; List<String> get invalidatedCodeIds;
/// Create a copy of AuthCodeCreatedIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthCodeCreatedIntegrationEventCopyWith<AuthCodeCreatedIntegrationEvent> get copyWith => _$AuthCodeCreatedIntegrationEventCopyWithImpl<AuthCodeCreatedIntegrationEvent>(this as AuthCodeCreatedIntegrationEvent, _$identity);

  /// Serializes this AuthCodeCreatedIntegrationEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthCodeCreatedIntegrationEvent&&super == other&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.codeId, codeId) || other.codeId == codeId)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.invalidatedCodeIds, invalidatedCodeIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,userId,codeId,type,const DeepCollectionEquality().hash(invalidatedCodeIds));

@override
String toString() {
  return 'AuthCodeCreatedIntegrationEvent(userId: $userId, codeId: $codeId, type: $type, invalidatedCodeIds: $invalidatedCodeIds)';
}


}

/// @nodoc
abstract mixin class $AuthCodeCreatedIntegrationEventCopyWith<$Res>  {
  factory $AuthCodeCreatedIntegrationEventCopyWith(AuthCodeCreatedIntegrationEvent value, $Res Function(AuthCodeCreatedIntegrationEvent) _then) = _$AuthCodeCreatedIntegrationEventCopyWithImpl;
@useResult
$Res call({
 String userId, String codeId, String type, List<String> invalidatedCodeIds
});




}
/// @nodoc
class _$AuthCodeCreatedIntegrationEventCopyWithImpl<$Res>
    implements $AuthCodeCreatedIntegrationEventCopyWith<$Res> {
  _$AuthCodeCreatedIntegrationEventCopyWithImpl(this._self, this._then);

  final AuthCodeCreatedIntegrationEvent _self;
  final $Res Function(AuthCodeCreatedIntegrationEvent) _then;

/// Create a copy of AuthCodeCreatedIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? codeId = null,Object? type = null,Object? invalidatedCodeIds = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,codeId: null == codeId ? _self.codeId : codeId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,invalidatedCodeIds: null == invalidatedCodeIds ? _self.invalidatedCodeIds : invalidatedCodeIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthCodeCreatedIntegrationEvent].
extension AuthCodeCreatedIntegrationEventPatterns on AuthCodeCreatedIntegrationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthCodeCreatedIntegrationEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthCodeCreatedIntegrationEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthCodeCreatedIntegrationEvent value)  $default,){
final _that = this;
switch (_that) {
case _AuthCodeCreatedIntegrationEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthCodeCreatedIntegrationEvent value)?  $default,){
final _that = this;
switch (_that) {
case _AuthCodeCreatedIntegrationEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String codeId,  String type,  List<String> invalidatedCodeIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthCodeCreatedIntegrationEvent() when $default != null:
return $default(_that.userId,_that.codeId,_that.type,_that.invalidatedCodeIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String codeId,  String type,  List<String> invalidatedCodeIds)  $default,) {final _that = this;
switch (_that) {
case _AuthCodeCreatedIntegrationEvent():
return $default(_that.userId,_that.codeId,_that.type,_that.invalidatedCodeIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String codeId,  String type,  List<String> invalidatedCodeIds)?  $default,) {final _that = this;
switch (_that) {
case _AuthCodeCreatedIntegrationEvent() when $default != null:
return $default(_that.userId,_that.codeId,_that.type,_that.invalidatedCodeIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthCodeCreatedIntegrationEvent extends AuthCodeCreatedIntegrationEvent {
   _AuthCodeCreatedIntegrationEvent({required this.userId, required this.codeId, required this.type, required final  List<String> invalidatedCodeIds}): _invalidatedCodeIds = invalidatedCodeIds,super._();
  factory _AuthCodeCreatedIntegrationEvent.fromJson(Map<String, dynamic> json) => _$AuthCodeCreatedIntegrationEventFromJson(json);

@override final  String userId;
@override final  String codeId;
@override final  String type;
 final  List<String> _invalidatedCodeIds;
@override List<String> get invalidatedCodeIds {
  if (_invalidatedCodeIds is EqualUnmodifiableListView) return _invalidatedCodeIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invalidatedCodeIds);
}


/// Create a copy of AuthCodeCreatedIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthCodeCreatedIntegrationEventCopyWith<_AuthCodeCreatedIntegrationEvent> get copyWith => __$AuthCodeCreatedIntegrationEventCopyWithImpl<_AuthCodeCreatedIntegrationEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthCodeCreatedIntegrationEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthCodeCreatedIntegrationEvent&&super == other&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.codeId, codeId) || other.codeId == codeId)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._invalidatedCodeIds, _invalidatedCodeIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,userId,codeId,type,const DeepCollectionEquality().hash(_invalidatedCodeIds));

@override
String toString() {
  return 'AuthCodeCreatedIntegrationEvent(userId: $userId, codeId: $codeId, type: $type, invalidatedCodeIds: $invalidatedCodeIds)';
}


}

/// @nodoc
abstract mixin class _$AuthCodeCreatedIntegrationEventCopyWith<$Res> implements $AuthCodeCreatedIntegrationEventCopyWith<$Res> {
  factory _$AuthCodeCreatedIntegrationEventCopyWith(_AuthCodeCreatedIntegrationEvent value, $Res Function(_AuthCodeCreatedIntegrationEvent) _then) = __$AuthCodeCreatedIntegrationEventCopyWithImpl;
@override @useResult
$Res call({
 String userId, String codeId, String type, List<String> invalidatedCodeIds
});




}
/// @nodoc
class __$AuthCodeCreatedIntegrationEventCopyWithImpl<$Res>
    implements _$AuthCodeCreatedIntegrationEventCopyWith<$Res> {
  __$AuthCodeCreatedIntegrationEventCopyWithImpl(this._self, this._then);

  final _AuthCodeCreatedIntegrationEvent _self;
  final $Res Function(_AuthCodeCreatedIntegrationEvent) _then;

/// Create a copy of AuthCodeCreatedIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? codeId = null,Object? type = null,Object? invalidatedCodeIds = null,}) {
  return _then(_AuthCodeCreatedIntegrationEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,codeId: null == codeId ? _self.codeId : codeId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,invalidatedCodeIds: null == invalidatedCodeIds ? _self._invalidatedCodeIds : invalidatedCodeIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$AuthSessionRefreshedIntegrationEvent {

 String get userId; String get sessionId; String get ipAddress;
/// Create a copy of AuthSessionRefreshedIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthSessionRefreshedIntegrationEventCopyWith<AuthSessionRefreshedIntegrationEvent> get copyWith => _$AuthSessionRefreshedIntegrationEventCopyWithImpl<AuthSessionRefreshedIntegrationEvent>(this as AuthSessionRefreshedIntegrationEvent, _$identity);

  /// Serializes this AuthSessionRefreshedIntegrationEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSessionRefreshedIntegrationEvent&&super == other&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,userId,sessionId,ipAddress);

@override
String toString() {
  return 'AuthSessionRefreshedIntegrationEvent(userId: $userId, sessionId: $sessionId, ipAddress: $ipAddress)';
}


}

/// @nodoc
abstract mixin class $AuthSessionRefreshedIntegrationEventCopyWith<$Res>  {
  factory $AuthSessionRefreshedIntegrationEventCopyWith(AuthSessionRefreshedIntegrationEvent value, $Res Function(AuthSessionRefreshedIntegrationEvent) _then) = _$AuthSessionRefreshedIntegrationEventCopyWithImpl;
@useResult
$Res call({
 String userId, String sessionId, String ipAddress
});




}
/// @nodoc
class _$AuthSessionRefreshedIntegrationEventCopyWithImpl<$Res>
    implements $AuthSessionRefreshedIntegrationEventCopyWith<$Res> {
  _$AuthSessionRefreshedIntegrationEventCopyWithImpl(this._self, this._then);

  final AuthSessionRefreshedIntegrationEvent _self;
  final $Res Function(AuthSessionRefreshedIntegrationEvent) _then;

/// Create a copy of AuthSessionRefreshedIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? sessionId = null,Object? ipAddress = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,ipAddress: null == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthSessionRefreshedIntegrationEvent].
extension AuthSessionRefreshedIntegrationEventPatterns on AuthSessionRefreshedIntegrationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthSessionRefreshedIntegrationEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthSessionRefreshedIntegrationEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthSessionRefreshedIntegrationEvent value)  $default,){
final _that = this;
switch (_that) {
case _AuthSessionRefreshedIntegrationEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthSessionRefreshedIntegrationEvent value)?  $default,){
final _that = this;
switch (_that) {
case _AuthSessionRefreshedIntegrationEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String sessionId,  String ipAddress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthSessionRefreshedIntegrationEvent() when $default != null:
return $default(_that.userId,_that.sessionId,_that.ipAddress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String sessionId,  String ipAddress)  $default,) {final _that = this;
switch (_that) {
case _AuthSessionRefreshedIntegrationEvent():
return $default(_that.userId,_that.sessionId,_that.ipAddress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String sessionId,  String ipAddress)?  $default,) {final _that = this;
switch (_that) {
case _AuthSessionRefreshedIntegrationEvent() when $default != null:
return $default(_that.userId,_that.sessionId,_that.ipAddress);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthSessionRefreshedIntegrationEvent extends AuthSessionRefreshedIntegrationEvent {
   _AuthSessionRefreshedIntegrationEvent({required this.userId, required this.sessionId, required this.ipAddress}): super._();
  factory _AuthSessionRefreshedIntegrationEvent.fromJson(Map<String, dynamic> json) => _$AuthSessionRefreshedIntegrationEventFromJson(json);

@override final  String userId;
@override final  String sessionId;
@override final  String ipAddress;

/// Create a copy of AuthSessionRefreshedIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthSessionRefreshedIntegrationEventCopyWith<_AuthSessionRefreshedIntegrationEvent> get copyWith => __$AuthSessionRefreshedIntegrationEventCopyWithImpl<_AuthSessionRefreshedIntegrationEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthSessionRefreshedIntegrationEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthSessionRefreshedIntegrationEvent&&super == other&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,userId,sessionId,ipAddress);

@override
String toString() {
  return 'AuthSessionRefreshedIntegrationEvent(userId: $userId, sessionId: $sessionId, ipAddress: $ipAddress)';
}


}

/// @nodoc
abstract mixin class _$AuthSessionRefreshedIntegrationEventCopyWith<$Res> implements $AuthSessionRefreshedIntegrationEventCopyWith<$Res> {
  factory _$AuthSessionRefreshedIntegrationEventCopyWith(_AuthSessionRefreshedIntegrationEvent value, $Res Function(_AuthSessionRefreshedIntegrationEvent) _then) = __$AuthSessionRefreshedIntegrationEventCopyWithImpl;
@override @useResult
$Res call({
 String userId, String sessionId, String ipAddress
});




}
/// @nodoc
class __$AuthSessionRefreshedIntegrationEventCopyWithImpl<$Res>
    implements _$AuthSessionRefreshedIntegrationEventCopyWith<$Res> {
  __$AuthSessionRefreshedIntegrationEventCopyWithImpl(this._self, this._then);

  final _AuthSessionRefreshedIntegrationEvent _self;
  final $Res Function(_AuthSessionRefreshedIntegrationEvent) _then;

/// Create a copy of AuthSessionRefreshedIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? sessionId = null,Object? ipAddress = null,}) {
  return _then(_AuthSessionRefreshedIntegrationEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,ipAddress: null == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AuthTokenReuseDetectedIntegrationEvent {

 String get userId; String get sessionId;
/// Create a copy of AuthTokenReuseDetectedIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthTokenReuseDetectedIntegrationEventCopyWith<AuthTokenReuseDetectedIntegrationEvent> get copyWith => _$AuthTokenReuseDetectedIntegrationEventCopyWithImpl<AuthTokenReuseDetectedIntegrationEvent>(this as AuthTokenReuseDetectedIntegrationEvent, _$identity);

  /// Serializes this AuthTokenReuseDetectedIntegrationEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthTokenReuseDetectedIntegrationEvent&&super == other&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,userId,sessionId);

@override
String toString() {
  return 'AuthTokenReuseDetectedIntegrationEvent(userId: $userId, sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $AuthTokenReuseDetectedIntegrationEventCopyWith<$Res>  {
  factory $AuthTokenReuseDetectedIntegrationEventCopyWith(AuthTokenReuseDetectedIntegrationEvent value, $Res Function(AuthTokenReuseDetectedIntegrationEvent) _then) = _$AuthTokenReuseDetectedIntegrationEventCopyWithImpl;
@useResult
$Res call({
 String userId, String sessionId
});




}
/// @nodoc
class _$AuthTokenReuseDetectedIntegrationEventCopyWithImpl<$Res>
    implements $AuthTokenReuseDetectedIntegrationEventCopyWith<$Res> {
  _$AuthTokenReuseDetectedIntegrationEventCopyWithImpl(this._self, this._then);

  final AuthTokenReuseDetectedIntegrationEvent _self;
  final $Res Function(AuthTokenReuseDetectedIntegrationEvent) _then;

/// Create a copy of AuthTokenReuseDetectedIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? sessionId = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthTokenReuseDetectedIntegrationEvent].
extension AuthTokenReuseDetectedIntegrationEventPatterns on AuthTokenReuseDetectedIntegrationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthTokenReuseDetectedIntegrationEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthTokenReuseDetectedIntegrationEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthTokenReuseDetectedIntegrationEvent value)  $default,){
final _that = this;
switch (_that) {
case _AuthTokenReuseDetectedIntegrationEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthTokenReuseDetectedIntegrationEvent value)?  $default,){
final _that = this;
switch (_that) {
case _AuthTokenReuseDetectedIntegrationEvent() when $default != null:
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
case _AuthTokenReuseDetectedIntegrationEvent() when $default != null:
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
case _AuthTokenReuseDetectedIntegrationEvent():
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
case _AuthTokenReuseDetectedIntegrationEvent() when $default != null:
return $default(_that.userId,_that.sessionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthTokenReuseDetectedIntegrationEvent extends AuthTokenReuseDetectedIntegrationEvent {
   _AuthTokenReuseDetectedIntegrationEvent({required this.userId, required this.sessionId}): super._();
  factory _AuthTokenReuseDetectedIntegrationEvent.fromJson(Map<String, dynamic> json) => _$AuthTokenReuseDetectedIntegrationEventFromJson(json);

@override final  String userId;
@override final  String sessionId;

/// Create a copy of AuthTokenReuseDetectedIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthTokenReuseDetectedIntegrationEventCopyWith<_AuthTokenReuseDetectedIntegrationEvent> get copyWith => __$AuthTokenReuseDetectedIntegrationEventCopyWithImpl<_AuthTokenReuseDetectedIntegrationEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthTokenReuseDetectedIntegrationEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthTokenReuseDetectedIntegrationEvent&&super == other&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,userId,sessionId);

@override
String toString() {
  return 'AuthTokenReuseDetectedIntegrationEvent(userId: $userId, sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class _$AuthTokenReuseDetectedIntegrationEventCopyWith<$Res> implements $AuthTokenReuseDetectedIntegrationEventCopyWith<$Res> {
  factory _$AuthTokenReuseDetectedIntegrationEventCopyWith(_AuthTokenReuseDetectedIntegrationEvent value, $Res Function(_AuthTokenReuseDetectedIntegrationEvent) _then) = __$AuthTokenReuseDetectedIntegrationEventCopyWithImpl;
@override @useResult
$Res call({
 String userId, String sessionId
});




}
/// @nodoc
class __$AuthTokenReuseDetectedIntegrationEventCopyWithImpl<$Res>
    implements _$AuthTokenReuseDetectedIntegrationEventCopyWith<$Res> {
  __$AuthTokenReuseDetectedIntegrationEventCopyWithImpl(this._self, this._then);

  final _AuthTokenReuseDetectedIntegrationEvent _self;
  final $Res Function(_AuthTokenReuseDetectedIntegrationEvent) _then;

/// Create a copy of AuthTokenReuseDetectedIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? sessionId = null,}) {
  return _then(_AuthTokenReuseDetectedIntegrationEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UserLoggedOutIntegrationEvent {

 String get userId; String get sessionId;
/// Create a copy of UserLoggedOutIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserLoggedOutIntegrationEventCopyWith<UserLoggedOutIntegrationEvent> get copyWith => _$UserLoggedOutIntegrationEventCopyWithImpl<UserLoggedOutIntegrationEvent>(this as UserLoggedOutIntegrationEvent, _$identity);

  /// Serializes this UserLoggedOutIntegrationEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLoggedOutIntegrationEvent&&super == other&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,userId,sessionId);

@override
String toString() {
  return 'UserLoggedOutIntegrationEvent(userId: $userId, sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $UserLoggedOutIntegrationEventCopyWith<$Res>  {
  factory $UserLoggedOutIntegrationEventCopyWith(UserLoggedOutIntegrationEvent value, $Res Function(UserLoggedOutIntegrationEvent) _then) = _$UserLoggedOutIntegrationEventCopyWithImpl;
@useResult
$Res call({
 String userId, String sessionId
});




}
/// @nodoc
class _$UserLoggedOutIntegrationEventCopyWithImpl<$Res>
    implements $UserLoggedOutIntegrationEventCopyWith<$Res> {
  _$UserLoggedOutIntegrationEventCopyWithImpl(this._self, this._then);

  final UserLoggedOutIntegrationEvent _self;
  final $Res Function(UserLoggedOutIntegrationEvent) _then;

/// Create a copy of UserLoggedOutIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? sessionId = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserLoggedOutIntegrationEvent].
extension UserLoggedOutIntegrationEventPatterns on UserLoggedOutIntegrationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserLoggedOutIntegrationEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserLoggedOutIntegrationEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserLoggedOutIntegrationEvent value)  $default,){
final _that = this;
switch (_that) {
case _UserLoggedOutIntegrationEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserLoggedOutIntegrationEvent value)?  $default,){
final _that = this;
switch (_that) {
case _UserLoggedOutIntegrationEvent() when $default != null:
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
case _UserLoggedOutIntegrationEvent() when $default != null:
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
case _UserLoggedOutIntegrationEvent():
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
case _UserLoggedOutIntegrationEvent() when $default != null:
return $default(_that.userId,_that.sessionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserLoggedOutIntegrationEvent extends UserLoggedOutIntegrationEvent {
   _UserLoggedOutIntegrationEvent({required this.userId, required this.sessionId}): super._();
  factory _UserLoggedOutIntegrationEvent.fromJson(Map<String, dynamic> json) => _$UserLoggedOutIntegrationEventFromJson(json);

@override final  String userId;
@override final  String sessionId;

/// Create a copy of UserLoggedOutIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserLoggedOutIntegrationEventCopyWith<_UserLoggedOutIntegrationEvent> get copyWith => __$UserLoggedOutIntegrationEventCopyWithImpl<_UserLoggedOutIntegrationEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserLoggedOutIntegrationEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserLoggedOutIntegrationEvent&&super == other&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,userId,sessionId);

@override
String toString() {
  return 'UserLoggedOutIntegrationEvent(userId: $userId, sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class _$UserLoggedOutIntegrationEventCopyWith<$Res> implements $UserLoggedOutIntegrationEventCopyWith<$Res> {
  factory _$UserLoggedOutIntegrationEventCopyWith(_UserLoggedOutIntegrationEvent value, $Res Function(_UserLoggedOutIntegrationEvent) _then) = __$UserLoggedOutIntegrationEventCopyWithImpl;
@override @useResult
$Res call({
 String userId, String sessionId
});




}
/// @nodoc
class __$UserLoggedOutIntegrationEventCopyWithImpl<$Res>
    implements _$UserLoggedOutIntegrationEventCopyWith<$Res> {
  __$UserLoggedOutIntegrationEventCopyWithImpl(this._self, this._then);

  final _UserLoggedOutIntegrationEvent _self;
  final $Res Function(_UserLoggedOutIntegrationEvent) _then;

/// Create a copy of UserLoggedOutIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? sessionId = null,}) {
  return _then(_UserLoggedOutIntegrationEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UserPasswordResetIntegrationEvent {

 String get userId; String get codeId; List<String> get terminatedSessionIds;
/// Create a copy of UserPasswordResetIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPasswordResetIntegrationEventCopyWith<UserPasswordResetIntegrationEvent> get copyWith => _$UserPasswordResetIntegrationEventCopyWithImpl<UserPasswordResetIntegrationEvent>(this as UserPasswordResetIntegrationEvent, _$identity);

  /// Serializes this UserPasswordResetIntegrationEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPasswordResetIntegrationEvent&&super == other&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.codeId, codeId) || other.codeId == codeId)&&const DeepCollectionEquality().equals(other.terminatedSessionIds, terminatedSessionIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,userId,codeId,const DeepCollectionEquality().hash(terminatedSessionIds));

@override
String toString() {
  return 'UserPasswordResetIntegrationEvent(userId: $userId, codeId: $codeId, terminatedSessionIds: $terminatedSessionIds)';
}


}

/// @nodoc
abstract mixin class $UserPasswordResetIntegrationEventCopyWith<$Res>  {
  factory $UserPasswordResetIntegrationEventCopyWith(UserPasswordResetIntegrationEvent value, $Res Function(UserPasswordResetIntegrationEvent) _then) = _$UserPasswordResetIntegrationEventCopyWithImpl;
@useResult
$Res call({
 String userId, String codeId, List<String> terminatedSessionIds
});




}
/// @nodoc
class _$UserPasswordResetIntegrationEventCopyWithImpl<$Res>
    implements $UserPasswordResetIntegrationEventCopyWith<$Res> {
  _$UserPasswordResetIntegrationEventCopyWithImpl(this._self, this._then);

  final UserPasswordResetIntegrationEvent _self;
  final $Res Function(UserPasswordResetIntegrationEvent) _then;

/// Create a copy of UserPasswordResetIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? codeId = null,Object? terminatedSessionIds = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,codeId: null == codeId ? _self.codeId : codeId // ignore: cast_nullable_to_non_nullable
as String,terminatedSessionIds: null == terminatedSessionIds ? _self.terminatedSessionIds : terminatedSessionIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserPasswordResetIntegrationEvent].
extension UserPasswordResetIntegrationEventPatterns on UserPasswordResetIntegrationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPasswordResetIntegrationEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPasswordResetIntegrationEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPasswordResetIntegrationEvent value)  $default,){
final _that = this;
switch (_that) {
case _UserPasswordResetIntegrationEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPasswordResetIntegrationEvent value)?  $default,){
final _that = this;
switch (_that) {
case _UserPasswordResetIntegrationEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String codeId,  List<String> terminatedSessionIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserPasswordResetIntegrationEvent() when $default != null:
return $default(_that.userId,_that.codeId,_that.terminatedSessionIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String codeId,  List<String> terminatedSessionIds)  $default,) {final _that = this;
switch (_that) {
case _UserPasswordResetIntegrationEvent():
return $default(_that.userId,_that.codeId,_that.terminatedSessionIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String codeId,  List<String> terminatedSessionIds)?  $default,) {final _that = this;
switch (_that) {
case _UserPasswordResetIntegrationEvent() when $default != null:
return $default(_that.userId,_that.codeId,_that.terminatedSessionIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserPasswordResetIntegrationEvent extends UserPasswordResetIntegrationEvent {
   _UserPasswordResetIntegrationEvent({required this.userId, required this.codeId, required final  List<String> terminatedSessionIds}): _terminatedSessionIds = terminatedSessionIds,super._();
  factory _UserPasswordResetIntegrationEvent.fromJson(Map<String, dynamic> json) => _$UserPasswordResetIntegrationEventFromJson(json);

@override final  String userId;
@override final  String codeId;
 final  List<String> _terminatedSessionIds;
@override List<String> get terminatedSessionIds {
  if (_terminatedSessionIds is EqualUnmodifiableListView) return _terminatedSessionIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_terminatedSessionIds);
}


/// Create a copy of UserPasswordResetIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPasswordResetIntegrationEventCopyWith<_UserPasswordResetIntegrationEvent> get copyWith => __$UserPasswordResetIntegrationEventCopyWithImpl<_UserPasswordResetIntegrationEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserPasswordResetIntegrationEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPasswordResetIntegrationEvent&&super == other&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.codeId, codeId) || other.codeId == codeId)&&const DeepCollectionEquality().equals(other._terminatedSessionIds, _terminatedSessionIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,userId,codeId,const DeepCollectionEquality().hash(_terminatedSessionIds));

@override
String toString() {
  return 'UserPasswordResetIntegrationEvent(userId: $userId, codeId: $codeId, terminatedSessionIds: $terminatedSessionIds)';
}


}

/// @nodoc
abstract mixin class _$UserPasswordResetIntegrationEventCopyWith<$Res> implements $UserPasswordResetIntegrationEventCopyWith<$Res> {
  factory _$UserPasswordResetIntegrationEventCopyWith(_UserPasswordResetIntegrationEvent value, $Res Function(_UserPasswordResetIntegrationEvent) _then) = __$UserPasswordResetIntegrationEventCopyWithImpl;
@override @useResult
$Res call({
 String userId, String codeId, List<String> terminatedSessionIds
});




}
/// @nodoc
class __$UserPasswordResetIntegrationEventCopyWithImpl<$Res>
    implements _$UserPasswordResetIntegrationEventCopyWith<$Res> {
  __$UserPasswordResetIntegrationEventCopyWithImpl(this._self, this._then);

  final _UserPasswordResetIntegrationEvent _self;
  final $Res Function(_UserPasswordResetIntegrationEvent) _then;

/// Create a copy of UserPasswordResetIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? codeId = null,Object? terminatedSessionIds = null,}) {
  return _then(_UserPasswordResetIntegrationEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,codeId: null == codeId ? _self.codeId : codeId // ignore: cast_nullable_to_non_nullable
as String,terminatedSessionIds: null == terminatedSessionIds ? _self._terminatedSessionIds : terminatedSessionIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$PasswordResetFailedIntegrationEvent {

 String get userId; String get codeId; int get attempts;
/// Create a copy of PasswordResetFailedIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordResetFailedIntegrationEventCopyWith<PasswordResetFailedIntegrationEvent> get copyWith => _$PasswordResetFailedIntegrationEventCopyWithImpl<PasswordResetFailedIntegrationEvent>(this as PasswordResetFailedIntegrationEvent, _$identity);

  /// Serializes this PasswordResetFailedIntegrationEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordResetFailedIntegrationEvent&&super == other&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.codeId, codeId) || other.codeId == codeId)&&(identical(other.attempts, attempts) || other.attempts == attempts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,userId,codeId,attempts);

@override
String toString() {
  return 'PasswordResetFailedIntegrationEvent(userId: $userId, codeId: $codeId, attempts: $attempts)';
}


}

/// @nodoc
abstract mixin class $PasswordResetFailedIntegrationEventCopyWith<$Res>  {
  factory $PasswordResetFailedIntegrationEventCopyWith(PasswordResetFailedIntegrationEvent value, $Res Function(PasswordResetFailedIntegrationEvent) _then) = _$PasswordResetFailedIntegrationEventCopyWithImpl;
@useResult
$Res call({
 String userId, String codeId, int attempts
});




}
/// @nodoc
class _$PasswordResetFailedIntegrationEventCopyWithImpl<$Res>
    implements $PasswordResetFailedIntegrationEventCopyWith<$Res> {
  _$PasswordResetFailedIntegrationEventCopyWithImpl(this._self, this._then);

  final PasswordResetFailedIntegrationEvent _self;
  final $Res Function(PasswordResetFailedIntegrationEvent) _then;

/// Create a copy of PasswordResetFailedIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? codeId = null,Object? attempts = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,codeId: null == codeId ? _self.codeId : codeId // ignore: cast_nullable_to_non_nullable
as String,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PasswordResetFailedIntegrationEvent].
extension PasswordResetFailedIntegrationEventPatterns on PasswordResetFailedIntegrationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PasswordResetFailedIntegrationEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PasswordResetFailedIntegrationEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PasswordResetFailedIntegrationEvent value)  $default,){
final _that = this;
switch (_that) {
case _PasswordResetFailedIntegrationEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PasswordResetFailedIntegrationEvent value)?  $default,){
final _that = this;
switch (_that) {
case _PasswordResetFailedIntegrationEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String codeId,  int attempts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PasswordResetFailedIntegrationEvent() when $default != null:
return $default(_that.userId,_that.codeId,_that.attempts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String codeId,  int attempts)  $default,) {final _that = this;
switch (_that) {
case _PasswordResetFailedIntegrationEvent():
return $default(_that.userId,_that.codeId,_that.attempts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String codeId,  int attempts)?  $default,) {final _that = this;
switch (_that) {
case _PasswordResetFailedIntegrationEvent() when $default != null:
return $default(_that.userId,_that.codeId,_that.attempts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PasswordResetFailedIntegrationEvent extends PasswordResetFailedIntegrationEvent {
   _PasswordResetFailedIntegrationEvent({required this.userId, required this.codeId, required this.attempts}): super._();
  factory _PasswordResetFailedIntegrationEvent.fromJson(Map<String, dynamic> json) => _$PasswordResetFailedIntegrationEventFromJson(json);

@override final  String userId;
@override final  String codeId;
@override final  int attempts;

/// Create a copy of PasswordResetFailedIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PasswordResetFailedIntegrationEventCopyWith<_PasswordResetFailedIntegrationEvent> get copyWith => __$PasswordResetFailedIntegrationEventCopyWithImpl<_PasswordResetFailedIntegrationEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PasswordResetFailedIntegrationEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasswordResetFailedIntegrationEvent&&super == other&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.codeId, codeId) || other.codeId == codeId)&&(identical(other.attempts, attempts) || other.attempts == attempts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,userId,codeId,attempts);

@override
String toString() {
  return 'PasswordResetFailedIntegrationEvent(userId: $userId, codeId: $codeId, attempts: $attempts)';
}


}

/// @nodoc
abstract mixin class _$PasswordResetFailedIntegrationEventCopyWith<$Res> implements $PasswordResetFailedIntegrationEventCopyWith<$Res> {
  factory _$PasswordResetFailedIntegrationEventCopyWith(_PasswordResetFailedIntegrationEvent value, $Res Function(_PasswordResetFailedIntegrationEvent) _then) = __$PasswordResetFailedIntegrationEventCopyWithImpl;
@override @useResult
$Res call({
 String userId, String codeId, int attempts
});




}
/// @nodoc
class __$PasswordResetFailedIntegrationEventCopyWithImpl<$Res>
    implements _$PasswordResetFailedIntegrationEventCopyWith<$Res> {
  __$PasswordResetFailedIntegrationEventCopyWithImpl(this._self, this._then);

  final _PasswordResetFailedIntegrationEvent _self;
  final $Res Function(_PasswordResetFailedIntegrationEvent) _then;

/// Create a copy of PasswordResetFailedIntegrationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? codeId = null,Object? attempts = null,}) {
  return _then(_PasswordResetFailedIntegrationEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,codeId: null == codeId ? _self.codeId : codeId // ignore: cast_nullable_to_non_nullable
as String,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
