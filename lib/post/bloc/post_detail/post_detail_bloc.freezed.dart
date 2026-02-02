// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostDetailState()';
}


}

/// @nodoc
class $PostDetailStateCopyWith<$Res>  {
$PostDetailStateCopyWith(PostDetailState _, $Res Function(PostDetailState) __);
}


/// Adds pattern-matching-related methods to [PostDetailState].
extension PostDetailStatePatterns on PostDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( PostDetailLoading value)?  loading,TResult Function( PostCreated value)?  created,TResult Function( PostLoaded value)?  loaded,TResult Function( PostUpdated value)?  updated,TResult Function( PostDeleted value)?  deleted,TResult Function( PostReported value)?  reported,TResult Function( PostDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case PostDetailLoading() when loading != null:
return loading(_that);case PostCreated() when created != null:
return created(_that);case PostLoaded() when loaded != null:
return loaded(_that);case PostUpdated() when updated != null:
return updated(_that);case PostDeleted() when deleted != null:
return deleted(_that);case PostReported() when reported != null:
return reported(_that);case PostDetailFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( PostDetailLoading value)  loading,required TResult Function( PostCreated value)  created,required TResult Function( PostLoaded value)  loaded,required TResult Function( PostUpdated value)  updated,required TResult Function( PostDeleted value)  deleted,required TResult Function( PostReported value)  reported,required TResult Function( PostDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case PostDetailLoading():
return loading(_that);case PostCreated():
return created(_that);case PostLoaded():
return loaded(_that);case PostUpdated():
return updated(_that);case PostDeleted():
return deleted(_that);case PostReported():
return reported(_that);case PostDetailFailure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( PostDetailLoading value)?  loading,TResult? Function( PostCreated value)?  created,TResult? Function( PostLoaded value)?  loaded,TResult? Function( PostUpdated value)?  updated,TResult? Function( PostDeleted value)?  deleted,TResult? Function( PostReported value)?  reported,TResult? Function( PostDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case PostDetailLoading() when loading != null:
return loading(_that);case PostCreated() when created != null:
return created(_that);case PostLoaded() when loaded != null:
return loaded(_that);case PostUpdated() when updated != null:
return updated(_that);case PostDeleted() when deleted != null:
return deleted(_that);case PostReported() when reported != null:
return reported(_that);case PostDetailFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Post post)?  created,TResult Function( Post post)?  loaded,TResult Function( int postId,  String body,  int likes,  bool isLiked,  int bookmarks,  bool isBookmarked,  int views,  int replies,  int reposts,  String communityNote,  bool isUpvoted,  bool isDownvoted,  int upvotes,  int downvotes,  bool isReposted,  bool isQuoted,  bool isDeleted,  bool isActive)?  updated,TResult Function( int postId)?  deleted,TResult Function()?  reported,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case PostDetailLoading() when loading != null:
return loading();case PostCreated() when created != null:
return created(_that.post);case PostLoaded() when loaded != null:
return loaded(_that.post);case PostUpdated() when updated != null:
return updated(_that.postId,_that.body,_that.likes,_that.isLiked,_that.bookmarks,_that.isBookmarked,_that.views,_that.replies,_that.reposts,_that.communityNote,_that.isUpvoted,_that.isDownvoted,_that.upvotes,_that.downvotes,_that.isReposted,_that.isQuoted,_that.isDeleted,_that.isActive);case PostDeleted() when deleted != null:
return deleted(_that.postId);case PostReported() when reported != null:
return reported();case PostDetailFailure() when failure != null:
return failure(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Post post)  created,required TResult Function( Post post)  loaded,required TResult Function( int postId,  String body,  int likes,  bool isLiked,  int bookmarks,  bool isBookmarked,  int views,  int replies,  int reposts,  String communityNote,  bool isUpvoted,  bool isDownvoted,  int upvotes,  int downvotes,  bool isReposted,  bool isQuoted,  bool isDeleted,  bool isActive)  updated,required TResult Function( int postId)  deleted,required TResult Function()  reported,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case PostDetailLoading():
return loading();case PostCreated():
return created(_that.post);case PostLoaded():
return loaded(_that.post);case PostUpdated():
return updated(_that.postId,_that.body,_that.likes,_that.isLiked,_that.bookmarks,_that.isBookmarked,_that.views,_that.replies,_that.reposts,_that.communityNote,_that.isUpvoted,_that.isDownvoted,_that.upvotes,_that.downvotes,_that.isReposted,_that.isQuoted,_that.isDeleted,_that.isActive);case PostDeleted():
return deleted(_that.postId);case PostReported():
return reported();case PostDetailFailure():
return failure(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Post post)?  created,TResult? Function( Post post)?  loaded,TResult? Function( int postId,  String body,  int likes,  bool isLiked,  int bookmarks,  bool isBookmarked,  int views,  int replies,  int reposts,  String communityNote,  bool isUpvoted,  bool isDownvoted,  int upvotes,  int downvotes,  bool isReposted,  bool isQuoted,  bool isDeleted,  bool isActive)?  updated,TResult? Function( int postId)?  deleted,TResult? Function()?  reported,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case PostDetailLoading() when loading != null:
return loading();case PostCreated() when created != null:
return created(_that.post);case PostLoaded() when loaded != null:
return loaded(_that.post);case PostUpdated() when updated != null:
return updated(_that.postId,_that.body,_that.likes,_that.isLiked,_that.bookmarks,_that.isBookmarked,_that.views,_that.replies,_that.reposts,_that.communityNote,_that.isUpvoted,_that.isDownvoted,_that.upvotes,_that.downvotes,_that.isReposted,_that.isQuoted,_that.isDeleted,_that.isActive);case PostDeleted() when deleted != null:
return deleted(_that.postId);case PostReported() when reported != null:
return reported();case PostDetailFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements PostDetailState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostDetailState.initial()';
}


}




