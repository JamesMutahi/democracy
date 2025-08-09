// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Preferences _$PreferencesFromJson(Map<String, dynamic> json) => _Preferences(
  allowNotifications: json['allow_notifications'] as bool,
  followNotifications: json['follow_notifications'] as bool,
  tagNotifications: json['tag_notifications'] as bool,
  likeNotifications: json['like_notifications'] as bool,
  replyNotifications: json['reply_notifications'] as bool,
  repostNotifications: json['repost_notifications'] as bool,
  messageNotifications: json['message_notifications'] as bool,
);

Map<String, dynamic> _$PreferencesToJson(_Preferences instance) =>
    <String, dynamic>{
      'allow_notifications': instance.allowNotifications,
      'follow_notifications': instance.followNotifications,
      'tag_notifications': instance.tagNotifications,
      'like_notifications': instance.likeNotifications,
      'reply_notifications': instance.replyNotifications,
      'repost_notifications': instance.repostNotifications,
      'message_notifications': instance.messageNotifications,
    };
