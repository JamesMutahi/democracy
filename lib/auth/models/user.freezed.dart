// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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

 int get id;@JsonKey(name: 'first_name') String get firstName;@JsonKey(name: 'last_name') String get lastName; String get email; String get image; String get status; List<int> get muted; List<int> get blocked; int get following; int get followers;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'date_joined') DateTime get dateJoined;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.image, image) || other.image == image)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.muted, muted)&&const DeepCollectionEquality().equals(other.blocked, blocked)&&(identical(other.following, following) || other.following == following)&&(identical(other.followers, followers) || other.followers == followers)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.dateJoined, dateJoined) || other.dateJoined == dateJoined));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,email,image,status,const DeepCollectionEquality().hash(muted),const DeepCollectionEquality().hash(blocked),following,followers,isActive,dateJoined);

@override
String toString() {
  return 'User(id: $id, firstName: $firstName, lastName: $lastName, email: $email, image: $image, status: $status, muted: $muted, blocked: $blocked, following: $following, followers: $followers, isActive: $isActive, dateJoined: $dateJoined)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String email, String image, String status, List<int> muted, List<int> blocked, int following, int followers,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'date_joined') DateTime dateJoined
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? email = null,Object? image = null,Object? status = null,Object? muted = null,Object? blocked = null,Object? following = null,Object? followers = null,Object? isActive = null,Object? dateJoined = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,muted: null == muted ? _self.muted : muted // ignore: cast_nullable_to_non_nullable
as List<int>,blocked: null == blocked ? _self.blocked : blocked // ignore: cast_nullable_to_non_nullable
as List<int>,following: null == following ? _self.following : following // ignore: cast_nullable_to_non_nullable
as int,followers: null == followers ? _self.followers : followers // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,dateJoined: null == dateJoined ? _self.dateJoined : dateJoined // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({required this.id, @JsonKey(name: 'first_name') required this.firstName, @JsonKey(name: 'last_name') required this.lastName, required this.email, required this.image, required this.status, required final  List<int> muted, required final  List<int> blocked, required this.following, required this.followers, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'date_joined') required this.dateJoined}): _muted = muted,_blocked = blocked;
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  int id;
@override@JsonKey(name: 'first_name') final  String firstName;
@override@JsonKey(name: 'last_name') final  String lastName;
@override final  String email;
@override final  String image;
@override final  String status;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.image, image) || other.image == image)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._muted, _muted)&&const DeepCollectionEquality().equals(other._blocked, _blocked)&&(identical(other.following, following) || other.following == following)&&(identical(other.followers, followers) || other.followers == followers)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.dateJoined, dateJoined) || other.dateJoined == dateJoined));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,email,image,status,const DeepCollectionEquality().hash(_muted),const DeepCollectionEquality().hash(_blocked),following,followers,isActive,dateJoined);

@override
String toString() {
  return 'User(id: $id, firstName: $firstName, lastName: $lastName, email: $email, image: $image, status: $status, muted: $muted, blocked: $blocked, following: $following, followers: $followers, isActive: $isActive, dateJoined: $dateJoined)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String email, String image, String status, List<int> muted, List<int> blocked, int following, int followers,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'date_joined') DateTime dateJoined
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? email = null,Object? image = null,Object? status = null,Object? muted = null,Object? blocked = null,Object? following = null,Object? followers = null,Object? isActive = null,Object? dateJoined = null,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,muted: null == muted ? _self._muted : muted // ignore: cast_nullable_to_non_nullable
as List<int>,blocked: null == blocked ? _self._blocked : blocked // ignore: cast_nullable_to_non_nullable
as List<int>,following: null == following ? _self.following : following // ignore: cast_nullable_to_non_nullable
as int,followers: null == followers ? _self.followers : followers // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,dateJoined: null == dateJoined ? _self.dateJoined : dateJoined // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