/// @nodoc


class PostDetailLoading implements PostDetailState {
  const PostDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostDetailState.loading()';
}


}




/// @nodoc


class PostCreated implements PostDetailState {
  const PostCreated({required this.post});
  

 final  Post post;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostCreatedCopyWith<PostCreated> get copyWith => _$PostCreatedCopyWithImpl<PostCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostCreated&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'PostDetailState.created(post: $post)';
}


}

/// @nodoc
abstract mixin class $PostCreatedCopyWith<$Res> implements $PostDetailStateCopyWith<$Res> {
  factory $PostCreatedCopyWith(PostCreated value, $Res Function(PostCreated) _then) = _$PostCreatedCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class _$PostCreatedCopyWithImpl<$Res>
    implements $PostCreatedCopyWith<$Res> {
  _$PostCreatedCopyWithImpl(this._self, this._then);

  final PostCreated _self;
  final $Res Function(PostCreated) _then;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(PostCreated(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of PostDetailState
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


class PostLoaded implements PostDetailState {
  const PostLoaded({required this.post});
  

 final  Post post;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostLoadedCopyWith<PostLoaded> get copyWith => _$PostLoadedCopyWithImpl<PostLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostLoaded&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'PostDetailState.loaded(post: $post)';
}


}

/// @nodoc
abstract mixin class $PostLoadedCopyWith<$Res> implements $PostDetailStateCopyWith<$Res> {
  factory $PostLoadedCopyWith(PostLoaded value, $Res Function(PostLoaded) _then) = _$PostLoadedCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class _$PostLoadedCopyWithImpl<$Res>
    implements $PostLoadedCopyWith<$Res> {
  _$PostLoadedCopyWithImpl(this._self, this._then);

  final PostLoaded _self;
  final $Res Function(PostLoaded) _then;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(PostLoaded(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of PostDetailState
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


class PostUpdated implements PostDetailState {
  const PostUpdated({required this.postId, required this.body, required this.likes, required this.isLiked, required this.bookmarks, required this.isBookmarked, required this.views, required this.replies, required this.reposts, required this.communityNote, required this.isUpvoted, required this.isDownvoted, required this.upvotes, required this.downvotes, required this.isReposted, required this.isQuoted, required this.isDeleted, required this.isActive});
  

 final  int postId;
 final  String body;
 final  int likes;
 final  bool isLiked;
 final  int bookmarks;
 final  bool isBookmarked;
 final  int views;
 final  int replies;
 final  int reposts;
 final  String communityNote;
 final  bool isUpvoted;
 final  bool isDownvoted;
 final  int upvotes;
 final  int downvotes;
 final  bool isReposted;
 final  bool isQuoted;
 final  bool isDeleted;
 final  bool isActive;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostUpdatedCopyWith<PostUpdated> get copyWith => _$PostUpdatedCopyWithImpl<PostUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostUpdated&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.body, body) || other.body == body)&&(identical(other.likes, likes) || other.likes == likes)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.bookmarks, bookmarks) || other.bookmarks == bookmarks)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked)&&(identical(other.views, views) || other.views == views)&&(identical(other.replies, replies) || other.replies == replies)&&(identical(other.reposts, reposts) || other.reposts == reposts)&&(identical(other.communityNote, communityNote) || other.communityNote == communityNote)&&(identical(other.isUpvoted, isUpvoted) || other.isUpvoted == isUpvoted)&&(identical(other.isDownvoted, isDownvoted) || other.isDownvoted == isDownvoted)&&(identical(other.upvotes, upvotes) || other.upvotes == upvotes)&&(identical(other.downvotes, downvotes) || other.downvotes == downvotes)&&(identical(other.isReposted, isReposted) || other.isReposted == isReposted)&&(identical(other.isQuoted, isQuoted) || other.isQuoted == isQuoted)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,postId,body,likes,isLiked,bookmarks,isBookmarked,views,replies,reposts,communityNote,isUpvoted,isDownvoted,upvotes,downvotes,isReposted,isQuoted,isDeleted,isActive);

@override
String toString() {
  return 'PostDetailState.updated(postId: $postId, body: $body, likes: $likes, isLiked: $isLiked, bookmarks: $bookmarks, isBookmarked: $isBookmarked, views: $views, replies: $replies, reposts: $reposts, communityNote: $communityNote, isUpvoted: $isUpvoted, isDownvoted: $isDownvoted, upvotes: $upvotes, downvotes: $downvotes, isReposted: $isReposted, isQuoted: $isQuoted, isDeleted: $isDeleted, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $PostUpdatedCopyWith<$Res> implements $PostDetailStateCopyWith<$Res> {
  factory $PostUpdatedCopyWith(PostUpdated value, $Res Function(PostUpdated) _then) = _$PostUpdatedCopyWithImpl;
@useResult
$Res call({
 int postId, String body, int likes, bool isLiked, int bookmarks, bool isBookmarked, int views, int replies, int reposts, String communityNote, bool isUpvoted, bool isDownvoted, int upvotes, int downvotes, bool isReposted, bool isQuoted, bool isDeleted, bool isActive
});




}
/// @nodoc
class _$PostUpdatedCopyWithImpl<$Res>
    implements $PostUpdatedCopyWith<$Res> {
  _$PostUpdatedCopyWithImpl(this._self, this._then);

  final PostUpdated _self;
  final $Res Function(PostUpdated) _then;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? postId = null,Object? body = null,Object? likes = null,Object? isLiked = null,Object? bookmarks = null,Object? isBookmarked = null,Object? views = null,Object? replies = null,Object? reposts = null,Object? communityNote = null,Object? isUpvoted = null,Object? isDownvoted = null,Object? upvotes = null,Object? downvotes = null,Object? isReposted = null,Object? isQuoted = null,Object? isDeleted = null,Object? isActive = null,}) {
  return _then(PostUpdated(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as int,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,likes: null == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as int,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,bookmarks: null == bookmarks ? _self.bookmarks : bookmarks // ignore: cast_nullable_to_non_nullable
as int,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,views: null == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int,replies: null == replies ? _self.replies : replies // ignore: cast_nullable_to_non_nullable
as int,reposts: null == reposts ? _self.reposts : reposts // ignore: cast_nullable_to_non_nullable
as int,communityNote: null == communityNote ? _self.communityNote : communityNote // ignore: cast_nullable_to_non_nullable
as String,isUpvoted: null == isUpvoted ? _self.isUpvoted : isUpvoted // ignore: cast_nullable_to_non_nullable
as bool,isDownvoted: null == isDownvoted ? _self.isDownvoted : isDownvoted // ignore: cast_nullable_to_non_nullable
as bool,upvotes: null == upvotes ? _self.upvotes : upvotes // ignore: cast_nullable_to_non_nullable
as int,downvotes: null == downvotes ? _self.downvotes : downvotes // ignore: cast_nullable_to_non_nullable
as int,isReposted: null == isReposted ? _self.isReposted : isReposted // ignore: cast_nullable_to_non_nullable
as bool,isQuoted: null == isQuoted ? _self.isQuoted : isQuoted // ignore: cast_nullable_to_non_nullable
as bool,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class PostDeleted implements PostDetailState {
  const PostDeleted({required this.postId});
  

 final  int postId;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostDeletedCopyWith<PostDeleted> get copyWith => _$PostDeletedCopyWithImpl<PostDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostDeleted&&(identical(other.postId, postId) || other.postId == postId));
}


@override
int get hashCode => Object.hash(runtimeType,postId);

@override
String toString() {
  return 'PostDetailState.deleted(postId: $postId)';
}


}

/// @nodoc
abstract mixin class $PostDeletedCopyWith<$Res> implements $PostDetailStateCopyWith<$Res> {
  factory $PostDeletedCopyWith(PostDeleted value, $Res Function(PostDeleted) _then) = _$PostDeletedCopyWithImpl;
@useResult
$Res call({
 int postId
});




}
/// @nodoc
class _$PostDeletedCopyWithImpl<$Res>
    implements $PostDeletedCopyWith<$Res> {
  _$PostDeletedCopyWithImpl(this._self, this._then);

  final PostDeleted _self;
  final $Res Function(PostDeleted) _then;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? postId = null,}) {
  return _then(PostDeleted(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class PostReported implements PostDetailState {
  const PostReported();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostReported);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostDetailState.reported()';
}


}




/// @nodoc


class PostDetailFailure implements PostDetailState {
  const PostDetailFailure({required this.error});
  

 final  String error;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostDetailFailureCopyWith<PostDetailFailure> get copyWith => _$PostDetailFailureCopyWithImpl<PostDetailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostDetailFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'PostDetailState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $PostDetailFailureCopyWith<$Res> implements $PostDetailStateCopyWith<$Res> {
  factory $PostDetailFailureCopyWith(PostDetailFailure value, $Res Function(PostDetailFailure) _then) = _$PostDetailFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$PostDetailFailureCopyWithImpl<$Res>
    implements $PostDetailFailureCopyWith<$Res> {
  _$PostDetailFailureCopyWithImpl(this._self, this._then);

  final PostDetailFailure _self;
  final $Res Function(PostDetailFailure) _then;

/// Create a copy of PostDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(PostDetailFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$PostDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostDetailEvent()';
}


}

/// @nodoc
class $PostDetailEventCopyWith<$Res>  {
$PostDetailEventCopyWith(PostDetailEvent _, $Res Function(PostDetailEvent) __);
}


/// Adds pattern-matching-related methods to [PostDetailEvent].
extension PostDetailEventPatterns on PostDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Created value)?  created,TResult Function( _Loaded value)?  loaded,TResult Function( _Updated value)?  updated,TResult Function( _Deleted value)?  deleted,TResult Function( _Reported value)?  reported,TResult Function( _Create value)?  create,TResult Function( _Get value)?  get,TResult Function( _Update value)?  update,TResult Function( _Viewed value)?  viewed,TResult Function( _Like value)?  like,TResult Function( _Bookmark value)?  bookmark,TResult Function( _Upvote value)?  upvote,TResult Function( _Downvote value)?  downvote,TResult Function( _Delete value)?  delete,TResult Function( _DeleteRepost value)?  deleteRepost,TResult Function( _Report value)?  report,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Updated() when updated != null:
return updated(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Reported() when reported != null:
return reported(_that);case _Create() when create != null:
return create(_that);case _Get() when get != null:
return get(_that);case _Update() when update != null:
return update(_that);case _Viewed() when viewed != null:
return viewed(_that);case _Like() when like != null:
return like(_that);case _Bookmark() when bookmark != null:
return bookmark(_that);case _Upvote() when upvote != null:
return upvote(_that);case _Downvote() when downvote != null:
return downvote(_that);case _Delete() when delete != null:
return delete(_that);case _DeleteRepost() when deleteRepost != null:
return deleteRepost(_that);case _Report() when report != null:
return report(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Created value)  created,required TResult Function( _Loaded value)  loaded,required TResult Function( _Updated value)  updated,required TResult Function( _Deleted value)  deleted,required TResult Function( _Reported value)  reported,required TResult Function( _Create value)  create,required TResult Function( _Get value)  get,required TResult Function( _Update value)  update,required TResult Function( _Viewed value)  viewed,required TResult Function( _Like value)  like,required TResult Function( _Bookmark value)  bookmark,required TResult Function( _Upvote value)  upvote,required TResult Function( _Downvote value)  downvote,required TResult Function( _Delete value)  delete,required TResult Function( _DeleteRepost value)  deleteRepost,required TResult Function( _Report value)  report,}){
final _that = this;
switch (_that) {
case _Created():
return created(_that);case _Loaded():
return loaded(_that);case _Updated():
return updated(_that);case _Deleted():
return deleted(_that);case _Reported():
return reported(_that);case _Create():
return create(_that);case _Get():
return get(_that);case _Update():
return update(_that);case _Viewed():
return viewed(_that);case _Like():
return like(_that);case _Bookmark():
return bookmark(_that);case _Upvote():
return upvote(_that);case _Downvote():
return downvote(_that);case _Delete():
return delete(_that);case _DeleteRepost():
return deleteRepost(_that);case _Report():
return report(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Created value)?  created,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Updated value)?  updated,TResult? Function( _Deleted value)?  deleted,TResult? Function( _Reported value)?  reported,TResult? Function( _Create value)?  create,TResult? Function( _Get value)?  get,TResult? Function( _Update value)?  update,TResult? Function( _Viewed value)?  viewed,TResult? Function( _Like value)?  like,TResult? Function( _Bookmark value)?  bookmark,TResult? Function( _Upvote value)?  upvote,TResult? Function( _Downvote value)?  downvote,TResult? Function( _Delete value)?  delete,TResult? Function( _DeleteRepost value)?  deleteRepost,TResult? Function( _Report value)?  report,}){
final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Updated() when updated != null:
return updated(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Reported() when reported != null:
return reported(_that);case _Create() when create != null:
return create(_that);case _Get() when get != null:
return get(_that);case _Update() when update != null:
return update(_that);case _Viewed() when viewed != null:
return viewed(_that);case _Like() when like != null:
return like(_that);case _Bookmark() when bookmark != null:
return bookmark(_that);case _Upvote() when upvote != null:
return upvote(_that);case _Downvote() when downvote != null:
return downvote(_that);case _Delete() when delete != null:
return delete(_that);case _DeleteRepost() when deleteRepost != null:
return deleteRepost(_that);case _Report() when report != null:
return report(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Map<String, dynamic> payload)?  created,TResult Function( Map<String, dynamic> payload)?  loaded,TResult Function( Map<String, dynamic> payload)?  updated,TResult Function( Map<String, dynamic> payload)?  deleted,TResult Function( Map<String, dynamic> payload)?  reported,TResult Function( String body,  PostStatus status,  Post? repostOf,  Post? replyTo,  Post? communityNoteOf,  Ballot? ballot,  Survey? survey,  Petition? petition,  Meeting? meeting,  List<Map> tags)?  create,TResult Function( Post post)?  get,TResult Function( int id,  String body,  PostStatus status,  List<Map> tags)?  update,TResult Function( Post post)?  viewed,TResult Function( Post post)?  like,TResult Function( Post post)?  bookmark,TResult Function( Post post)?  upvote,TResult Function( Post post)?  downvote,TResult Function( Post post)?  delete,TResult Function( Post post)?  deleteRepost,TResult Function( String issue,  Post post)?  report,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that.payload);case _Loaded() when loaded != null:
return loaded(_that.payload);case _Updated() when updated != null:
return updated(_that.payload);case _Deleted() when deleted != null:
return deleted(_that.payload);case _Reported() when reported != null:
return reported(_that.payload);case _Create() when create != null:
return create(_that.body,_that.status,_that.repostOf,_that.replyTo,_that.communityNoteOf,_that.ballot,_that.survey,_that.petition,_that.meeting,_that.tags);case _Get() when get != null:
return get(_that.post);case _Update() when update != null:
return update(_that.id,_that.body,_that.status,_that.tags);case _Viewed() when viewed != null:
return viewed(_that.post);case _Like() when like != null:
return like(_that.post);case _Bookmark() when bookmark != null:
return bookmark(_that.post);case _Upvote() when upvote != null:
return upvote(_that.post);case _Downvote() when downvote != null:
return downvote(_that.post);case _Delete() when delete != null:
return delete(_that.post);case _DeleteRepost() when deleteRepost != null:
return deleteRepost(_that.post);case _Report() when report != null:
return report(_that.issue,_that.post);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Map<String, dynamic> payload)  created,required TResult Function( Map<String, dynamic> payload)  loaded,required TResult Function( Map<String, dynamic> payload)  updated,required TResult Function( Map<String, dynamic> payload)  deleted,required TResult Function( Map<String, dynamic> payload)  reported,required TResult Function( String body,  PostStatus status,  Post? repostOf,  Post? replyTo,  Post? communityNoteOf,  Ballot? ballot,  Survey? survey,  Petition? petition,  Meeting? meeting,  List<Map> tags)  create,required TResult Function( Post post)  get,required TResult Function( int id,  String body,  PostStatus status,  List<Map> tags)  update,required TResult Function( Post post)  viewed,required TResult Function( Post post)  like,required TResult Function( Post post)  bookmark,required TResult Function( Post post)  upvote,required TResult Function( Post post)  downvote,required TResult Function( Post post)  delete,required TResult Function( Post post)  deleteRepost,required TResult Function( String issue,  Post post)  report,}) {final _that = this;
switch (_that) {
case _Created():
return created(_that.payload);case _Loaded():
return loaded(_that.payload);case _Updated():
return updated(_that.payload);case _Deleted():
return deleted(_that.payload);case _Reported():
return reported(_that.payload);case _Create():
return create(_that.body,_that.status,_that.repostOf,_that.replyTo,_that.communityNoteOf,_that.ballot,_that.survey,_that.petition,_that.meeting,_that.tags);case _Get():
return get(_that.post);case _Update():
return update(_that.id,_that.body,_that.status,_that.tags);case _Viewed():
return viewed(_that.post);case _Like():
return like(_that.post);case _Bookmark():
return bookmark(_that.post);case _Upvote():
return upvote(_that.post);case _Downvote():
return downvote(_that.post);case _Delete():
return delete(_that.post);case _DeleteRepost():
return deleteRepost(_that.post);case _Report():
return report(_that.issue,_that.post);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Map<String, dynamic> payload)?  created,TResult? Function( Map<String, dynamic> payload)?  loaded,TResult? Function( Map<String, dynamic> payload)?  updated,TResult? Function( Map<String, dynamic> payload)?  deleted,TResult? Function( Map<String, dynamic> payload)?  reported,TResult? Function( String body,  PostStatus status,  Post? repostOf,  Post? replyTo,  Post? communityNoteOf,  Ballot? ballot,  Survey? survey,  Petition? petition,  Meeting? meeting,  List<Map> tags)?  create,TResult? Function( Post post)?  get,TResult? Function( int id,  String body,  PostStatus status,  List<Map> tags)?  update,TResult? Function( Post post)?  viewed,TResult? Function( Post post)?  like,TResult? Function( Post post)?  bookmark,TResult? Function( Post post)?  upvote,TResult? Function( Post post)?  downvote,TResult? Function( Post post)?  delete,TResult? Function( Post post)?  deleteRepost,TResult? Function( String issue,  Post post)?  report,}) {final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that.payload);case _Loaded() when loaded != null:
return loaded(_that.payload);case _Updated() when updated != null:
return updated(_that.payload);case _Deleted() when deleted != null:
return deleted(_that.payload);case _Reported() when reported != null:
return reported(_that.payload);case _Create() when create != null:
return create(_that.body,_that.status,_that.repostOf,_that.replyTo,_that.communityNoteOf,_that.ballot,_that.survey,_that.petition,_that.meeting,_that.tags);case _Get() when get != null:
return get(_that.post);case _Update() when update != null:
return update(_that.id,_that.body,_that.status,_that.tags);case _Viewed() when viewed != null:
return viewed(_that.post);case _Like() when like != null:
return like(_that.post);case _Bookmark() when bookmark != null:
return bookmark(_that.post);case _Upvote() when upvote != null:
return upvote(_that.post);case _Downvote() when downvote != null:
return downvote(_that.post);case _Delete() when delete != null:
return delete(_that.post);case _DeleteRepost() when deleteRepost != null:
return deleteRepost(_that.post);case _Report() when report != null:
return report(_that.issue,_that.post);case _:
  return null;

}
}

}

