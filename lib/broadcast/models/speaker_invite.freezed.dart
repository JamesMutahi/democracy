// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'speaker_invite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SpeakerInvite {

 int get id;@JsonKey(name: 'broadcast') int get broadcastId;@JsonKey(name: 'user') int get userId;@SpeakerRoleConverter() SpeakerRole get role;@JsonKey(name: 'is_accepted') bool? get isAccepted;
/// Create a copy of SpeakerInvite
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeakerInviteCopyWith<SpeakerInvite> get copyWith => _$SpeakerInviteCopyWithImpl<SpeakerInvite>(this as SpeakerInvite, _$identity);

  /// Serializes this SpeakerInvite to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeakerInvite&&(identical(other.id, id) || other.id == id)&&(identical(other.broadcastId, broadcastId) || other.broadcastId == broadcastId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.role, role) || other.role == role)&&(identical(other.isAccepted, isAccepted) || other.isAccepted == isAccepted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,broadcastId,userId,role,isAccepted);

@override
String toString() {
  return 'SpeakerInvite(id: $id, broadcastId: $broadcastId, userId: $userId, role: $role, isAccepted: $isAccepted)';
}


}

/// @nodoc
abstract mixin class $SpeakerInviteCopyWith<$Res>  {
  factory $SpeakerInviteCopyWith(SpeakerInvite value, $Res Function(SpeakerInvite) _then) = _$SpeakerInviteCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'broadcast') int broadcastId,@JsonKey(name: 'user') int userId,@SpeakerRoleConverter() SpeakerRole role,@JsonKey(name: 'is_accepted') bool? isAccepted
});




}
/// @nodoc
class _$SpeakerInviteCopyWithImpl<$Res>
    implements $SpeakerInviteCopyWith<$Res> {
  _$SpeakerInviteCopyWithImpl(this._self, this._then);

  final SpeakerInvite _self;
  final $Res Function(SpeakerInvite) _then;

/// Create a copy of SpeakerInvite
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? broadcastId = null,Object? userId = null,Object? role = null,Object? isAccepted = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,broadcastId: null == broadcastId ? _self.broadcastId : broadcastId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as SpeakerRole,isAccepted: freezed == isAccepted ? _self.isAccepted : isAccepted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [SpeakerInvite].
extension SpeakerInvitePatterns on SpeakerInvite {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpeakerInvite value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpeakerInvite() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpeakerInvite value)  $default,){
final _that = this;
switch (_that) {
case _SpeakerInvite():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpeakerInvite value)?  $default,){
final _that = this;
switch (_that) {
case _SpeakerInvite() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'broadcast')  int broadcastId, @JsonKey(name: 'user')  int userId, @SpeakerRoleConverter()  SpeakerRole role, @JsonKey(name: 'is_accepted')  bool? isAccepted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpeakerInvite() when $default != null:
return $default(_that.id,_that.broadcastId,_that.userId,_that.role,_that.isAccepted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'broadcast')  int broadcastId, @JsonKey(name: 'user')  int userId, @SpeakerRoleConverter()  SpeakerRole role, @JsonKey(name: 'is_accepted')  bool? isAccepted)  $default,) {final _that = this;
switch (_that) {
case _SpeakerInvite():
return $default(_that.id,_that.broadcastId,_that.userId,_that.role,_that.isAccepted);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'broadcast')  int broadcastId, @JsonKey(name: 'user')  int userId, @SpeakerRoleConverter()  SpeakerRole role, @JsonKey(name: 'is_accepted')  bool? isAccepted)?  $default,) {final _that = this;
switch (_that) {
case _SpeakerInvite() when $default != null:
return $default(_that.id,_that.broadcastId,_that.userId,_that.role,_that.isAccepted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpeakerInvite implements SpeakerInvite {
  const _SpeakerInvite({required this.id, @JsonKey(name: 'broadcast') required this.broadcastId, @JsonKey(name: 'user') required this.userId, @SpeakerRoleConverter() required this.role, @JsonKey(name: 'is_accepted') required this.isAccepted});
  factory _SpeakerInvite.fromJson(Map<String, dynamic> json) => _$SpeakerInviteFromJson(json);

@override final  int id;
@override@JsonKey(name: 'broadcast') final  int broadcastId;
@override@JsonKey(name: 'user') final  int userId;
@override@SpeakerRoleConverter() final  SpeakerRole role;
@override@JsonKey(name: 'is_accepted') final  bool? isAccepted;

/// Create a copy of SpeakerInvite
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpeakerInviteCopyWith<_SpeakerInvite> get copyWith => __$SpeakerInviteCopyWithImpl<_SpeakerInvite>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpeakerInviteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpeakerInvite&&(identical(other.id, id) || other.id == id)&&(identical(other.broadcastId, broadcastId) || other.broadcastId == broadcastId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.role, role) || other.role == role)&&(identical(other.isAccepted, isAccepted) || other.isAccepted == isAccepted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,broadcastId,userId,role,isAccepted);

@override
String toString() {
  return 'SpeakerInvite(id: $id, broadcastId: $broadcastId, userId: $userId, role: $role, isAccepted: $isAccepted)';
}


}

/// @nodoc
abstract mixin class _$SpeakerInviteCopyWith<$Res> implements $SpeakerInviteCopyWith<$Res> {
  factory _$SpeakerInviteCopyWith(_SpeakerInvite value, $Res Function(_SpeakerInvite) _then) = __$SpeakerInviteCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'broadcast') int broadcastId,@JsonKey(name: 'user') int userId,@SpeakerRoleConverter() SpeakerRole role,@JsonKey(name: 'is_accepted') bool? isAccepted
});




}
/// @nodoc
class __$SpeakerInviteCopyWithImpl<$Res>
    implements _$SpeakerInviteCopyWith<$Res> {
  __$SpeakerInviteCopyWithImpl(this._self, this._then);

  final _SpeakerInvite _self;
  final $Res Function(_SpeakerInvite) _then;

/// Create a copy of SpeakerInvite
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? broadcastId = null,Object? userId = null,Object? role = null,Object? isAccepted = freezed,}) {
  return _then(_SpeakerInvite(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,broadcastId: null == broadcastId ? _self.broadcastId : broadcastId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as SpeakerRole,isAccepted: freezed == isAccepted ? _self.isAccepted : isAccepted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
