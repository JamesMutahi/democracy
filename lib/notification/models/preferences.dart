import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferences.freezed.dart';
part 'preferences.g.dart';

@freezed
sealed class Preferences with _$Preferences {
  const factory Preferences({
    @JsonKey(name: 'allow_notifications')
    required final bool allowNotifications,
    @JsonKey(name: 'follow_notifications')
    required final bool followNotifications,
    @JsonKey(name: 'tag_notifications') required final bool tagNotifications,
    @JsonKey(name: 'like_notifications') required final bool likeNotifications,
    @JsonKey(name: 'reply_notifications')
    required final bool replyNotifications,
    @JsonKey(name: 'repost_notifications')
    required final bool repostNotifications,
    @JsonKey(name: 'message_notifications')
    required final bool messageNotifications,
  }) = _Preferences;

  factory Preferences.fromJson(Map<String, Object?> json) =>
      _$PreferencesFromJson(json);
}
