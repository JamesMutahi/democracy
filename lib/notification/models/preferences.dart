import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferences.freezed.dart';
part 'preferences.g.dart';

@freezed
sealed class Preferences with _$Preferences {
  const factory Preferences({
    @JsonKey(name: 'allow_notifications')
    required final bool allowNotifications,
    @JsonKey(name: 'allow_follow_notifications')
    required final bool allowFollowNotifications,
    @JsonKey(name: 'allow_tag_notifications')
    required final bool allowTagNotifications,
    @JsonKey(name: 'allow_like_notifications')
    required final bool allowLikeNotifications,
    @JsonKey(name: 'allow_reply_notifications')
    required final bool allowReplyNotifications,
    @JsonKey(name: 'allow_repost_notifications')
    required final bool allowRepostNotifications,
    @JsonKey(name: 'allow_message_notifications')
    required final bool allowMessageNotifications,
  }) = _Preferences;

  factory Preferences.fromJson(Map<String, Object?> json) =>
      _$PreferencesFromJson(json);
}
