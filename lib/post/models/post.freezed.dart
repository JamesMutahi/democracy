// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Post {

 int get id; User get author;@PostStatusConverter() PostStatus get status; String get body; String? get image1Url; String? get image2Url; String? get image3Url; String? get image4Url; String? get image5Url; String? get image6Url; String? get video1Url; String? get video2Url; String? get video3Url; int get likes;@JsonKey(name: 'is_liked') bool get isLiked; int get bookmarks;@JsonKey(name: 'is_bookmarked') bool get isBookmarked; int get views; int get replies; int get reposts;@JsonKey(name: 'is_edited') bool get isEdited;@JsonKey(name: 'is_deleted') bool get isDeleted;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'published_at') DateTime get publishedAt;@JsonKey(name: 'reply_to') Post? get replyTo;@JsonKey(name: 'repost_of') Post? get repostOf; Poll? get poll; Survey? get survey;@JsonKey(name: 'tagged_users') List<User> get taggedUsers;
/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostCopyWith<Post> get copyWith => _$PostCopyWithImpl<Post>(this as Post, _$identity);

  /// Serializes this Post to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Post&&(identical(other.id, id) || other.id == id)&&(identical(other.author, author) || other.author == author)&&(identical(other.status, status) || other.status == status)&&(identical(other.body, body) || other.body == body)&&(identical(other.image1Url, image1Url) || other.image1Url == image1Url)&&(identical(other.image2Url, image2Url) || other.image2Url == image2Url)&&(identical(other.image3Url, image3Url) || other.image3Url == image3Url)&&(identical(other.image4Url, image4Url) || other.image4Url == image4Url)&&(identical(other.image5Url, image5Url) || other.image5Url == image5Url)&&(identical(other.image6Url, image6Url) || other.image6Url == image6Url)&&(identical(other.video1Url, video1Url) || other.video1Url == video1Url)&&(identical(other.video2Url, video2Url) || other.video2Url == video2Url)&&(identical(other.video3Url, video3Url) || other.video3Url == video3Url)&&(identical(other.likes, likes) || other.likes == likes)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.bookmarks, bookmarks) || other.bookmarks == bookmarks)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked)&&(identical(other.views, views) || other.views == views)&&(identical(other.replies, replies) || other.replies == replies)&&(identical(other.reposts, reposts) || other.reposts == reposts)&&(identical(other.isEdited, isEdited) || other.isEdited == isEdited)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.replyTo, replyTo) || other.replyTo == replyTo)&&(identical(other.repostOf, repostOf) || other.repostOf == repostOf)&&(identical(other.poll, poll) || other.poll == poll)&&(identical(other.survey, survey) || other.survey == survey)&&const DeepCollectionEquality().equals(other.taggedUsers, taggedUsers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,author,status,body,image1Url,image2Url,image3Url,image4Url,image5Url,image6Url,video1Url,video2Url,video3Url,likes,isLiked,bookmarks,isBookmarked,views,replies,reposts,isEdited,isDeleted,isActive,publishedAt,replyTo,repostOf,poll,survey,const DeepCollectionEquality().hash(taggedUsers)]);

@override
String toString() {
  return 'Post(id: $id, author: $author, status: $status, body: $body, image1Url: $image1Url, image2Url: $image2Url, image3Url: $image3Url, image4Url: $image4Url, image5Url: $image5Url, image6Url: $image6Url, video1Url: $video1Url, video2Url: $video2Url, video3Url: $video3Url, likes: $likes, isLiked: $isLiked, bookmarks: $bookmarks, isBookmarked: $isBookmarked, views: $views, replies: $replies, reposts: $reposts, isEdited: $isEdited, isDeleted: $isDeleted, isActive: $isActive, publishedAt: $publishedAt, replyTo: $replyTo, repostOf: $repostOf, poll: $poll, survey: $survey, taggedUsers: $taggedUsers)';
}


}

