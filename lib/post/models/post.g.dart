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
  image1Url: json['image1Url'] as String?,
  image2Url: json['image2Url'] as String?,
  image3Url: json['image3Url'] as String?,
  image4Url: json['image4Url'] as String?,
  image5Url: json['image5Url'] as String?,
  image6Url: json['image6Url'] as String?,
  video1Url: json['video1Url'] as String?,
  video2Url: json['video2Url'] as String?,
  video3Url: json['video3Url'] as String?,
  likes: (json['likes'] as num).toInt(),
  isLiked: json['is_liked'] as bool,
  bookmarks: (json['bookmarks'] as num).toInt(),
  isBookmarked: json['is_bookmarked'] as bool,
  views: (json['views'] as num).toInt(),
  replies: (json['replies'] as num).toInt(),
  reposts: (json['reposts'] as num).toInt(),
  isEdited: json['is_edited'] as bool,
  isDeleted: json['is_deleted'] as bool,
  isActive: json['is_active'] as bool,
  publishedAt: DateTime.parse(json['published_at'] as String),
  replyTo:
      json['reply_to'] == null
          ? null
          : Post.fromJson(json['reply_to'] as Map<String, dynamic>),
  repostOf:
      json['repost_of'] == null
          ? null
          : Post.fromJson(json['repost_of'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PostToJson(_Post instance) => <String, dynamic>{
  'id': instance.id,
  'author': instance.author,
  'status': const PostStatusConverter().toJson(instance.status),
  'body': instance.body,
  'image1Url': instance.image1Url,
  'image2Url': instance.image2Url,
  'image3Url': instance.image3Url,
  'image4Url': instance.image4Url,
  'image5Url': instance.image5Url,
  'image6Url': instance.image6Url,
  'video1Url': instance.video1Url,
  'video2Url': instance.video2Url,
  'video3Url': instance.video3Url,
  'likes': instance.likes,
  'is_liked': instance.isLiked,
  'bookmarks': instance.bookmarks,
  'is_bookmarked': instance.isBookmarked,
  'views': instance.views,
  'replies': instance.replies,
  'reposts': instance.reposts,
  'is_edited': instance.isEdited,
  'is_deleted': instance.isDeleted,
  'is_active': instance.isActive,
  'published_at': instance.publishedAt.toIso8601String(),
  'reply_to': instance.replyTo,
  'repost_of': instance.repostOf,
};
