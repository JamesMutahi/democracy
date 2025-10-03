// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

 int get id; String get username; String get name; String get email; String get image;@JsonKey(name: 'cover_photo') String get coverPhoto; String get bio; List<int> get muted; List<int> get blocked; int get following; int get followers;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'date_joined') DateTime get dateJoined;@JsonKey(name: 'is_muted') bool get isMuted;@JsonKey(name: 'is_blocked') bool get isBlocked;@JsonKey(name: 'has_blocked') bool get hasBlocked;@JsonKey(name: 'is_followed') bool get isFollowed;@JsonKey(name: 'is_notifying') bool get isNotifying;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.image, image) || other.image == image)&&(identical(other.coverPhoto, coverPhoto) || other.coverPhoto == coverPhoto)&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other.muted, muted)&&const DeepCollectionEquality().equals(other.blocked, blocked)&&(identical(other.following, following) || other.following == following)&&(identical(other.followers, followers) || other.followers == followers)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.dateJoined, dateJoined) || other.dateJoined == dateJoined)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted)&&(identical(other.isBlocked, isBlocked) || other.isBlocked == isBlocked)&&(identical(other.hasBlocked, hasBlocked) || other.hasBlocked == hasBlocked)&&(identical(other.isFollowed, isFollowed) || other.isFollowed == isFollowed)&&(identical(other.isNotifying, isNotifying) || other.isNotifying == isNotifying));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,name,email,image,coverPhoto,bio,const DeepCollectionEquality().hash(muted),const DeepCollectionEquality().hash(blocked),following,followers,isActive,dateJoined,isMuted,isBlocked,hasBlocked,isFollowed,isNotifying);

