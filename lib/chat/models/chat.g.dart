// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Chat _$ChatFromJson(Map<String, dynamic> json) => _Chat(
  id: (json['id'] as num).toInt(),
  users:
      (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
  lastMessage:
      json['last_message'] == null
          ? null
          : Message.fromJson(json['last_message'] as Map<String, dynamic>),
  unreadMessages: (json['unread_messages'] as num).toInt(),
);

Map<String, dynamic> _$ChatToJson(_Chat instance) => <String, dynamic>{
  'id': instance.id,
  'users': instance.users,
  'last_message': instance.lastMessage,
  'unread_messages': instance.unreadMessages,
};
