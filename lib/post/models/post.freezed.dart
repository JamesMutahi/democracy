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

 int get id; User get author;@PostStatusConverter() PostStatus get status; String get body;@JsonKey(name: 'image1') String? get image1Url;@JsonKey(name: 'image2') String? get image2Url;@JsonKey(name: 'image3') String? get image3Url;@JsonKey(name: 'image4') String? get image4Url;@JsonKey(name: 'video1') String? get video1Url;@JsonKey(name: 'video2') String? get video2Url;@JsonKey(name: 'video3') String? get video3Url; int get likes;@JsonKey(name: 'is_liked') bool get isLiked; int get bookmarks;@JsonKey(name: 'is_bookmarked') bool get isBookmarked; int get views; int get replies; int get reposts;@JsonKey(name: 'is_reposted') bool get isReposted;@JsonKey(name: 'is_quoted') bool get isQuoted;@JsonKey(name: 'is_deleted') bool get isDeleted;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'published_at') DateTime get publishedAt;@JsonKey(name: 'reply_to') Post? get replyTo;@JsonKey(name: 'repost_of') Post? get repostOf;@JsonKey(name: 'community_note_of') Post? get communityNoteOf; Ballot? get ballot; Survey? get survey; Petition? get petition; Meeting? get meeting;@JsonKey(name: 'tagged_users') List<User> get taggedUsers;@JsonKey(name: 'tagged_sections') List<Section> get taggedSections;@JsonKey(name: 'is_upvoted') bool get isUpvoted;@JsonKey(name: 'is_downvoted') bool get isDownvoted; int get upvotes; int get downvotes;@JsonKey(defaultValue: []) List<Post> get thread;@JsonKey(name: 'community_note') String get communityNote;
/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostCopyWith<Post> get copyWith => _$PostCopyWithImpl<Post>(this as Post, _$identity);

  /// Serializes this Post to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Post&&(identical(other.id, id) || other.id == id)&&(identical(other.author, author) || other.author == author)&&(identical(other.status, status) || other.status == status)&&(identical(other.body, body) || other.body == body)&&(identical(other.image1Url, image1Url) || other.image1Url == image1Url)&&(identical(other.image2Url, image2Url) || other.image2Url == image2Url)&&(identical(other.image3Url, image3Url) || other.image3Url == image3Url)&&(identical(other.image4Url, image4Url) || other.image4Url == image4Url)&&(identical(other.video1Url, video1Url) || other.video1Url == video1Url)&&(identical(other.video2Url, video2Url) || other.video2Url == video2Url)&&(identical(other.video3Url, video3Url) || other.video3Url == video3Url)&&(identical(other.likes, likes) || other.likes == likes)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.bookmarks, bookmarks) || other.bookmarks == bookmarks)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked)&&(identical(other.views, views) || other.views == views)&&(identical(other.replies, replies) || other.replies == replies)&&(identical(other.reposts, reposts) || other.reposts == reposts)&&(identical(other.isReposted, isReposted) || other.isReposted == isReposted)&&(identical(other.isQuoted, isQuoted) || other.isQuoted == isQuoted)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.replyTo, replyTo) || other.replyTo == replyTo)&&(identical(other.repostOf, repostOf) || other.repostOf == repostOf)&&(identical(other.communityNoteOf, communityNoteOf) || other.communityNoteOf == communityNoteOf)&&(identical(other.ballot, ballot) || other.ballot == ballot)&&(identical(other.survey, survey) || other.survey == survey)&&(identical(other.petition, petition) || other.petition == petition)&&(identical(other.meeting, meeting) || other.meeting == meeting)&&const DeepCollectionEquality().equals(other.taggedUsers, taggedUsers)&&const DeepCollectionEquality().equals(other.taggedSections, taggedSections)&&(identical(other.isUpvoted, isUpvoted) || other.isUpvoted == isUpvoted)&&(identical(other.isDownvoted, isDownvoted) || other.isDownvoted == isDownvoted)&&(identical(other.upvotes, upvotes) || other.upvotes == upvotes)&&(identical(other.downvotes, downvotes) || other.downvotes == downvotes)&&const DeepCollectionEquality().equals(other.thread, thread)&&(identical(other.communityNote, communityNote) || other.communityNote == communityNote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,author,status,body,image1Url,image2Url,image3Url,image4Url,video1Url,video2Url,video3Url,likes,isLiked,bookmarks,isBookmarked,views,replies,reposts,isReposted,isQuoted,isDeleted,isActive,publishedAt,replyTo,repostOf,communityNoteOf,ballot,survey,petition,meeting,const DeepCollectionEquality().hash(taggedUsers),const DeepCollectionEquality().hash(taggedSections),isUpvoted,isDownvoted,upvotes,downvotes,const DeepCollectionEquality().hash(thread),communityNote]);