@override
String toString() {
  return 'User(id: $id, username: $username, name: $name, email: $email, image: $image, coverPhoto: $coverPhoto, bio: $bio, muted: $muted, blocked: $blocked, following: $following, followers: $followers, isActive: $isActive, dateJoined: $dateJoined, isMuted: $isMuted, isBlocked: $isBlocked, hasBlocked: $hasBlocked, isFollowed: $isFollowed, isNotifying: $isNotifying)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 int id, String username, String name, String email, String image,@JsonKey(name: 'cover_photo') String coverPhoto, String bio, List<int> muted, List<int> blocked, int following, int followers,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'date_joined') DateTime dateJoined,@JsonKey(name: 'is_muted') bool isMuted,@JsonKey(name: 'is_blocked') bool isBlocked,@JsonKey(name: 'has_blocked') bool hasBlocked,@JsonKey(name: 'is_followed') bool isFollowed,@JsonKey(name: 'is_notifying') bool isNotifying
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? name = null,Object? email = null,Object? image = null,Object? coverPhoto = null,Object? bio = null,Object? muted = null,Object? blocked = null,Object? following = null,Object? followers = null,Object? isActive = null,Object? dateJoined = null,Object? isMuted = null,Object? isBlocked = null,Object? hasBlocked = null,Object? isFollowed = null,Object? isNotifying = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,coverPhoto: null == coverPhoto ? _self.coverPhoto : coverPhoto // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,muted: null == muted ? _self.muted : muted // ignore: cast_nullable_to_non_nullable
as List<int>,blocked: null == blocked ? _self.blocked : blocked // ignore: cast_nullable_to_non_nullable
as List<int>,following: null == following ? _self.following : following // ignore: cast_nullable_to_non_nullable
as int,followers: null == followers ? _self.followers : followers // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,dateJoined: null == dateJoined ? _self.dateJoined : dateJoined // ignore: cast_nullable_to_non_nullable
as DateTime,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as bool,isBlocked: null == isBlocked ? _self.isBlocked : isBlocked // ignore: cast_nullable_to_non_nullable
as bool,hasBlocked: null == hasBlocked ? _self.hasBlocked : hasBlocked // ignore: cast_nullable_to_non_nullable
as bool,isFollowed: null == isFollowed ? _self.isFollowed : isFollowed // ignore: cast_nullable_to_non_nullable
as bool,isNotifying: null == isNotifying ? _self.isNotifying : isNotifying // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String username,  String name,  String email,  String image, @JsonKey(name: 'cover_photo')  String coverPhoto,  String bio,  List<int> muted,  List<int> blocked,  int following,  int followers, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'date_joined')  DateTime dateJoined, @JsonKey(name: 'is_muted')  bool isMuted, @JsonKey(name: 'is_blocked')  bool isBlocked, @JsonKey(name: 'has_blocked')  bool hasBlocked, @JsonKey(name: 'is_followed')  bool isFollowed, @JsonKey(name: 'is_notifying')  bool isNotifying)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.username,_that.name,_that.email,_that.image,_that.coverPhoto,_that.bio,_that.muted,_that.blocked,_that.following,_that.followers,_that.isActive,_that.dateJoined,_that.isMuted,_that.isBlocked,_that.hasBlocked,_that.isFollowed,_that.isNotifying);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String username,  String name,  String email,  String image, @JsonKey(name: 'cover_photo')  String coverPhoto,  String bio,  List<int> muted,  List<int> blocked,  int following,  int followers, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'date_joined')  DateTime dateJoined, @JsonKey(name: 'is_muted')  bool isMuted, @JsonKey(name: 'is_blocked')  bool isBlocked, @JsonKey(name: 'has_blocked')  bool hasBlocked, @JsonKey(name: 'is_followed')  bool isFollowed, @JsonKey(name: 'is_notifying')  bool isNotifying)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.username,_that.name,_that.email,_that.image,_that.coverPhoto,_that.bio,_that.muted,_that.blocked,_that.following,_that.followers,_that.isActive,_that.dateJoined,_that.isMuted,_that.isBlocked,_that.hasBlocked,_that.isFollowed,_that.isNotifying);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String username,  String name,  String email,  String image, @JsonKey(name: 'cover_photo')  String coverPhoto,  String bio,  List<int> muted,  List<int> blocked,  int following,  int followers, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'date_joined')  DateTime dateJoined, @JsonKey(name: 'is_muted')  bool isMuted, @JsonKey(name: 'is_blocked')  bool isBlocked, @JsonKey(name: 'has_blocked')  bool hasBlocked, @JsonKey(name: 'is_followed')  bool isFollowed, @JsonKey(name: 'is_notifying')  bool isNotifying)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.username,_that.name,_that.email,_that.image,_that.coverPhoto,_that.bio,_that.muted,_that.blocked,_that.following,_that.followers,_that.isActive,_that.dateJoined,_that.isMuted,_that.isBlocked,_that.hasBlocked,_that.isFollowed,_that.isNotifying);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({required this.id, required this.username, required this.name, required this.email, required this.image, @JsonKey(name: 'cover_photo') required this.coverPhoto, required this.bio, required final  List<int> muted, required final  List<int> blocked, required this.following, required this.followers, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'date_joined') required this.dateJoined, @JsonKey(name: 'is_muted') required this.isMuted, @JsonKey(name: 'is_blocked') required this.isBlocked, @JsonKey(name: 'has_blocked') required this.hasBlocked, @JsonKey(name: 'is_followed') required this.isFollowed, @JsonKey(name: 'is_notifying') required this.isNotifying}): _muted = muted,_blocked = blocked;
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  int id;
@override final  String username;
@override final  String name;
@override final  String email;
@override final  String image;
@override@JsonKey(name: 'cover_photo') final  String coverPhoto;
@override final  String bio;
 final  List<int> _muted;
@override List<int> get muted {
  if (_muted is EqualUnmodifiableListView) return _muted;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_muted);
}

 final  List<int> _blocked;
@override List<int> get blocked {
  if (_blocked is EqualUnmodifiableListView) return _blocked;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_blocked);
}

