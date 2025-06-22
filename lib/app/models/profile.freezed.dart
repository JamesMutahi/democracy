// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Profile {

 int get id; List<Post> get posts; List<Post> get replies;@JsonKey(name: 'liked_posts') List<Post> get likedPosts; List<User> get following; List<User> get followers;
/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileCopyWith<Profile> get copyWith => _$ProfileCopyWithImpl<Profile>(this as Profile, _$identity);

  /// Serializes this Profile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Profile&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.posts, posts)&&const DeepCollectionEquality().equals(other.replies, replies)&&const DeepCollectionEquality().equals(other.likedPosts, likedPosts)&&const DeepCollectionEquality().equals(other.following, following)&&const DeepCollectionEquality().equals(other.followers, followers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(posts),const DeepCollectionEquality().hash(replies),const DeepCollectionEquality().hash(likedPosts),const DeepCollectionEquality().hash(following),const DeepCollectionEquality().hash(followers));

@override
String toString() {
  return 'Profile(id: $id, posts: $posts, replies: $replies, likedPosts: $likedPosts, following: $following, followers: $followers)';
}


}

/// @nodoc
abstract mixin class $ProfileCopyWith<$Res>  {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) _then) = _$ProfileCopyWithImpl;
@useResult
$Res call({
 int id, List<Post> posts, List<Post> replies,@JsonKey(name: 'liked_posts') List<Post> likedPosts, List<User> following, List<User> followers
});




}
/// @nodoc
class _$ProfileCopyWithImpl<$Res>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._self, this._then);

  final Profile _self;
  final $Res Function(Profile) _then;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? posts = null,Object? replies = null,Object? likedPosts = null,Object? following = null,Object? followers = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,replies: null == replies ? _self.replies : replies // ignore: cast_nullable_to_non_nullable
as List<Post>,likedPosts: null == likedPosts ? _self.likedPosts : likedPosts // ignore: cast_nullable_to_non_nullable
as List<Post>,following: null == following ? _self.following : following // ignore: cast_nullable_to_non_nullable
as List<User>,followers: null == followers ? _self.followers : followers // ignore: cast_nullable_to_non_nullable
as List<User>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Profile implements Profile {
  const _Profile({required this.id, required final  List<Post> posts, required final  List<Post> replies, @JsonKey(name: 'liked_posts') required final  List<Post> likedPosts, required final  List<User> following, required final  List<User> followers}): _posts = posts,_replies = replies,_likedPosts = likedPosts,_following = following,_followers = followers;
  factory _Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

@override final  int id;
 final  List<Post> _posts;
@override List<Post> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}

 final  List<Post> _replies;
@override List<Post> get replies {
  if (_replies is EqualUnmodifiableListView) return _replies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_replies);
}

 final  List<Post> _likedPosts;
@override@JsonKey(name: 'liked_posts') List<Post> get likedPosts {
  if (_likedPosts is EqualUnmodifiableListView) return _likedPosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_likedPosts);
}

 final  List<User> _following;
@override List<User> get following {
  if (_following is EqualUnmodifiableListView) return _following;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_following);
}

 final  List<User> _followers;
@override List<User> get followers {
  if (_followers is EqualUnmodifiableListView) return _followers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_followers);
}


/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileCopyWith<_Profile> get copyWith => __$ProfileCopyWithImpl<_Profile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Profile&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._posts, _posts)&&const DeepCollectionEquality().equals(other._replies, _replies)&&const DeepCollectionEquality().equals(other._likedPosts, _likedPosts)&&const DeepCollectionEquality().equals(other._following, _following)&&const DeepCollectionEquality().equals(other._followers, _followers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_posts),const DeepCollectionEquality().hash(_replies),const DeepCollectionEquality().hash(_likedPosts),const DeepCollectionEquality().hash(_following),const DeepCollectionEquality().hash(_followers));

@override
String toString() {
  return 'Profile(id: $id, posts: $posts, replies: $replies, likedPosts: $likedPosts, following: $following, followers: $followers)';
}


}

/// @nodoc
abstract mixin class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) _then) = __$ProfileCopyWithImpl;
@override @useResult
$Res call({
 int id, List<Post> posts, List<Post> replies,@JsonKey(name: 'liked_posts') List<Post> likedPosts, List<User> following, List<User> followers
});




}
/// @nodoc
class __$ProfileCopyWithImpl<$Res>
    implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(this._self, this._then);

  final _Profile _self;
  final $Res Function(_Profile) _then;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? posts = null,Object? replies = null,Object? likedPosts = null,Object? following = null,Object? followers = null,}) {
  return _then(_Profile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,replies: null == replies ? _self._replies : replies // ignore: cast_nullable_to_non_nullable
as List<Post>,likedPosts: null == likedPosts ? _self._likedPosts : likedPosts // ignore: cast_nullable_to_non_nullable
as List<Post>,following: null == following ? _self._following : following // ignore: cast_nullable_to_non_nullable
as List<User>,followers: null == followers ? _self._followers : followers // ignore: cast_nullable_to_non_nullable
as List<User>,
  ));
}


}

// dart format on
