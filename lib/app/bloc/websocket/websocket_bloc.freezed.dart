// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'websocket_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WebsocketEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebsocketEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WebsocketEvent()';
}


}

/// @nodoc
class $WebsocketEventCopyWith<$Res>  {
$WebsocketEventCopyWith(WebsocketEvent _, $Res Function(WebsocketEvent) __);
}


/// @nodoc


class _Connect implements WebsocketEvent {
  const _Connect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Connect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WebsocketEvent.connect()';
}


}




/// @nodoc


class _ChangeState implements WebsocketEvent {
  const _ChangeState({required this.state});
  

 final  WebsocketState state;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeStateCopyWith<_ChangeState> get copyWith => __$ChangeStateCopyWithImpl<_ChangeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeState&&(identical(other.state, state) || other.state == state));
}


@override
int get hashCode => Object.hash(runtimeType,state);

@override
String toString() {
  return 'WebsocketEvent.changeState(state: $state)';
}


}

/// @nodoc
abstract mixin class _$ChangeStateCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$ChangeStateCopyWith(_ChangeState value, $Res Function(_ChangeState) _then) = __$ChangeStateCopyWithImpl;
@useResult
$Res call({
 WebsocketState state
});




}
/// @nodoc
class __$ChangeStateCopyWithImpl<$Res>
    implements _$ChangeStateCopyWith<$Res> {
  __$ChangeStateCopyWithImpl(this._self, this._then);

  final _ChangeState _self;
  final $Res Function(_ChangeState) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? state = null,}) {
  return _then(_ChangeState(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as WebsocketState,
  ));
}


}

/// @nodoc


class _CreatePost implements WebsocketEvent {
  const _CreatePost({required this.body});
  

 final  String body;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePostCopyWith<_CreatePost> get copyWith => __$CreatePostCopyWithImpl<_CreatePost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePost&&(identical(other.body, body) || other.body == body));
}


@override
int get hashCode => Object.hash(runtimeType,body);

@override
String toString() {
  return 'WebsocketEvent.createPost(body: $body)';
}


}

