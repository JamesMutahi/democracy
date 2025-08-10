// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Preferences _$PreferencesFromJson(Map<String, dynamic> json) => _Preferences(
  allowNotifications: json['allow_notifications'] as bool,
  allowFollowNotifications: json['allow_follow_notifications'] as bool,
  allowTagNotifications: json['allow_tag_notifications'] as bool,
  allowLikeNotifications: json['allow_like_notifications'] as bool,
  allowReplyNotifications: json['allow_reply_notifications'] as bool,
  allowRepostNotifications: json['allow_repost_notifications'] as bool,
  allowMessageNotifications: json['allow_message_notifications'] as bool,
);

Map<String, dynamic> _$PreferencesToJson(_Preferences instance) =>
    <String, dynamic>{
      'allow_notifications': instance.allowNotifications,
      'allow_follow_notifications': instance.allowFollowNotifications,
      'allow_tag_notifications': instance.allowTagNotifications,
      'allow_like_notifications': instance.allowLikeNotifications,
      'allow_reply_notifications': instance.allowReplyNotifications,
      'allow_repost_notifications': instance.allowRepostNotifications,
      'allow_message_notifications': instance.allowMessageNotifications,
    };