@override
String toString() {
  return 'Post(id: $id, author: $author, status: $status, body: $body, image1Url: $image1Url, image2Url: $image2Url, image3Url: $image3Url, image4Url: $image4Url, video1Url: $video1Url, video2Url: $video2Url, video3Url: $video3Url, likes: $likes, isLiked: $isLiked, bookmarks: $bookmarks, isBookmarked: $isBookmarked, views: $views, replies: $replies, reposts: $reposts, isReposted: $isReposted, isQuoted: $isQuoted, isDeleted: $isDeleted, isActive: $isActive, publishedAt: $publishedAt, replyTo: $replyTo, repostOf: $repostOf, communityNoteOf: $communityNoteOf, ballot: $ballot, survey: $survey, petition: $petition, meeting: $meeting, taggedUsers: $taggedUsers, taggedSections: $taggedSections, isUpvoted: $isUpvoted, isDownvoted: $isDownvoted, upvotes: $upvotes, downvotes: $downvotes, thread: $thread, communityNote: $communityNote)';
}


}

/// @nodoc
abstract mixin class $PostCopyWith<$Res>  {
  factory $PostCopyWith(Post value, $Res Function(Post) _then) = _$PostCopyWithImpl;
@useResult
$Res call({
 int id, User author,@PostStatusConverter() PostStatus status, String body,@JsonKey(name: 'image1') String? image1Url,@JsonKey(name: 'image2') String? image2Url,@JsonKey(name: 'image3') String? image3Url,@JsonKey(name: 'image4') String? image4Url,@JsonKey(name: 'video1') String? video1Url,@JsonKey(name: 'video2') String? video2Url,@JsonKey(name: 'video3') String? video3Url, int likes,@JsonKey(name: 'is_liked') bool isLiked, int bookmarks,@JsonKey(name: 'is_bookmarked') bool isBookmarked, int views, int replies, int reposts,@JsonKey(name: 'is_reposted') bool isReposted,@JsonKey(name: 'is_quoted') bool isQuoted,@JsonKey(name: 'is_deleted') bool isDeleted,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'published_at') DateTime publishedAt,@JsonKey(name: 'reply_to') Post? replyTo,@JsonKey(name: 'repost_of') Post? repostOf,@JsonKey(name: 'community_note_of') Post? communityNoteOf, Ballot? ballot, Survey? survey, Petition? petition, Meeting? meeting,@JsonKey(name: 'tagged_users') List<User> taggedUsers,@JsonKey(name: 'tagged_sections') List<Section> taggedSections,@JsonKey(name: 'is_upvoted') bool isUpvoted,@JsonKey(name: 'is_downvoted') bool isDownvoted, int upvotes, int downvotes,@JsonKey(defaultValue: []) List<Post> thread,@JsonKey(name: 'community_note') String communityNote
});


$UserCopyWith<$Res> get author;$PostCopyWith<$Res>? get replyTo;$PostCopyWith<$Res>? get repostOf;$PostCopyWith<$Res>? get communityNoteOf;$BallotCopyWith<$Res>? get ballot;$SurveyCopyWith<$Res>? get survey;$PetitionCopyWith<$Res>? get petition;$MeetingCopyWith<$Res>? get meeting;

}
/// @nodoc
class _$PostCopyWithImpl<$Res>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._self, this._then);

  final Post _self;
  final $Res Function(Post) _then;

