part of 'preferences_bloc.dart';

@freezed
sealed class PreferencesEvent with _$PreferencesEvent {
  const factory PreferencesEvent.get() = _Get;
  const factory PreferencesEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory PreferencesEvent.update({
    required bool allowNotifications,
    required bool allowTagNotifications,
    required bool allowLikeNotifications,
    required bool allowReplyNotifications,
    required bool allowRepostNotifications,
    required bool allowMessageNotifications,
    required bool allowFollowNotifications,
  }) = _Update;
}