/// @nodoc
abstract mixin class $PostCopyWith<$Res>  {
  factory $PostCopyWith(Post value, $Res Function(Post) _then) = _$PostCopyWithImpl;
@useResult
$Res call({
 int id, User author,@PostStatusConverter() PostStatus status, String body, String? image1Url, String? image2Url, String? image3Url, String? image4Url, String? image5Url, String? image6Url, String? video1Url, String? video2Url, String? video3Url, int likes,@JsonKey(name: 'is_liked') bool isLiked, int bookmarks,@JsonKey(name: 'is_bookmarked') bool isBookmarked, int views, int replies, int reposts,@JsonKey(name: 'is_edited') bool isEdited,@JsonKey(name: 'is_deleted') bool isDeleted,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'published_at') DateTime publishedAt,@JsonKey(name: 'reply_to') Post? replyTo,@JsonKey(name: 'repost_of') Post? repostOf, Poll? poll, Survey? survey,@JsonKey(name: 'tagged_users') List<User> taggedUsers
});


$UserCopyWith<$Res> get author;$PostCopyWith<$Res>? get replyTo;$PostCopyWith<$Res>? get repostOf;$PollCopyWith<$Res>? get poll;$SurveyCopyWith<$Res>? get survey;

}
/// @nodoc
class _$PostCopyWithImpl<$Res>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._self, this._then);

  final Post _self;
  final $Res Function(Post) _then;

/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? author = null,Object? status = null,Object? body = null,Object? image1Url = freezed,Object? image2Url = freezed,Object? image3Url = freezed,Object? image4Url = freezed,Object? image5Url = freezed,Object? image6Url = freezed,Object? video1Url = freezed,Object? video2Url = freezed,Object? video3Url = freezed,Object? likes = null,Object? isLiked = null,Object? bookmarks = null,Object? isBookmarked = null,Object? views = null,Object? replies = null,Object? reposts = null,Object? isEdited = null,Object? isDeleted = null,Object? isActive = null,Object? publishedAt = null,Object? replyTo = freezed,Object? repostOf = freezed,Object? poll = freezed,Object? survey = freezed,Object? taggedUsers = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as User,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PostStatus,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,image1Url: freezed == image1Url ? _self.image1Url : image1Url // ignore: cast_nullable_to_non_nullable
as String?,image2Url: freezed == image2Url ? _self.image2Url : image2Url // ignore: cast_nullable_to_non_nullable
as String?,image3Url: freezed == image3Url ? _self.image3Url : image3Url // ignore: cast_nullable_to_non_nullable
as String?,image4Url: freezed == image4Url ? _self.image4Url : image4Url // ignore: cast_nullable_to_non_nullable
as String?,image5Url: freezed == image5Url ? _self.image5Url : image5Url // ignore: cast_nullable_to_non_nullable
as String?,image6Url: freezed == image6Url ? _self.image6Url : image6Url // ignore: cast_nullable_to_non_nullable
as String?,video1Url: freezed == video1Url ? _self.video1Url : video1Url // ignore: cast_nullable_to_non_nullable
as String?,video2Url: freezed == video2Url ? _self.video2Url : video2Url // ignore: cast_nullable_to_non_nullable
as String?,video3Url: freezed == video3Url ? _self.video3Url : video3Url // ignore: cast_nullable_to_non_nullable
as String?,likes: null == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as int,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,bookmarks: null == bookmarks ? _self.bookmarks : bookmarks // ignore: cast_nullable_to_non_nullable
as int,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,views: null == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int,replies: null == replies ? _self.replies : replies // ignore: cast_nullable_to_non_nullable
as int,reposts: null == reposts ? _self.reposts : reposts // ignore: cast_nullable_to_non_nullable
as int,isEdited: null == isEdited ? _self.isEdited : isEdited // ignore: cast_nullable_to_non_nullable
as bool,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,replyTo: freezed == replyTo ? _self.replyTo : replyTo // ignore: cast_nullable_to_non_nullable
as Post?,repostOf: freezed == repostOf ? _self.repostOf : repostOf // ignore: cast_nullable_to_non_nullable
as Post?,poll: freezed == poll ? _self.poll : poll // ignore: cast_nullable_to_non_nullable
as Poll?,survey: freezed == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as Survey?,taggedUsers: null == taggedUsers ? _self.taggedUsers : taggedUsers // ignore: cast_nullable_to_non_nullable
as List<User>,
  ));
}
/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get author {
  
  return $UserCopyWith<$Res>(_self.author, (value) {
    return _then(_self.copyWith(author: value));
  });
}/// Create a copy of Post
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
}/// Create a copy of Post
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
}/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PollCopyWith<$Res>? get poll {
    if (_self.poll == null) {
    return null;
  }

  return $PollCopyWith<$Res>(_self.poll!, (value) {
    return _then(_self.copyWith(poll: value));
  });
}/// Create a copy of Post
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
}
}