/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? author = null,Object? status = null,Object? body = null,Object? image1Url = freezed,Object? image2Url = freezed,Object? image3Url = freezed,Object? image4Url = freezed,Object? video1Url = freezed,Object? video2Url = freezed,Object? video3Url = freezed,Object? likes = null,Object? isLiked = null,Object? bookmarks = null,Object? isBookmarked = null,Object? views = null,Object? replies = null,Object? reposts = null,Object? isReposted = null,Object? isQuoted = null,Object? isDeleted = null,Object? isActive = null,Object? publishedAt = null,Object? replyTo = freezed,Object? repostOf = freezed,Object? communityNoteOf = freezed,Object? ballot = freezed,Object? survey = freezed,Object? petition = freezed,Object? meeting = freezed,Object? taggedUsers = null,Object? taggedSections = null,Object? isUpvoted = null,Object? isDownvoted = null,Object? upvotes = null,Object? downvotes = null,Object? thread = null,Object? communityNote = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as User,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PostStatus,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,image1Url: freezed == image1Url ? _self.image1Url : image1Url // ignore: cast_nullable_to_non_nullable
as String?,image2Url: freezed == image2Url ? _self.image2Url : image2Url // ignore: cast_nullable_to_non_nullable
as String?,image3Url: freezed == image3Url ? _self.image3Url : image3Url // ignore: cast_nullable_to_non_nullable
as String?,image4Url: freezed == image4Url ? _self.image4Url : image4Url // ignore: cast_nullable_to_non_nullable
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
as int,isReposted: null == isReposted ? _self.isReposted : isReposted // ignore: cast_nullable_to_non_nullable
as bool,isQuoted: null == isQuoted ? _self.isQuoted : isQuoted // ignore: cast_nullable_to_non_nullable
as bool,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,replyTo: freezed == replyTo ? _self.replyTo : replyTo // ignore: cast_nullable_to_non_nullable
as Post?,repostOf: freezed == repostOf ? _self.repostOf : repostOf // ignore: cast_nullable_to_non_nullable
as Post?,communityNoteOf: freezed == communityNoteOf ? _self.communityNoteOf : communityNoteOf // ignore: cast_nullable_to_non_nullable
as Post?,ballot: freezed == ballot ? _self.ballot : ballot // ignore: cast_nullable_to_non_nullable
as Ballot?,survey: freezed == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as Survey?,petition: freezed == petition ? _self.petition : petition // ignore: cast_nullable_to_non_nullable
as Petition?,meeting: freezed == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting?,taggedUsers: null == taggedUsers ? _self.taggedUsers : taggedUsers // ignore: cast_nullable_to_non_nullable
as List<User>,taggedSections: null == taggedSections ? _self.taggedSections : taggedSections // ignore: cast_nullable_to_non_nullable
as List<Section>,isUpvoted: null == isUpvoted ? _self.isUpvoted : isUpvoted // ignore: cast_nullable_to_non_nullable
as bool,isDownvoted: null == isDownvoted ? _self.isDownvoted : isDownvoted // ignore: cast_nullable_to_non_nullable
as bool,upvotes: null == upvotes ? _self.upvotes : upvotes // ignore: cast_nullable_to_non_nullable
as int,downvotes: null == downvotes ? _self.downvotes : downvotes // ignore: cast_nullable_to_non_nullable
as int,thread: null == thread ? _self.thread : thread // ignore: cast_nullable_to_non_nullable
as List<Post>,communityNote: null == communityNote ? _self.communityNote : communityNote // ignore: cast_nullable_to_non_nullable
as String,
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
$PostCopyWith<$Res>? get communityNoteOf {
    if (_self.communityNoteOf == null) {
    return null;
  }

  return $PostCopyWith<$Res>(_self.communityNoteOf!, (value) {
    return _then(_self.copyWith(communityNoteOf: value));
  });
}/// Create a copy of Post
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
}/// Create a copy of Post
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
}/// Create a copy of Post
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  User author, @PostStatusConverter()  PostStatus status,  String body, @JsonKey(name: 'image1')  String? image1Url, @JsonKey(name: 'image2')  String? image2Url, @JsonKey(name: 'image3')  String? image3Url, @JsonKey(name: 'image4')  String? image4Url, @JsonKey(name: 'video1')  String? video1Url, @JsonKey(name: 'video2')  String? video2Url, @JsonKey(name: 'video3')  String? video3Url,  int likes, @JsonKey(name: 'is_liked')  bool isLiked,  int bookmarks, @JsonKey(name: 'is_bookmarked')  bool isBookmarked,  int views,  int replies,  int reposts, @JsonKey(name: 'is_reposted')  bool isReposted, @JsonKey(name: 'is_quoted')  bool isQuoted, @JsonKey(name: 'is_deleted')  bool isDeleted, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'published_at')  DateTime publishedAt, @JsonKey(name: 'reply_to')  Post? replyTo, @JsonKey(name: 'repost_of')  Post? repostOf, @JsonKey(name: 'community_note_of')  Post? communityNoteOf,  Ballot? ballot,  Survey? survey,  Petition? petition,  Meeting? meeting, @JsonKey(name: 'tagged_users')  List<User> taggedUsers, @JsonKey(name: 'tagged_sections')  List<Section> taggedSections, @JsonKey(name: 'is_upvoted')  bool isUpvoted, @JsonKey(name: 'is_downvoted')  bool isDownvoted,  int upvotes,  int downvotes, @JsonKey(defaultValue: [])  List<Post> thread, @JsonKey(name: 'community_note')  String communityNote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Post() when $default != null:
return $default(_that.id,_that.author,_that.status,_that.body,_that.image1Url,_that.image2Url,_that.image3Url,_that.image4Url,_that.video1Url,_that.video2Url,_that.video3Url,_that.likes,_that.isLiked,_that.bookmarks,_that.isBookmarked,_that.views,_that.replies,_that.reposts,_that.isReposted,_that.isQuoted,_that.isDeleted,_that.isActive,_that.publishedAt,_that.replyTo,_that.repostOf,_that.communityNoteOf,_that.ballot,_that.survey,_that.petition,_that.meeting,_that.taggedUsers,_that.taggedSections,_that.isUpvoted,_that.isDownvoted,_that.upvotes,_that.downvotes,_that.thread,_that.communityNote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  User author, @PostStatusConverter()  PostStatus status,  String body, @JsonKey(name: 'image1')  String? image1Url, @JsonKey(name: 'image2')  String? image2Url, @JsonKey(name: 'image3')  String? image3Url, @JsonKey(name: 'image4')  String? image4Url, @JsonKey(name: 'video1')  String? video1Url, @JsonKey(name: 'video2')  String? video2Url, @JsonKey(name: 'video3')  String? video3Url,  int likes, @JsonKey(name: 'is_liked')  bool isLiked,  int bookmarks, @JsonKey(name: 'is_bookmarked')  bool isBookmarked,  int views,  int replies,  int reposts, @JsonKey(name: 'is_reposted')  bool isReposted, @JsonKey(name: 'is_quoted')  bool isQuoted, @JsonKey(name: 'is_deleted')  bool isDeleted, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'published_at')  DateTime publishedAt, @JsonKey(name: 'reply_to')  Post? replyTo, @JsonKey(name: 'repost_of')  Post? repostOf, @JsonKey(name: 'community_note_of')  Post? communityNoteOf,  Ballot? ballot,  Survey? survey,  Petition? petition,  Meeting? meeting, @JsonKey(name: 'tagged_users')  List<User> taggedUsers, @JsonKey(name: 'tagged_sections')  List<Section> taggedSections, @JsonKey(name: 'is_upvoted')  bool isUpvoted, @JsonKey(name: 'is_downvoted')  bool isDownvoted,  int upvotes,  int downvotes, @JsonKey(defaultValue: [])  List<Post> thread, @JsonKey(name: 'community_note')  String communityNote)  $default,) {final _that = this;
switch (_that) {
case _Post():
return $default(_that.id,_that.author,_that.status,_that.body,_that.image1Url,_that.image2Url,_that.image3Url,_that.image4Url,_that.video1Url,_that.video2Url,_that.video3Url,_that.likes,_that.isLiked,_that.bookmarks,_that.isBookmarked,_that.views,_that.replies,_that.reposts,_that.isReposted,_that.isQuoted,_that.isDeleted,_that.isActive,_that.publishedAt,_that.replyTo,_that.repostOf,_that.communityNoteOf,_that.ballot,_that.survey,_that.petition,_that.meeting,_that.taggedUsers,_that.taggedSections,_that.isUpvoted,_that.isDownvoted,_that.upvotes,_that.downvotes,_that.thread,_that.communityNote);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  User author, @PostStatusConverter()  PostStatus status,  String body, @JsonKey(name: 'image1')  String? image1Url, @JsonKey(name: 'image2')  String? image2Url, @JsonKey(name: 'image3')  String? image3Url, @JsonKey(name: 'image4')  String? image4Url, @JsonKey(name: 'video1')  String? video1Url, @JsonKey(name: 'video2')  String? video2Url, @JsonKey(name: 'video3')  String? video3Url,  int likes, @JsonKey(name: 'is_liked')  bool isLiked,  int bookmarks, @JsonKey(name: 'is_bookmarked')  bool isBookmarked,  int views,  int replies,  int reposts, @JsonKey(name: 'is_reposted')  bool isReposted, @JsonKey(name: 'is_quoted')  bool isQuoted, @JsonKey(name: 'is_deleted')  bool isDeleted, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'published_at')  DateTime publishedAt, @JsonKey(name: 'reply_to')  Post? replyTo, @JsonKey(name: 'repost_of')  Post? repostOf, @JsonKey(name: 'community_note_of')  Post? communityNoteOf,  Ballot? ballot,  Survey? survey,  Petition? petition,  Meeting? meeting, @JsonKey(name: 'tagged_users')  List<User> taggedUsers, @JsonKey(name: 'tagged_sections')  List<Section> taggedSections, @JsonKey(name: 'is_upvoted')  bool isUpvoted, @JsonKey(name: 'is_downvoted')  bool isDownvoted,  int upvotes,  int downvotes, @JsonKey(defaultValue: [])  List<Post> thread, @JsonKey(name: 'community_note')  String communityNote)?  $default,) {final _that = this;
switch (_that) {
case _Post() when $default != null:
return $default(_that.id,_that.author,_that.status,_that.body,_that.image1Url,_that.image2Url,_that.image3Url,_that.image4Url,_that.video1Url,_that.video2Url,_that.video3Url,_that.likes,_that.isLiked,_that.bookmarks,_that.isBookmarked,_that.views,_that.replies,_that.reposts,_that.isReposted,_that.isQuoted,_that.isDeleted,_that.isActive,_that.publishedAt,_that.replyTo,_that.repostOf,_that.communityNoteOf,_that.ballot,_that.survey,_that.petition,_that.meeting,_that.taggedUsers,_that.taggedSections,_that.isUpvoted,_that.isDownvoted,_that.upvotes,_that.downvotes,_that.thread,_that.communityNote);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Post implements Post {
  const _Post({required this.id, required this.author, @PostStatusConverter() required this.status, required this.body, @JsonKey(name: 'image1') required this.image1Url, @JsonKey(name: 'image2') required this.image2Url, @JsonKey(name: 'image3') required this.image3Url, @JsonKey(name: 'image4') required this.image4Url, @JsonKey(name: 'video1') required this.video1Url, @JsonKey(name: 'video2') required this.video2Url, @JsonKey(name: 'video3') required this.video3Url, required this.likes, @JsonKey(name: 'is_liked') required this.isLiked, required this.bookmarks, @JsonKey(name: 'is_bookmarked') required this.isBookmarked, required this.views, required this.replies, required this.reposts, @JsonKey(name: 'is_reposted') required this.isReposted, @JsonKey(name: 'is_quoted') required this.isQuoted, @JsonKey(name: 'is_deleted') required this.isDeleted, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'published_at') required this.publishedAt, @JsonKey(name: 'reply_to') required this.replyTo, @JsonKey(name: 'repost_of') required this.repostOf, @JsonKey(name: 'community_note_of') required this.communityNoteOf, required this.ballot, required this.survey, required this.petition, required this.meeting, @JsonKey(name: 'tagged_users') required final  List<User> taggedUsers, @JsonKey(name: 'tagged_sections') required final  List<Section> taggedSections, @JsonKey(name: 'is_upvoted') required this.isUpvoted, @JsonKey(name: 'is_downvoted') required this.isDownvoted, required this.upvotes, required this.downvotes, @JsonKey(defaultValue: []) required final  List<Post> thread, @JsonKey(name: 'community_note') required this.communityNote}): _taggedUsers = taggedUsers,_taggedSections = taggedSections,_thread = thread;
  factory _Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

@override final  int id;
@override final  User author;
@override@PostStatusConverter() final  PostStatus status;
@override final  String body;
@override@JsonKey(name: 'image1') final  String? image1Url;
@override@JsonKey(name: 'image2') final  String? image2Url;
@override@JsonKey(name: 'image3') final  String? image3Url;
@override@JsonKey(name: 'image4') final  String? image4Url;
@override@JsonKey(name: 'video1') final  String? video1Url;
@override@JsonKey(name: 'video2') final  String? video2Url;
@override@JsonKey(name: 'video3') final  String? video3Url;
@override final  int likes;
@override@JsonKey(name: 'is_liked') final  bool isLiked;
@override final  int bookmarks;
@override@JsonKey(name: 'is_bookmarked') final  bool isBookmarked;
@override final  int views;
@override final  int replies;
@override final  int reposts;
@override@JsonKey(name: 'is_reposted') final  bool isReposted;
@override@JsonKey(name: 'is_quoted') final  bool isQuoted;
@override@JsonKey(name: 'is_deleted') final  bool isDeleted;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'published_at') final  DateTime publishedAt;
@override@JsonKey(name: 'reply_to') final  Post? replyTo;
@override@JsonKey(name: 'repost_of') final  Post? repostOf;
@override@JsonKey(name: 'community_note_of') final  Post? communityNoteOf;
@override final  Ballot? ballot;
@override final  Survey? survey;
@override final  Petition? petition;
@override final  Meeting? meeting;
 final  List<User> _taggedUsers;
@override@JsonKey(name: 'tagged_users') List<User> get taggedUsers {
  if (_taggedUsers is EqualUnmodifiableListView) return _taggedUsers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_taggedUsers);
}

 final  List<Section> _taggedSections;
