// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Message _$MessageFromJson(Map<String, dynamic> json) => _Message(
  id: (json['id'] as num).toInt(),
  room: (json['room'] as num).toInt(),
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  text: json['text'] as String,
  isRead: json['is_read'] as bool,
  isDeleted: json['is_deleted'] as bool,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$MessageToJson(_Message instance) => <String, dynamic>{
  'id': instance.id,
  'room': instance.room,
  'user': instance.user,
  'text': instance.text,
  'is_read': instance.isRead,
  'is_deleted': instance.isDeleted,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
