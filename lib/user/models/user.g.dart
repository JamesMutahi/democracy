// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: (json['id'] as num).toInt(),
  username: json['username'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  image: json['image'] as String,
  coverPhoto: json['cover_photo'] as String,
  bio: json['bio'] as String,
  muted:
      (json['muted'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
  blocked:
      (json['blocked'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
  following: (json['following'] as num).toInt(),
  followers: (json['followers'] as num).toInt(),
  isActive: json['is_active'] as bool,
  dateJoined: DateTime.parse(json['date_joined'] as String),
  isMuted: json['is_muted'] as bool,
  isBlocked: json['is_blocked'] as bool,
  hasBlocked: json['has_blocked'] as bool,
  isFollowed: json['is_followed'] as bool,
  isNotifying: json['is_notifying'] as bool,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'name': instance.name,
  'email': instance.email,
  'image': instance.image,
  'cover_photo': instance.coverPhoto,
  'bio': instance.bio,
  'muted': instance.muted,
  'blocked': instance.blocked,
  'following': instance.following,
  'followers': instance.followers,
  'is_active': instance.isActive,
  'date_joined': instance.dateJoined.toIso8601String(),
  'is_muted': instance.isMuted,
  'is_blocked': instance.isBlocked,
  'has_blocked': instance.hasBlocked,
  'is_followed': instance.isFollowed,
  'is_notifying': instance.isNotifying,
};
