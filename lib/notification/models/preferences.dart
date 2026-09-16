import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferences.freezed.dart';
part 'preferences.g.dart';

@freezed
sealed class Preferences with _$Preferences {
  const factory Preferences({
    @JsonKey(name: 'allow_notifications') required bool allowNotifications,
    @JsonKey(name: 'allow_follow_notifications')
    required bool allowFollowNotifications,
    @JsonKey(name: 'allow_tag_notifications')
    required bool allowTagNotifications,
    @JsonKey(name: 'allow_like_notifications')
    required bool allowLikeNotifications,
    @JsonKey(name: 'allow_reply_notifications')
    required bool allowReplyNotifications,
    @JsonKey(name: 'allow_repost_notifications')
    required bool allowRepostNotifications,
    @JsonKey(name: 'allow_message_notifications')
    required bool allowMessageNotifications,
    @JsonKey(name: 'messaging_preference')
    @MessagingPreferenceConverter()
    required MessagingPreference messagingPreference,
    @JsonKey(name: 'allow_petition_notifications')
    required bool allowPetitionNotifications,
    @JsonKey(name: 'allow_petition_supporter_notifications')
    required bool allowPetitionSupporterNotifications,
  }) = _Preferences;

  factory Preferences.fromJson(Map<String, Object?> json) =>
      _$PreferencesFromJson(json);
}

enum MessagingPreference { anyone, following }

class MessagingPreferenceConverter
    implements JsonConverter<MessagingPreference, String> {
  const MessagingPreferenceConverter();

  @override
  MessagingPreference fromJson(String data) {
    late MessagingPreference type;
    switch (data) {
      case 'anyone':
        type = MessagingPreference.anyone;
      case 'following':
        type = MessagingPreference.following;
    }
    return type;
  }

  @override
  String toJson(MessagingPreference object) {
    switch (object) {
      case MessagingPreference.anyone:
        return 'anyone';
      case MessagingPreference.following:
        return 'following';
    }
  }
}