/// @nodoc
abstract mixin class _$CreatePostCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$CreatePostCopyWith(_CreatePost value, $Res Function(_CreatePost) _then) = __$CreatePostCopyWithImpl;
@useResult
$Res call({
 String body
});




}
/// @nodoc
class __$CreatePostCopyWithImpl<$Res>
    implements _$CreatePostCopyWith<$Res> {
  __$CreatePostCopyWithImpl(this._self, this._then);

  final _CreatePost _self;
  final $Res Function(_CreatePost) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? body = null,}) {
  return _then(_CreatePost(
body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UpdatePost implements WebsocketEvent {
  const _UpdatePost({required this.id, required this.body});
  

 final  int id;
 final  String body;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatePostCopyWith<_UpdatePost> get copyWith => __$UpdatePostCopyWithImpl<_UpdatePost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatePost&&(identical(other.id, id) || other.id == id)&&(identical(other.body, body) || other.body == body));
}


@override
int get hashCode => Object.hash(runtimeType,id,body);

@override
String toString() {
  return 'WebsocketEvent.updatePost(id: $id, body: $body)';
}


}

/// @nodoc
abstract mixin class _$UpdatePostCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$UpdatePostCopyWith(_UpdatePost value, $Res Function(_UpdatePost) _then) = __$UpdatePostCopyWithImpl;
@useResult
$Res call({
 int id, String body
});




}
/// @nodoc
class __$UpdatePostCopyWithImpl<$Res>
    implements _$UpdatePostCopyWith<$Res> {
  __$UpdatePostCopyWithImpl(this._self, this._then);

  final _UpdatePost _self;
  final $Res Function(_UpdatePost) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? body = null,}) {
  return _then(_UpdatePost(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LikePost implements WebsocketEvent {
  const _LikePost({required this.post});
  

 final  Post post;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LikePostCopyWith<_LikePost> get copyWith => __$LikePostCopyWithImpl<_LikePost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LikePost&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'WebsocketEvent.likePost(post: $post)';
}


}

/// @nodoc
abstract mixin class _$LikePostCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$LikePostCopyWith(_LikePost value, $Res Function(_LikePost) _then) = __$LikePostCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$LikePostCopyWithImpl<$Res>
    implements _$LikePostCopyWith<$Res> {
  __$LikePostCopyWithImpl(this._self, this._then);

  final _LikePost _self;
  final $Res Function(_LikePost) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(_LikePost(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

/// @nodoc


class _BookmarkPost implements WebsocketEvent {
  const _BookmarkPost({required this.post});
  

 final  Post post;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkPostCopyWith<_BookmarkPost> get copyWith => __$BookmarkPostCopyWithImpl<_BookmarkPost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookmarkPost&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'WebsocketEvent.bookmarkPost(post: $post)';
}


}

/// @nodoc
abstract mixin class _$BookmarkPostCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$BookmarkPostCopyWith(_BookmarkPost value, $Res Function(_BookmarkPost) _then) = __$BookmarkPostCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$BookmarkPostCopyWithImpl<$Res>
    implements _$BookmarkPostCopyWith<$Res> {
  __$BookmarkPostCopyWithImpl(this._self, this._then);

  final _BookmarkPost _self;
  final $Res Function(_BookmarkPost) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(_BookmarkPost(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

/// @nodoc


class _DeletePost implements WebsocketEvent {
  const _DeletePost({required this.post});
  

 final  Post post;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletePostCopyWith<_DeletePost> get copyWith => __$DeletePostCopyWithImpl<_DeletePost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeletePost&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'WebsocketEvent.deletePost(post: $post)';
}


}

/// @nodoc
abstract mixin class _$DeletePostCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$DeletePostCopyWith(_DeletePost value, $Res Function(_DeletePost) _then) = __$DeletePostCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$DeletePostCopyWithImpl<$Res>
    implements _$DeletePostCopyWith<$Res> {
  __$DeletePostCopyWithImpl(this._self, this._then);

  final _DeletePost _self;
  final $Res Function(_DeletePost) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(_DeletePost(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

/// @nodoc


class _ReportPost implements WebsocketEvent {
  const _ReportPost({required this.post});
  

 final  Post post;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportPostCopyWith<_ReportPost> get copyWith => __$ReportPostCopyWithImpl<_ReportPost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportPost&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'WebsocketEvent.reportPost(post: $post)';
}


}

/// @nodoc
abstract mixin class _$ReportPostCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$ReportPostCopyWith(_ReportPost value, $Res Function(_ReportPost) _then) = __$ReportPostCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$ReportPostCopyWithImpl<$Res>
    implements _$ReportPostCopyWith<$Res> {
  __$ReportPostCopyWithImpl(this._self, this._then);

  final _ReportPost _self;
  final $Res Function(_ReportPost) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(_ReportPost(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

/// @nodoc


class _GetReplies implements WebsocketEvent {
  const _GetReplies({required this.post});
  

 final  Post post;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetRepliesCopyWith<_GetReplies> get copyWith => __$GetRepliesCopyWithImpl<_GetReplies>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetReplies&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'WebsocketEvent.getReplies(post: $post)';
}


}

/// @nodoc
abstract mixin class _$GetRepliesCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$GetRepliesCopyWith(_GetReplies value, $Res Function(_GetReplies) _then) = __$GetRepliesCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$GetRepliesCopyWithImpl<$Res>
    implements _$GetRepliesCopyWith<$Res> {
  __$GetRepliesCopyWithImpl(this._self, this._then);

  final _GetReplies _self;
  final $Res Function(_GetReplies) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(_GetReplies(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

/// @nodoc


class _LoadProfile implements WebsocketEvent {
  const _LoadProfile({required this.user});
  

 final  User user;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadProfileCopyWith<_LoadProfile> get copyWith => __$LoadProfileCopyWithImpl<_LoadProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadProfile&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'WebsocketEvent.loadProfile(user: $user)';
}


}

/// @nodoc
abstract mixin class _$LoadProfileCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$LoadProfileCopyWith(_LoadProfile value, $Res Function(_LoadProfile) _then) = __$LoadProfileCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$LoadProfileCopyWithImpl<$Res>
    implements _$LoadProfileCopyWith<$Res> {
  __$LoadProfileCopyWithImpl(this._self, this._then);

  final _LoadProfile _self;
  final $Res Function(_LoadProfile) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_LoadProfile(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _LoadBookmarks implements WebsocketEvent {
  const _LoadBookmarks({required this.user});
  

 final  User user;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadBookmarksCopyWith<_LoadBookmarks> get copyWith => __$LoadBookmarksCopyWithImpl<_LoadBookmarks>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadBookmarks&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'WebsocketEvent.loadBookmarks(user: $user)';
}


}

/// @nodoc
abstract mixin class _$LoadBookmarksCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$LoadBookmarksCopyWith(_LoadBookmarks value, $Res Function(_LoadBookmarks) _then) = __$LoadBookmarksCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$LoadBookmarksCopyWithImpl<$Res>
    implements _$LoadBookmarksCopyWith<$Res> {
  __$LoadBookmarksCopyWithImpl(this._self, this._then);

  final _LoadBookmarks _self;
  final $Res Function(_LoadBookmarks) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_LoadBookmarks(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of WebsocketEvent
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