@override@JsonKey(name: 'tagged_sections') List<Section> get taggedSections {
  if (_taggedSections is EqualUnmodifiableListView) return _taggedSections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_taggedSections);
}

@override@JsonKey(name: 'is_upvoted') final  bool isUpvoted;
@override@JsonKey(name: 'is_downvoted') final  bool isDownvoted;
@override final  int upvotes;
@override final  int downvotes;
 final  List<Post> _thread;
@override@JsonKey(defaultValue: []) List<Post> get thread {
  if (_thread is EqualUnmodifiableListView) return _thread;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_thread);
}

@override@JsonKey(name: 'community_note') final  String communityNote;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Post&&(identical(other.id, id) || other.id == id)&&(identical(other.author, author) || other.author == author)&&(identical(other.status, status) || other.status == status)&&(identical(other.body, body) || other.body == body)&&(identical(other.image1Url, image1Url) || other.image1Url == image1Url)&&(identical(other.image2Url, image2Url) || other.image2Url == image2Url)&&(identical(other.image3Url, image3Url) || other.image3Url == image3Url)&&(identical(other.image4Url, image4Url) || other.image4Url == image4Url)&&(identical(other.video1Url, video1Url) || other.video1Url == video1Url)&&(identical(other.video2Url, video2Url) || other.video2Url == video2Url)&&(identical(other.video3Url, video3Url) || other.video3Url == video3Url)&&(identical(other.likes, likes) || other.likes == likes)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.bookmarks, bookmarks) || other.bookmarks == bookmarks)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked)&&(identical(other.views, views) || other.views == views)&&(identical(other.replies, replies) || other.replies == replies)&&(identical(other.reposts, reposts) || other.reposts == reposts)&&(identical(other.isReposted, isReposted) || other.isReposted == isReposted)&&(identical(other.isQuoted, isQuoted) || other.isQuoted == isQuoted)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.replyTo, replyTo) || other.replyTo == replyTo)&&(identical(other.repostOf, repostOf) || other.repostOf == repostOf)&&(identical(other.communityNoteOf, communityNoteOf) || other.communityNoteOf == communityNoteOf)&&(identical(other.ballot, ballot) || other.ballot == ballot)&&(identical(other.survey, survey) || other.survey == survey)&&(identical(other.petition, petition) || other.petition == petition)&&(identical(other.meeting, meeting) || other.meeting == meeting)&&const DeepCollectionEquality().equals(other._taggedUsers, _taggedUsers)&&const DeepCollectionEquality().equals(other._taggedSections, _taggedSections)&&(identical(other.isUpvoted, isUpvoted) || other.isUpvoted == isUpvoted)&&(identical(other.isDownvoted, isDownvoted) || other.isDownvoted == isDownvoted)&&(identical(other.upvotes, upvotes) || other.upvotes == upvotes)&&(identical(other.downvotes, downvotes) || other.downvotes == downvotes)&&const DeepCollectionEquality().equals(other._thread, _thread)&&(identical(other.communityNote, communityNote) || other.communityNote == communityNote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,author,status,body,image1Url,image2Url,image3Url,image4Url,video1Url,video2Url,video3Url,likes,isLiked,bookmarks,isBookmarked,views,replies,reposts,isReposted,isQuoted,isDeleted,isActive,publishedAt,replyTo,repostOf,communityNoteOf,ballot,survey,petition,meeting,const DeepCollectionEquality().hash(_taggedUsers),const DeepCollectionEquality().hash(_taggedSections),isUpvoted,isDownvoted,upvotes,downvotes,const DeepCollectionEquality().hash(_thread),communityNote]);

