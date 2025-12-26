// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Post _$PostFromJson(Map<String, dynamic> json) => _Post(
  id: (json['id'] as num).toInt(),
  author: User.fromJson(json['author'] as Map<String, dynamic>),
  status: const PostStatusConverter().fromJson(json['status'] as String),
  body: json['body'] as String,
  image1Url: json['image1'] as String?,
  image2Url: json['image2'] as String?,
  image3Url: json['image3'] as String?,
  image4Url: json['image4'] as String?,
  image5Url: json['image5'] as String?,
  image6Url: json['image6'] as String?,
  video1Url: json['video1'] as String?,
  video2Url: json['video2'] as String?,
  video3Url: json['video3'] as String?,
  likes: (json['likes'] as num).toInt(),
  isLiked: json['is_liked'] as bool,
  bookmarks: (json['bookmarks'] as num).toInt(),
  isBookmarked: json['is_bookmarked'] as bool,
  views: (json['views'] as num).toInt(),
  replies: (json['replies'] as num).toInt(),
  reposts: (json['reposts'] as num).toInt(),
  isReposted: json['is_reposted'] as bool,
  isQuoted: json['is_quoted'] as bool,
  isDeleted: json['is_deleted'] as bool,
  isActive: json['is_active'] as bool,
  publishedAt: DateTime.parse(json['published_at'] as String),
  replyTo: json['reply_to'] == null
      ? null
      : Post.fromJson(json['reply_to'] as Map<String, dynamic>),
  repostOf: json['repost_of'] == null
      ? null
      : Post.fromJson(json['repost_of'] as Map<String, dynamic>),
  ballot: json['ballot'] == null
      ? null
      : Ballot.fromJson(json['ballot'] as Map<String, dynamic>),
  survey: json['survey'] == null
      ? null
      : Survey.fromJson(json['survey'] as Map<String, dynamic>),
  petition: json['petition'] == null
      ? null
      : Petition.fromJson(json['petition'] as Map<String, dynamic>),
  meeting: json['meeting'] == null
      ? null
      : Meeting.fromJson(json['meeting'] as Map<String, dynamic>),
  taggedUsers: (json['tagged_users'] as List<dynamic>)
      .map((e) => User.fromJson(e as Map<String, dynamic>))
      .toList(),
  taggedSections: (json['tagged_sections'] as List<dynamic>)
      .map((e) => Section.fromJson(e as Map<String, dynamic>))
      .toList(),
  thread:
      (json['thread'] as List<dynamic>?)
          ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  communityNote: json['community_note'] == null
      ? null
      : CommunityNote.fromJson(json['community_note'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PostToJson(_Post instance) => <String, dynamic>{
  'id': instance.id,
  'author': instance.author,
  'status': const PostStatusConverter().toJson(instance.status),
  'body': instance.body,
  'image1': instance.image1Url,
  'image2': instance.image2Url,
  'image3': instance.image3Url,
  'image4': instance.image4Url,
  'image5': instance.image5Url,
  'image6': instance.image6Url,
  'video1': instance.video1Url,
  'video2': instance.video2Url,
  'video3': instance.video3Url,
  'likes': instance.likes,
  'is_liked': instance.isLiked,
  'bookmarks': instance.bookmarks,
  'is_bookmarked': instance.isBookmarked,
  'views': instance.views,
  'replies': instance.replies,
  'reposts': instance.reposts,
  'is_reposted': instance.isReposted,
  'is_quoted': instance.isQuoted,
  'is_deleted': instance.isDeleted,
  'is_active': instance.isActive,
  'published_at': instance.publishedAt.toIso8601String(),
  'reply_to': instance.replyTo,
  'repost_of': instance.repostOf,
  'ballot': instance.ballot,
  'survey': instance.survey,
  'petition': instance.petition,
  'meeting': instance.meeting,
  'tagged_users': instance.taggedUsers,
  'tagged_sections': instance.taggedSections,
  'thread': instance.thread,
  'community_note': instance.communityNote,
};