/// Adds pattern-matching-related methods to [Post].
extension PostPatterns on Post {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Post value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Post() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Post value)  $default,){
final _that = this;
switch (_that) {
case _Post():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Post value)?  $default,){
final _that = this;
switch (_that) {
case _Post() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  User author, @PostStatusConverter()  PostStatus status,  String body,  String? image1Url,  String? image2Url,  String? image3Url,  String? image4Url,  String? image5Url,  String? image6Url,  String? video1Url,  String? video2Url,  String? video3Url,  int likes, @JsonKey(name: 'is_liked')  bool isLiked,  int bookmarks, @JsonKey(name: 'is_bookmarked')  bool isBookmarked,  int views,  int replies,  int reposts, @JsonKey(name: 'is_edited')  bool isEdited, @JsonKey(name: 'is_deleted')  bool isDeleted, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'published_at')  DateTime publishedAt, @JsonKey(name: 'reply_to')  Post? replyTo, @JsonKey(name: 'repost_of')  Post? repostOf,  Poll? poll,  Survey? survey, @JsonKey(name: 'tagged_users')  List<User> taggedUsers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Post() when $default != null:
return $default(_that.id,_that.author,_that.status,_that.body,_that.image1Url,_that.image2Url,_that.image3Url,_that.image4Url,_that.image5Url,_that.image6Url,_that.video1Url,_that.video2Url,_that.video3Url,_that.likes,_that.isLiked,_that.bookmarks,_that.isBookmarked,_that.views,_that.replies,_that.reposts,_that.isEdited,_that.isDeleted,_that.isActive,_that.publishedAt,_that.replyTo,_that.repostOf,_that.poll,_that.survey,_that.taggedUsers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  User author, @PostStatusConverter()  PostStatus status,  String body,  String? image1Url,  String? image2Url,  String? image3Url,  String? image4Url,  String? image5Url,  String? image6Url,  String? video1Url,  String? video2Url,  String? video3Url,  int likes, @JsonKey(name: 'is_liked')  bool isLiked,  int bookmarks, @JsonKey(name: 'is_bookmarked')  bool isBookmarked,  int views,  int replies,  int reposts, @JsonKey(name: 'is_edited')  bool isEdited, @JsonKey(name: 'is_deleted')  bool isDeleted, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'published_at')  DateTime publishedAt, @JsonKey(name: 'reply_to')  Post? replyTo, @JsonKey(name: 'repost_of')  Post? repostOf,  Poll? poll,  Survey? survey, @JsonKey(name: 'tagged_users')  List<User> taggedUsers)  $default,) {final _that = this;
switch (_that) {
case _Post():
return $default(_that.id,_that.author,_that.status,_that.body,_that.image1Url,_that.image2Url,_that.image3Url,_that.image4Url,_that.image5Url,_that.image6Url,_that.video1Url,_that.video2Url,_that.video3Url,_that.likes,_that.isLiked,_that.bookmarks,_that.isBookmarked,_that.views,_that.replies,_that.reposts,_that.isEdited,_that.isDeleted,_that.isActive,_that.publishedAt,_that.replyTo,_that.repostOf,_that.poll,_that.survey,_that.taggedUsers);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  User author, @PostStatusConverter()  PostStatus status,  String body,  String? image1Url,  String? image2Url,  String? image3Url,  String? image4Url,  String? image5Url,  String? image6Url,  String? video1Url,  String? video2Url,  String? video3Url,  int likes, @JsonKey(name: 'is_liked')  bool isLiked,  int bookmarks, @JsonKey(name: 'is_bookmarked')  bool isBookmarked,  int views,  int replies,  int reposts, @JsonKey(name: 'is_edited')  bool isEdited, @JsonKey(name: 'is_deleted')  bool isDeleted, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'published_at')  DateTime publishedAt, @JsonKey(name: 'reply_to')  Post? replyTo, @JsonKey(name: 'repost_of')  Post? repostOf,  Poll? poll,  Survey? survey, @JsonKey(name: 'tagged_users')  List<User> taggedUsers)?  $default,) {final _that = this;
switch (_that) {
case _Post() when $default != null:
return $default(_that.id,_that.author,_that.status,_that.body,_that.image1Url,_that.image2Url,_that.image3Url,_that.image4Url,_that.image5Url,_that.image6Url,_that.video1Url,_that.video2Url,_that.video3Url,_that.likes,_that.isLiked,_that.bookmarks,_that.isBookmarked,_that.views,_that.replies,_that.reposts,_that.isEdited,_that.isDeleted,_that.isActive,_that.publishedAt,_that.replyTo,_that.repostOf,_that.poll,_that.survey,_that.taggedUsers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Post implements Post {
  const _Post({required this.id, required this.author, @PostStatusConverter() required this.status, required this.body, required this.image1Url, required this.image2Url, required this.image3Url, required this.image4Url, required this.image5Url, required this.image6Url, required this.video1Url, required this.video2Url, required this.video3Url, required this.likes, @JsonKey(name: 'is_liked') required this.isLiked, required this.bookmarks, @JsonKey(name: 'is_bookmarked') required this.isBookmarked, required this.views, required this.replies, required this.reposts, @JsonKey(name: 'is_edited') required this.isEdited, @JsonKey(name: 'is_deleted') required this.isDeleted, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'published_at') required this.publishedAt, @JsonKey(name: 'reply_to') required this.replyTo, @JsonKey(name: 'repost_of') required this.repostOf, required this.poll, required this.survey, @JsonKey(name: 'tagged_users') required final  List<User> taggedUsers}): _taggedUsers = taggedUsers;
  factory _Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

@override final  int id;
@override final  User author;
@override@PostStatusConverter() final  PostStatus status;
@override final  String body;
@override final  String? image1Url;
@override final  String? image2Url;
@override final  String? image3Url;
@override final  String? image4Url;
@override final  String? image5Url;
@override final  String? image6Url;
@override final  String? video1Url;
@override final  String? video2Url;
@override final  String? video3Url;
@override final  int likes;
@override@JsonKey(name: 'is_liked') final  bool isLiked;
@override final  int bookmarks;
@override@JsonKey(name: 'is_bookmarked') final  bool isBookmarked;
@override final  int views;
@override final  int replies;
@override final  int reposts;
@override@JsonKey(name: 'is_edited') final  bool isEdited;
@override@JsonKey(name: 'is_deleted') final  bool isDeleted;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'published_at') final  DateTime publishedAt;
@override@JsonKey(name: 'reply_to') final  Post? replyTo;
@override@JsonKey(name: 'repost_of') final  Post? repostOf;
@override final  Poll? poll;
@override final  Survey? survey;
 final  List<User> _taggedUsers;
@override@JsonKey(name: 'tagged_users') List<User> get taggedUsers {
  if (_taggedUsers is EqualUnmodifiableListView) return _taggedUsers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_taggedUsers);
}


/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostCopyWith<_Post> get copyWith => __$PostCopyWithImpl<_Post>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Post&&(identical(other.id, id) || other.id == id)&&(identical(other.author, author) || other.author == author)&&(identical(other.status, status) || other.status == status)&&(identical(other.body, body) || other.body == body)&&(identical(other.image1Url, image1Url) || other.image1Url == image1Url)&&(identical(other.image2Url, image2Url) || other.image2Url == image2Url)&&(identical(other.image3Url, image3Url) || other.image3Url == image3Url)&&(identical(other.image4Url, image4Url) || other.image4Url == image4Url)&&(identical(other.image5Url, image5Url) || other.image5Url == image5Url)&&(identical(other.image6Url, image6Url) || other.image6Url == image6Url)&&(identical(other.video1Url, video1Url) || other.video1Url == video1Url)&&(identical(other.video2Url, video2Url) || other.video2Url == video2Url)&&(identical(other.video3Url, video3Url) || other.video3Url == video3Url)&&(identical(other.likes, likes) || other.likes == likes)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.bookmarks, bookmarks) || other.bookmarks == bookmarks)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked)&&(identical(other.views, views) || other.views == views)&&(identical(other.replies, replies) || other.replies == replies)&&(identical(other.reposts, reposts) || other.reposts == reposts)&&(identical(other.isEdited, isEdited) || other.isEdited == isEdited)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.replyTo, replyTo) || other.replyTo == replyTo)&&(identical(other.repostOf, repostOf) || other.repostOf == repostOf)&&(identical(other.poll, poll) || other.poll == poll)&&(identical(other.survey, survey) || other.survey == survey)&&const DeepCollectionEquality().equals(other._taggedUsers, _taggedUsers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,author,status,body,image1Url,image2Url,image3Url,image4Url,image5Url,image6Url,video1Url,video2Url,video3Url,likes,isLiked,bookmarks,isBookmarked,views,replies,reposts,isEdited,isDeleted,isActive,publishedAt,replyTo,repostOf,poll,survey,const DeepCollectionEquality().hash(_taggedUsers)]);

