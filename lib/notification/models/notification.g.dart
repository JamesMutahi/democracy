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
      ballot:
          json['ballot'] == null
              ? null
              : Ballot.fromJson(json['ballot'] as Map<String, dynamic>),
      survey:
          json['survey'] == null
              ? null
              : Survey.fromJson(json['survey'] as Map<String, dynamic>),
      petition:
          json['petition'] == null
              ? null
              : Petition.fromJson(json['petition'] as Map<String, dynamic>),
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
      'ballot': instance.ballot,
      'survey': instance.survey,
      'petition': instance.petition,
      'chat': instance.chat,
      'created_at': instance.createdAt.toIso8601String(),
    };