@override final  int following;
@override final  int followers;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'date_joined') final  DateTime dateJoined;
@override@JsonKey(name: 'is_muted') final  bool isMuted;
@override@JsonKey(name: 'is_blocked') final  bool isBlocked;
@override@JsonKey(name: 'has_blocked') final  bool hasBlocked;
@override@JsonKey(name: 'is_followed') final  bool isFollowed;
@override@JsonKey(name: 'is_notifying') final  bool isNotifying;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.image, image) || other.image == image)&&(identical(other.coverPhoto, coverPhoto) || other.coverPhoto == coverPhoto)&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other._muted, _muted)&&const DeepCollectionEquality().equals(other._blocked, _blocked)&&(identical(other.following, following) || other.following == following)&&(identical(other.followers, followers) || other.followers == followers)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.dateJoined, dateJoined) || other.dateJoined == dateJoined)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted)&&(identical(other.isBlocked, isBlocked) || other.isBlocked == isBlocked)&&(identical(other.hasBlocked, hasBlocked) || other.hasBlocked == hasBlocked)&&(identical(other.isFollowed, isFollowed) || other.isFollowed == isFollowed)&&(identical(other.isNotifying, isNotifying) || other.isNotifying == isNotifying));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,name,email,image,coverPhoto,bio,const DeepCollectionEquality().hash(_muted),const DeepCollectionEquality().hash(_blocked),following,followers,isActive,dateJoined,isMuted,isBlocked,hasBlocked,isFollowed,isNotifying);

@override
String toString() {
  return 'User(id: $id, username: $username, name: $name, email: $email, image: $image, coverPhoto: $coverPhoto, bio: $bio, muted: $muted, blocked: $blocked, following: $following, followers: $followers, isActive: $isActive, dateJoined: $dateJoined, isMuted: $isMuted, isBlocked: $isBlocked, hasBlocked: $hasBlocked, isFollowed: $isFollowed, isNotifying: $isNotifying)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 int id, String username, String name, String email, String image,@JsonKey(name: 'cover_photo') String coverPhoto, String bio, List<int> muted, List<int> blocked, int following, int followers,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'date_joined') DateTime dateJoined,@JsonKey(name: 'is_muted') bool isMuted,@JsonKey(name: 'is_blocked') bool isBlocked,@JsonKey(name: 'has_blocked') bool hasBlocked,@JsonKey(name: 'is_followed') bool isFollowed,@JsonKey(name: 'is_notifying') bool isNotifying
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? name = null,Object? email = null,Object? image = null,Object? coverPhoto = null,Object? bio = null,Object? muted = null,Object? blocked = null,Object? following = null,Object? followers = null,Object? isActive = null,Object? dateJoined = null,Object? isMuted = null,Object? isBlocked = null,Object? hasBlocked = null,Object? isFollowed = null,Object? isNotifying = null,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,coverPhoto: null == coverPhoto ? _self.coverPhoto : coverPhoto // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,muted: null == muted ? _self._muted : muted // ignore: cast_nullable_to_non_nullable
as List<int>,blocked: null == blocked ? _self._blocked : blocked // ignore: cast_nullable_to_non_nullable
as List<int>,following: null == following ? _self.following : following // ignore: cast_nullable_to_non_nullable
as int,followers: null == followers ? _self.followers : followers // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,dateJoined: null == dateJoined ? _self.dateJoined : dateJoined // ignore: cast_nullable_to_non_nullable
as DateTime,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as bool,isBlocked: null == isBlocked ? _self.isBlocked : isBlocked // ignore: cast_nullable_to_non_nullable
as bool,hasBlocked: null == hasBlocked ? _self.hasBlocked : hasBlocked // ignore: cast_nullable_to_non_nullable
as bool,isFollowed: null == isFollowed ? _self.isFollowed : isFollowed // ignore: cast_nullable_to_non_nullable
as bool,isNotifying: null == isNotifying ? _self.isNotifying : isNotifying // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