@override
String toString() {
  return 'Post(id: $id, author: $author, status: $status, body: $body, image1Url: $image1Url, image2Url: $image2Url, image3Url: $image3Url, image4Url: $image4Url, video1Url: $video1Url, video2Url: $video2Url, video3Url: $video3Url, likes: $likes, isLiked: $isLiked, bookmarks: $bookmarks, isBookmarked: $isBookmarked, views: $views, replies: $replies, reposts: $reposts, isReposted: $isReposted, isQuoted: $isQuoted, isDeleted: $isDeleted, isActive: $isActive, publishedAt: $publishedAt, replyTo: $replyTo, repostOf: $repostOf, communityNoteOf: $communityNoteOf, ballot: $ballot, survey: $survey, petition: $petition, meeting: $meeting, taggedUsers: $taggedUsers, taggedSections: $taggedSections, isUpvoted: $isUpvoted, isDownvoted: $isDownvoted, upvotes: $upvotes, downvotes: $downvotes, thread: $thread, communityNote: $communityNote)';
}


}

/// @nodoc
abstract mixin class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) _then) = __$PostCopyWithImpl;
@override @useResult
$Res call({
 int id, User author,@PostStatusConverter() PostStatus status, String body,@JsonKey(name: 'image1') String? image1Url,@JsonKey(name: 'image2') String? image2Url,@JsonKey(name: 'image3') String? image3Url,@JsonKey(name: 'image4') String? image4Url,@JsonKey(name: 'video1') String? video1Url,@JsonKey(name: 'video2') String? video2Url,@JsonKey(name: 'video3') String? video3Url, int likes,@JsonKey(name: 'is_liked') bool isLiked, int bookmarks,@JsonKey(name: 'is_bookmarked') bool isBookmarked, int views, int replies, int reposts,@JsonKey(name: 'is_reposted') bool isReposted,@JsonKey(name: 'is_quoted') bool isQuoted,@JsonKey(name: 'is_deleted') bool isDeleted,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'published_at') DateTime publishedAt,@JsonKey(name: 'reply_to') Post? replyTo,@JsonKey(name: 'repost_of') Post? repostOf,@JsonKey(name: 'community_note_of') Post? communityNoteOf, Ballot? ballot, Survey? survey, Petition? petition, Meeting? meeting,@JsonKey(name: 'tagged_users') List<User> taggedUsers,@JsonKey(name: 'tagged_sections') List<Section> taggedSections,@JsonKey(name: 'is_upvoted') bool isUpvoted,@JsonKey(name: 'is_downvoted') bool isDownvoted, int upvotes, int downvotes,@JsonKey(defaultValue: []) List<Post> thread,@JsonKey(name: 'community_note') String communityNote
});


