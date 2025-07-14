// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Notification _$NotificationFromJson(Map<String, dynamic> json) =>
    _Notification(
      id: (json['id'] as num).toInt(),
      text: json['text'] as String,
      isRead: json['is_read'] as bool,
      post:
          json['post'] == null
              ? null
              : Post.fromJson(json['post'] as Map<String, dynamic>),
      poll:
          json['poll'] == null
              ? null
              : Poll.fromJson(json['poll'] as Map<String, dynamic>),
      survey:
          json['survey'] == null
              ? null
              : Survey.fromJson(json['survey'] as Map<String, dynamic>),
      chat:
          json['chat'] == null
              ? null
              : Chat.fromJson(json['chat'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$NotificationToJson(_Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'is_read': instance.isRead,
      'post': instance.post,
      'poll': instance.poll,
      'survey': instance.survey,
      'chat': instance.chat,
      'created_at': instance.createdAt.toIso8601String(),
    };
