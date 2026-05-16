// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'speaker_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SpeakerRequest {

 int get id; int get meeting; User get user;@JsonKey(name: 'is_approved') bool? get isApproved;
/// Create a copy of SpeakerRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpeakerRequestCopyWith<SpeakerRequest> get copyWith => _$SpeakerRequestCopyWithImpl<SpeakerRequest>(this as SpeakerRequest, _$identity);

  /// Serializes this SpeakerRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpeakerRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.meeting, meeting) || other.meeting == meeting)&&(identical(other.user, user) || other.user == user)&&(identical(other.isApproved, isApproved) || other.isApproved == isApproved));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,meeting,user,isApproved);

@override
String toString() {
  return 'SpeakerRequest(id: $id, meeting: $meeting, user: $user, isApproved: $isApproved)';
}


}

/// @nodoc
abstract mixin class $SpeakerRequestCopyWith<$Res>  {
  factory $SpeakerRequestCopyWith(SpeakerRequest value, $Res Function(SpeakerRequest) _then) = _$SpeakerRequestCopyWithImpl;
@useResult
$Res call({
 int id, int meeting, User user,@JsonKey(name: 'is_approved') bool? isApproved
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$SpeakerRequestCopyWithImpl<$Res>
    implements $SpeakerRequestCopyWith<$Res> {
  _$SpeakerRequestCopyWithImpl(this._self, this._then);

  final SpeakerRequest _self;
  final $Res Function(SpeakerRequest) _then;

/// Create a copy of SpeakerRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? meeting = null,Object? user = null,Object? isApproved = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,meeting: null == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,isApproved: freezed == isApproved ? _self.isApproved : isApproved // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of SpeakerRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [SpeakerRequest].
extension SpeakerRequestPatterns on SpeakerRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpeakerRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpeakerRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpeakerRequest value)  $default,){
final _that = this;
switch (_that) {
case _SpeakerRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpeakerRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SpeakerRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int meeting,  User user, @JsonKey(name: 'is_approved')  bool? isApproved)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpeakerRequest() when $default != null:
return $default(_that.id,_that.meeting,_that.user,_that.isApproved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int meeting,  User user, @JsonKey(name: 'is_approved')  bool? isApproved)  $default,) {final _that = this;
switch (_that) {
case _SpeakerRequest():
return $default(_that.id,_that.meeting,_that.user,_that.isApproved);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int meeting,  User user, @JsonKey(name: 'is_approved')  bool? isApproved)?  $default,) {final _that = this;
switch (_that) {
case _SpeakerRequest() when $default != null:
return $default(_that.id,_that.meeting,_that.user,_that.isApproved);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpeakerRequest implements SpeakerRequest {
  const _SpeakerRequest({required this.id, required this.meeting, required this.user, @JsonKey(name: 'is_approved') required this.isApproved});
  factory _SpeakerRequest.fromJson(Map<String, dynamic> json) => _$SpeakerRequestFromJson(json);

@override final  int id;
@override final  int meeting;
@override final  User user;
@override@JsonKey(name: 'is_approved') final  bool? isApproved;

/// Create a copy of SpeakerRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpeakerRequestCopyWith<_SpeakerRequest> get copyWith => __$SpeakerRequestCopyWithImpl<_SpeakerRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpeakerRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpeakerRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.meeting, meeting) || other.meeting == meeting)&&(identical(other.user, user) || other.user == user)&&(identical(other.isApproved, isApproved) || other.isApproved == isApproved));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,meeting,user,isApproved);

@override
String toString() {
  return 'SpeakerRequest(id: $id, meeting: $meeting, user: $user, isApproved: $isApproved)';
}


}

/// @nodoc
abstract mixin class _$SpeakerRequestCopyWith<$Res> implements $SpeakerRequestCopyWith<$Res> {
  factory _$SpeakerRequestCopyWith(_SpeakerRequest value, $Res Function(_SpeakerRequest) _then) = __$SpeakerRequestCopyWithImpl;
@override @useResult
$Res call({
 int id, int meeting, User user,@JsonKey(name: 'is_approved') bool? isApproved
});


@override $UserCopyWith<$Res> get user;

}
/// @nodoc
class __$SpeakerRequestCopyWithImpl<$Res>
    implements _$SpeakerRequestCopyWith<$Res> {
  __$SpeakerRequestCopyWithImpl(this._self, this._then);

  final _SpeakerRequest _self;
  final $Res Function(_SpeakerRequest) _then;

/// Create a copy of SpeakerRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? meeting = null,Object? user = null,Object? isApproved = freezed,}) {
  return _then(_SpeakerRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,meeting: null == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,isApproved: freezed == isApproved ? _self.isApproved : isApproved // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of SpeakerRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