@override $UserCopyWith<$Res> get author;@override $PostCopyWith<$Res>? get replyTo;@override $PostCopyWith<$Res>? get repostOf;@override $PostCopyWith<$Res>? get communityNoteOf;@override $BallotCopyWith<$Res>? get ballot;@override $SurveyCopyWith<$Res>? get survey;@override $PetitionCopyWith<$Res>? get petition;@override $MeetingCopyWith<$Res>? get meeting;

}
/// @nodoc
class __$PostCopyWithImpl<$Res>
    implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(this._self, this._then);

  final _Post _self;
  final $Res Function(_Post) _then;

/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? author = null,Object? status = null,Object? body = null,Object? image1Url = freezed,Object? image2Url = freezed,Object? image3Url = freezed,Object? image4Url = freezed,Object? video1Url = freezed,Object? video2Url = freezed,Object? video3Url = freezed,Object? likes = null,Object? isLiked = null,Object? bookmarks = null,Object? isBookmarked = null,Object? views = null,Object? replies = null,Object? reposts = null,Object? isReposted = null,Object? isQuoted = null,Object? isDeleted = null,Object? isActive = null,Object? publishedAt = null,Object? replyTo = freezed,Object? repostOf = freezed,Object? communityNoteOf = freezed,Object? ballot = freezed,Object? survey = freezed,Object? petition = freezed,Object? meeting = freezed,Object? taggedUsers = null,Object? taggedSections = null,Object? isUpvoted = null,Object? isDownvoted = null,Object? upvotes = null,Object? downvotes = null,Object? thread = null,Object? communityNote = null,}) {
  return _then(_Post(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as User,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PostStatus,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,image1Url: freezed == image1Url ? _self.image1Url : image1Url // ignore: cast_nullable_to_non_nullable
as String?,image2Url: freezed == image2Url ? _self.image2Url : image2Url // ignore: cast_nullable_to_non_nullable
as String?,image3Url: freezed == image3Url ? _self.image3Url : image3Url // ignore: cast_nullable_to_non_nullable
as String?,image4Url: freezed == image4Url ? _self.image4Url : image4Url // ignore: cast_nullable_to_non_nullable
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
as int,isReposted: null == isReposted ? _self.isReposted : isReposted // ignore: cast_nullable_to_non_nullable
as bool,isQuoted: null == isQuoted ? _self.isQuoted : isQuoted // ignore: cast_nullable_to_non_nullable
as bool,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,replyTo: freezed == replyTo ? _self.replyTo : replyTo // ignore: cast_nullable_to_non_nullable
as Post?,repostOf: freezed == repostOf ? _self.repostOf : repostOf // ignore: cast_nullable_to_non_nullable
as Post?,communityNoteOf: freezed == communityNoteOf ? _self.communityNoteOf : communityNoteOf // ignore: cast_nullable_to_non_nullable
as Post?,ballot: freezed == ballot ? _self.ballot : ballot // ignore: cast_nullable_to_non_nullable
as Ballot?,survey: freezed == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as Survey?,petition: freezed == petition ? _self.petition : petition // ignore: cast_nullable_to_non_nullable
as Petition?,meeting: freezed == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting?,taggedUsers: null == taggedUsers ? _self._taggedUsers : taggedUsers // ignore: cast_nullable_to_non_nullable
as List<User>,taggedSections: null == taggedSections ? _self._taggedSections : taggedSections // ignore: cast_nullable_to_non_nullable
as List<Section>,isUpvoted: null == isUpvoted ? _self.isUpvoted : isUpvoted // ignore: cast_nullable_to_non_nullable
as bool,isDownvoted: null == isDownvoted ? _self.isDownvoted : isDownvoted // ignore: cast_nullable_to_non_nullable
as bool,upvotes: null == upvotes ? _self.upvotes : upvotes // ignore: cast_nullable_to_non_nullable
as int,downvotes: null == downvotes ? _self.downvotes : downvotes // ignore: cast_nullable_to_non_nullable
as int,thread: null == thread ? _self._thread : thread // ignore: cast_nullable_to_non_nullable
as List<Post>,communityNote: null == communityNote ? _self.communityNote : communityNote // ignore: cast_nullable_to_non_nullable
as String,
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
$PostCopyWith<$Res>? get communityNoteOf {
    if (_self.communityNoteOf == null) {
    return null;
  }

  return $PostCopyWith<$Res>(_self.communityNoteOf!, (value) {
    return _then(_self.copyWith(communityNoteOf: value));
  });
}/// Create a copy of Post
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
}/// Create a copy of Post
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
}/// Create a copy of Post
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

// dart format on