/// @nodoc


class _Created implements PostDetailEvent {
  const _Created({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatedCopyWith<_Created> get copyWith => __$CreatedCopyWithImpl<_Created>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Created&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'PostDetailEvent.created(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$CreatedCopyWith<$Res> implements $PostDetailEventCopyWith<$Res> {
  factory _$CreatedCopyWith(_Created value, $Res Function(_Created) _then) = __$CreatedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$CreatedCopyWithImpl<$Res>
    implements _$CreatedCopyWith<$Res> {
  __$CreatedCopyWithImpl(this._self, this._then);

  final _Created _self;
  final $Res Function(_Created) _then;

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Created(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Loaded implements PostDetailEvent {
  const _Loaded({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'PostDetailEvent.loaded(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $PostDetailEventCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Loaded(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Updated implements PostDetailEvent {
  const _Updated({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatedCopyWith<_Updated> get copyWith => __$UpdatedCopyWithImpl<_Updated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Updated&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'PostDetailEvent.updated(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$UpdatedCopyWith<$Res> implements $PostDetailEventCopyWith<$Res> {
  factory _$UpdatedCopyWith(_Updated value, $Res Function(_Updated) _then) = __$UpdatedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$UpdatedCopyWithImpl<$Res>
    implements _$UpdatedCopyWith<$Res> {
  __$UpdatedCopyWithImpl(this._self, this._then);

  final _Updated _self;
  final $Res Function(_Updated) _then;

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Updated(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Deleted implements PostDetailEvent {
  const _Deleted({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletedCopyWith<_Deleted> get copyWith => __$DeletedCopyWithImpl<_Deleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Deleted&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'PostDetailEvent.deleted(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$DeletedCopyWith<$Res> implements $PostDetailEventCopyWith<$Res> {
  factory _$DeletedCopyWith(_Deleted value, $Res Function(_Deleted) _then) = __$DeletedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$DeletedCopyWithImpl<$Res>
    implements _$DeletedCopyWith<$Res> {
  __$DeletedCopyWithImpl(this._self, this._then);

  final _Deleted _self;
  final $Res Function(_Deleted) _then;

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Deleted(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Reported implements PostDetailEvent {
  const _Reported({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportedCopyWith<_Reported> get copyWith => __$ReportedCopyWithImpl<_Reported>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reported&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'PostDetailEvent.reported(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$ReportedCopyWith<$Res> implements $PostDetailEventCopyWith<$Res> {
  factory _$ReportedCopyWith(_Reported value, $Res Function(_Reported) _then) = __$ReportedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$ReportedCopyWithImpl<$Res>
    implements _$ReportedCopyWith<$Res> {
  __$ReportedCopyWithImpl(this._self, this._then);

  final _Reported _self;
  final $Res Function(_Reported) _then;

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Reported(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Create implements PostDetailEvent {
  const _Create({required this.body, required this.status, required this.repostOf, required this.replyTo, required this.communityNoteOf, required this.ballot, required this.survey, required this.petition, required this.meeting, required final  List<Map> tags}): _tags = tags;
  

 final  String body;
 final  PostStatus status;
 final  Post? repostOf;
 final  Post? replyTo;
 final  Post? communityNoteOf;
 final  Ballot? ballot;
 final  Survey? survey;
 final  Petition? petition;
 final  Meeting? meeting;
 final  List<Map> _tags;
 List<Map> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCopyWith<_Create> get copyWith => __$CreateCopyWithImpl<_Create>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Create&&(identical(other.body, body) || other.body == body)&&(identical(other.status, status) || other.status == status)&&(identical(other.repostOf, repostOf) || other.repostOf == repostOf)&&(identical(other.replyTo, replyTo) || other.replyTo == replyTo)&&(identical(other.communityNoteOf, communityNoteOf) || other.communityNoteOf == communityNoteOf)&&(identical(other.ballot, ballot) || other.ballot == ballot)&&(identical(other.survey, survey) || other.survey == survey)&&(identical(other.petition, petition) || other.petition == petition)&&(identical(other.meeting, meeting) || other.meeting == meeting)&&const DeepCollectionEquality().equals(other._tags, _tags));
}


@override
int get hashCode => Object.hash(runtimeType,body,status,repostOf,replyTo,communityNoteOf,ballot,survey,petition,meeting,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'PostDetailEvent.create(body: $body, status: $status, repostOf: $repostOf, replyTo: $replyTo, communityNoteOf: $communityNoteOf, ballot: $ballot, survey: $survey, petition: $petition, meeting: $meeting, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$CreateCopyWith<$Res> implements $PostDetailEventCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) _then) = __$CreateCopyWithImpl;
@useResult
$Res call({
 String body, PostStatus status, Post? repostOf, Post? replyTo, Post? communityNoteOf, Ballot? ballot, Survey? survey, Petition? petition, Meeting? meeting, List<Map> tags
});


$PostCopyWith<$Res>? get repostOf;$PostCopyWith<$Res>? get replyTo;$PostCopyWith<$Res>? get communityNoteOf;$BallotCopyWith<$Res>? get ballot;$SurveyCopyWith<$Res>? get survey;$PetitionCopyWith<$Res>? get petition;$MeetingCopyWith<$Res>? get meeting;

}
/// @nodoc
class __$CreateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(this._self, this._then);

  final _Create _self;
  final $Res Function(_Create) _then;

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? body = null,Object? status = null,Object? repostOf = freezed,Object? replyTo = freezed,Object? communityNoteOf = freezed,Object? ballot = freezed,Object? survey = freezed,Object? petition = freezed,Object? meeting = freezed,Object? tags = null,}) {
  return _then(_Create(
body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PostStatus,repostOf: freezed == repostOf ? _self.repostOf : repostOf // ignore: cast_nullable_to_non_nullable
as Post?,replyTo: freezed == replyTo ? _self.replyTo : replyTo // ignore: cast_nullable_to_non_nullable
as Post?,communityNoteOf: freezed == communityNoteOf ? _self.communityNoteOf : communityNoteOf // ignore: cast_nullable_to_non_nullable
as Post?,ballot: freezed == ballot ? _self.ballot : ballot // ignore: cast_nullable_to_non_nullable
as Ballot?,survey: freezed == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as Survey?,petition: freezed == petition ? _self.petition : petition // ignore: cast_nullable_to_non_nullable
as Petition?,meeting: freezed == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<Map>,
  ));
}

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res>? get repostOf {
    if (_self.repostOf == null) {
    return null;
  }

  return $PostCopyWith<$Res>(_self.repostOf!, (value) {
    return _then(_self.copyWith(repostOf: value));
  });
}/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res>? get replyTo {
    if (_self.replyTo == null) {
    return null;
  }

  return $PostCopyWith<$Res>(_self.replyTo!, (value) {
    return _then(_self.copyWith(replyTo: value));
  });
}/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res>? get communityNoteOf {
    if (_self.communityNoteOf == null) {
    return null;
  }

  return $PostCopyWith<$Res>(_self.communityNoteOf!, (value) {
    return _then(_self.copyWith(communityNoteOf: value));
  });
}/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BallotCopyWith<$Res>? get ballot {
    if (_self.ballot == null) {
    return null;
  }

  return $BallotCopyWith<$Res>(_self.ballot!, (value) {
    return _then(_self.copyWith(ballot: value));
  });
}/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SurveyCopyWith<$Res>? get survey {
    if (_self.survey == null) {
    return null;
  }

  return $SurveyCopyWith<$Res>(_self.survey!, (value) {
    return _then(_self.copyWith(survey: value));
  });
}/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetitionCopyWith<$Res>? get petition {
    if (_self.petition == null) {
    return null;
  }

  return $PetitionCopyWith<$Res>(_self.petition!, (value) {
    return _then(_self.copyWith(petition: value));
  });
}/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeetingCopyWith<$Res>? get meeting {
    if (_self.meeting == null) {
    return null;
  }

  return $MeetingCopyWith<$Res>(_self.meeting!, (value) {
    return _then(_self.copyWith(meeting: value));
  });
}
}

/// @nodoc


class _Get implements PostDetailEvent {
  const _Get({required this.post});
  

 final  Post post;

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCopyWith<_Get> get copyWith => __$GetCopyWithImpl<_Get>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Get&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'PostDetailEvent.get(post: $post)';
}


}

/// @nodoc
abstract mixin class _$GetCopyWith<$Res> implements $PostDetailEventCopyWith<$Res> {
  factory _$GetCopyWith(_Get value, $Res Function(_Get) _then) = __$GetCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$GetCopyWithImpl<$Res>
    implements _$GetCopyWith<$Res> {
  __$GetCopyWithImpl(this._self, this._then);

  final _Get _self;
  final $Res Function(_Get) _then;

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(_Get(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of PostDetailEvent
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


class _Update implements PostDetailEvent {
  const _Update({required this.id, required this.body, required this.status, required final  List<Map> tags}): _tags = tags;
  

 final  int id;
 final  String body;
 final  PostStatus status;
 final  List<Map> _tags;
 List<Map> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCopyWith<_Update> get copyWith => __$UpdateCopyWithImpl<_Update>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Update&&(identical(other.id, id) || other.id == id)&&(identical(other.body, body) || other.body == body)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._tags, _tags));
}


@override
int get hashCode => Object.hash(runtimeType,id,body,status,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'PostDetailEvent.update(id: $id, body: $body, status: $status, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$UpdateCopyWith<$Res> implements $PostDetailEventCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) _then) = __$UpdateCopyWithImpl;
@useResult
$Res call({
 int id, String body, PostStatus status, List<Map> tags
});




}
/// @nodoc
class __$UpdateCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(this._self, this._then);

  final _Update _self;
  final $Res Function(_Update) _then;

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? body = null,Object? status = null,Object? tags = null,}) {
  return _then(_Update(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PostStatus,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<Map>,
  ));
}


}

/// @nodoc


class _Viewed implements PostDetailEvent {
  const _Viewed({required this.post});
  

 final  Post post;

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViewedCopyWith<_Viewed> get copyWith => __$ViewedCopyWithImpl<_Viewed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Viewed&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'PostDetailEvent.viewed(post: $post)';
}


}

/// @nodoc
abstract mixin class _$ViewedCopyWith<$Res> implements $PostDetailEventCopyWith<$Res> {
  factory _$ViewedCopyWith(_Viewed value, $Res Function(_Viewed) _then) = __$ViewedCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$ViewedCopyWithImpl<$Res>
    implements _$ViewedCopyWith<$Res> {
  __$ViewedCopyWithImpl(this._self, this._then);

  final _Viewed _self;
  final $Res Function(_Viewed) _then;

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(_Viewed(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of PostDetailEvent
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


class _Like implements PostDetailEvent {
  const _Like({required this.post});
  

 final  Post post;

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LikeCopyWith<_Like> get copyWith => __$LikeCopyWithImpl<_Like>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Like&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'PostDetailEvent.like(post: $post)';
}


}

/// @nodoc
abstract mixin class _$LikeCopyWith<$Res> implements $PostDetailEventCopyWith<$Res> {
  factory _$LikeCopyWith(_Like value, $Res Function(_Like) _then) = __$LikeCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$LikeCopyWithImpl<$Res>
    implements _$LikeCopyWith<$Res> {
  __$LikeCopyWithImpl(this._self, this._then);

  final _Like _self;
  final $Res Function(_Like) _then;

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(_Like(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of PostDetailEvent
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


class _Bookmark implements PostDetailEvent {
  const _Bookmark({required this.post});
  

 final  Post post;

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkCopyWith<_Bookmark> get copyWith => __$BookmarkCopyWithImpl<_Bookmark>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Bookmark&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'PostDetailEvent.bookmark(post: $post)';
}


}

/// @nodoc
abstract mixin class _$BookmarkCopyWith<$Res> implements $PostDetailEventCopyWith<$Res> {
  factory _$BookmarkCopyWith(_Bookmark value, $Res Function(_Bookmark) _then) = __$BookmarkCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$BookmarkCopyWithImpl<$Res>
    implements _$BookmarkCopyWith<$Res> {
  __$BookmarkCopyWithImpl(this._self, this._then);

  final _Bookmark _self;
  final $Res Function(_Bookmark) _then;

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(_Bookmark(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of PostDetailEvent
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


class _Upvote implements PostDetailEvent {
  const _Upvote({required this.post});
  

 final  Post post;

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpvoteCopyWith<_Upvote> get copyWith => __$UpvoteCopyWithImpl<_Upvote>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Upvote&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'PostDetailEvent.upvote(post: $post)';
}


}

/// @nodoc
abstract mixin class _$UpvoteCopyWith<$Res> implements $PostDetailEventCopyWith<$Res> {
  factory _$UpvoteCopyWith(_Upvote value, $Res Function(_Upvote) _then) = __$UpvoteCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$UpvoteCopyWithImpl<$Res>
    implements _$UpvoteCopyWith<$Res> {
  __$UpvoteCopyWithImpl(this._self, this._then);

  final _Upvote _self;
  final $Res Function(_Upvote) _then;

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(_Upvote(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of PostDetailEvent
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


class _Downvote implements PostDetailEvent {
  const _Downvote({required this.post});
  

 final  Post post;

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DownvoteCopyWith<_Downvote> get copyWith => __$DownvoteCopyWithImpl<_Downvote>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Downvote&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'PostDetailEvent.downvote(post: $post)';
}


}

/// @nodoc
abstract mixin class _$DownvoteCopyWith<$Res> implements $PostDetailEventCopyWith<$Res> {
  factory _$DownvoteCopyWith(_Downvote value, $Res Function(_Downvote) _then) = __$DownvoteCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$DownvoteCopyWithImpl<$Res>
    implements _$DownvoteCopyWith<$Res> {
  __$DownvoteCopyWithImpl(this._self, this._then);

  final _Downvote _self;
  final $Res Function(_Downvote) _then;

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(_Downvote(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of PostDetailEvent
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


class _Delete implements PostDetailEvent {
  const _Delete({required this.post});
  

 final  Post post;

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteCopyWith<_Delete> get copyWith => __$DeleteCopyWithImpl<_Delete>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Delete&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'PostDetailEvent.delete(post: $post)';
}


}

/// @nodoc
abstract mixin class _$DeleteCopyWith<$Res> implements $PostDetailEventCopyWith<$Res> {
  factory _$DeleteCopyWith(_Delete value, $Res Function(_Delete) _then) = __$DeleteCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$DeleteCopyWithImpl<$Res>
    implements _$DeleteCopyWith<$Res> {
  __$DeleteCopyWithImpl(this._self, this._then);

  final _Delete _self;
  final $Res Function(_Delete) _then;

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(_Delete(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of PostDetailEvent
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


class _DeleteRepost implements PostDetailEvent {
  const _DeleteRepost({required this.post});
  

 final  Post post;

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteRepostCopyWith<_DeleteRepost> get copyWith => __$DeleteRepostCopyWithImpl<_DeleteRepost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteRepost&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,post);

@override
String toString() {
  return 'PostDetailEvent.deleteRepost(post: $post)';
}


}

/// @nodoc
abstract mixin class _$DeleteRepostCopyWith<$Res> implements $PostDetailEventCopyWith<$Res> {
  factory _$DeleteRepostCopyWith(_DeleteRepost value, $Res Function(_DeleteRepost) _then) = __$DeleteRepostCopyWithImpl;
@useResult
$Res call({
 Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$DeleteRepostCopyWithImpl<$Res>
    implements _$DeleteRepostCopyWith<$Res> {
  __$DeleteRepostCopyWithImpl(this._self, this._then);

  final _DeleteRepost _self;
  final $Res Function(_DeleteRepost) _then;

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,}) {
  return _then(_DeleteRepost(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of PostDetailEvent
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


class _Report implements PostDetailEvent {
  const _Report({required this.issue, required this.post});
  

 final  String issue;
 final  Post post;

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportCopyWith<_Report> get copyWith => __$ReportCopyWithImpl<_Report>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Report&&(identical(other.issue, issue) || other.issue == issue)&&(identical(other.post, post) || other.post == post));
}


@override
int get hashCode => Object.hash(runtimeType,issue,post);

@override
String toString() {
  return 'PostDetailEvent.report(issue: $issue, post: $post)';
}


}

/// @nodoc
abstract mixin class _$ReportCopyWith<$Res> implements $PostDetailEventCopyWith<$Res> {
  factory _$ReportCopyWith(_Report value, $Res Function(_Report) _then) = __$ReportCopyWithImpl;
@useResult
$Res call({
 String issue, Post post
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class __$ReportCopyWithImpl<$Res>
    implements _$ReportCopyWith<$Res> {
  __$ReportCopyWithImpl(this._self, this._then);

  final _Report _self;
  final $Res Function(_Report) _then;

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? issue = null,Object? post = null,}) {
  return _then(_Report(
issue: null == issue ? _self.issue : issue // ignore: cast_nullable_to_non_nullable
as String,post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,
  ));
}

/// Create a copy of PostDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

// dart format on