@override
String toString() {
  return 'Post(id: $id, author: $author, status: $status, body: $body, image1Url: $image1Url, image2Url: $image2Url, image3Url: $image3Url, image4Url: $image4Url, image5Url: $image5Url, image6Url: $image6Url, video1Url: $video1Url, video2Url: $video2Url, video3Url: $video3Url, likes: $likes, isLiked: $isLiked, bookmarks: $bookmarks, isBookmarked: $isBookmarked, views: $views, replies: $replies, reposts: $reposts, isEdited: $isEdited, isDeleted: $isDeleted, isActive: $isActive, publishedAt: $publishedAt, replyTo: $replyTo, repostOf: $repostOf, poll: $poll, survey: $survey, taggedUsers: $taggedUsers)';
}


}

/// @nodoc
abstract mixin class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) _then) = __$PostCopyWithImpl;
@override @useResult
$Res call({
 int id, User author,@PostStatusConverter() PostStatus status, String body, String? image1Url, String? image2Url, String? image3Url, String? image4Url, String? image5Url, String? image6Url, String? video1Url, String? video2Url, String? video3Url, int likes,@JsonKey(name: 'is_liked') bool isLiked, int bookmarks,@JsonKey(name: 'is_bookmarked') bool isBookmarked, int views, int replies, int reposts,@JsonKey(name: 'is_edited') bool isEdited,@JsonKey(name: 'is_deleted') bool isDeleted,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'published_at') DateTime publishedAt,@JsonKey(name: 'reply_to') Post? replyTo,@JsonKey(name: 'repost_of') Post? repostOf, Poll? poll, Survey? survey,@JsonKey(name: 'tagged_users') List<User> taggedUsers
});


