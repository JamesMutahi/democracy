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
);

Map<String, dynamic> _$MessageToJson(_Message instance) => <String, dynamic>{
  'id': instance.id,
  'room': instance.room,
  'user': instance.user,
  'text': instance.text,
  'is_read': instance.isRead,
};
