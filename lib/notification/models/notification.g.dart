// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Notification _$NotificationFromJson(Map<String, dynamic> json) =>
    _Notification(
      id: (json['id'] as num).toInt(),
      text: json['text'] as String,
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      isLike: json['is_like'] as bool,
      isFollow: json['is_follow'] as bool,
      isSupport: json['is_support'] as bool,
      post: json['post'] == null
          ? null
          : Post.fromJson(json['post'] as Map<String, dynamic>),
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
      chat: const ChatConverter().fromJson(
        json['chat'] as Map<String, dynamic>?,
      ),
      isRead: json['is_read'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$NotificationToJson(_Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'users': instance.users,
      'is_like': instance.isLike,
      'is_follow': instance.isFollow,
      'is_support': instance.isSupport,
      'post': instance.post,
      'ballot': instance.ballot,
      'survey': instance.survey,
      'petition': instance.petition,
      'meeting': instance.meeting,
      'chat': const ChatConverter().toJson(instance.chat),
      'is_read': instance.isRead,
      'created_at': instance.createdAt.toIso8601String(),
    };