@override $UserCopyWith<$Res> get author;@override $PostCopyWith<$Res>? get replyTo;@override $PostCopyWith<$Res>? get repostOf;@override $PollCopyWith<$Res>? get poll;@override $SurveyCopyWith<$Res>? get survey;

}
/// @nodoc
class __$PostCopyWithImpl<$Res>
    implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(this._self, this._then);

  final _Post _self;
  final $Res Function(_Post) _then;

/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? author = null,Object? status = null,Object? body = null,Object? image1Url = freezed,Object? image2Url = freezed,Object? image3Url = freezed,Object? image4Url = freezed,Object? image5Url = freezed,Object? image6Url = freezed,Object? video1Url = freezed,Object? video2Url = freezed,Object? video3Url = freezed,Object? likes = null,Object? isLiked = null,Object? bookmarks = null,Object? isBookmarked = null,Object? views = null,Object? replies = null,Object? reposts = null,Object? isEdited = null,Object? isDeleted = null,Object? isActive = null,Object? publishedAt = null,Object? replyTo = freezed,Object? repostOf = freezed,Object? poll = freezed,Object? survey = freezed,Object? taggedUsers = null,}) {
  return _then(_Post(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as User,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PostStatus,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,image1Url: freezed == image1Url ? _self.image1Url : image1Url // ignore: cast_nullable_to_non_nullable
as String?,image2Url: freezed == image2Url ? _self.image2Url : image2Url // ignore: cast_nullable_to_non_nullable
as String?,image3Url: freezed == image3Url ? _self.image3Url : image3Url // ignore: cast_nullable_to_non_nullable
as String?,image4Url: freezed == image4Url ? _self.image4Url : image4Url // ignore: cast_nullable_to_non_nullable
as String?,image5Url: freezed == image5Url ? _self.image5Url : image5Url // ignore: cast_nullable_to_non_nullable
as String?,image6Url: freezed == image6Url ? _self.image6Url : image6Url // ignore: cast_nullable_to_non_nullable
as String?,video1Url: freezed == video1Url ? _self.video1Url : video1Url // ignore: cast_nullable_to_non_nullable
as String?,video2Url: freezed == video2Url ? _self.video2Url : video2Url // ignore: cast_nullable_to_non_nullable
as String?,video3Url: freezed == video3Url ? _self.video3Url : video3Url // ignore: cast_nullable_to_non_nullable
as String?,likes: null == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as int,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,bookmarks: null == bookmarks ? _self.bookmarks : bookmarks // ignore: cast_nullable_to_non_nullable
as int,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,views: null == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int,replies: null == replies ? _self.replies : replies // ignore: cast_nullable_to_non_nullable
as int,reposts: null == reposts ? _self.reposts : reposts // ignore: cast_nullable_to_non_nullable
as int,isEdited: null == isEdited ? _self.isEdited : isEdited // ignore: cast_nullable_to_non_nullable
as bool,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,replyTo: freezed == replyTo ? _self.replyTo : replyTo // ignore: cast_nullable_to_non_nullable
as Post?,repostOf: freezed == repostOf ? _self.repostOf : repostOf // ignore: cast_nullable_to_non_nullable
as Post?,poll: freezed == poll ? _self.poll : poll // ignore: cast_nullable_to_non_nullable
as Poll?,survey: freezed == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as Survey?,taggedUsers: null == taggedUsers ? _self._taggedUsers : taggedUsers // ignore: cast_nullable_to_non_nullable
as List<User>,
  ));
}

/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get author {
  
  return $UserCopyWith<$Res>(_self.author, (value) {
    return _then(_self.copyWith(author: value));
  });
}/// Create a copy of Post
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
}/// Create a copy of Post
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
}/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PollCopyWith<$Res>? get poll {
    if (_self.poll == null) {
    return null;
  }

  return $PollCopyWith<$Res>(_self.poll!, (value) {
    return _then(_self.copyWith(poll: value));
  });
}/// Create a copy of Post
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
}
}

// dart format on
