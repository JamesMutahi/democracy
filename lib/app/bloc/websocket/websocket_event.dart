part of 'websocket_bloc.dart';

@freezed
abstract class WebsocketEvent with _$WebsocketEvent {
  const factory WebsocketEvent.connect() = _Connect;

  const factory WebsocketEvent.changeState({required WebsocketState state}) =
      _ChangeState;

  const factory WebsocketEvent.getNotifications() = _GetNotifications;

  const factory WebsocketEvent.markNotificationAsRead({
    required Notification notification,
  }) = _MarkNotificationAsRead;

  const factory WebsocketEvent.getPreferences() = _GetPreferences;

  const factory WebsocketEvent.updatePreferences({
    required bool allowNotifications,
    required bool allowTagNotifications,
    required bool allowLikeNotifications,
    required bool allowReplyNotifications,
    required bool allowRepostNotifications,
    required bool allowMessageNotifications,
    required bool allowFollowNotifications,
  }) = _UpdatePreferences;

  const factory WebsocketEvent.changeUserNotificationStatus({
    required User user,
  }) = _ChangeUserNotificationStatus;

  const factory WebsocketEvent.getConstitution() = _GetConstitution;

  const factory WebsocketEvent.getConstitutionTags({String? searchTerm}) =
      _GetConstitutionTags;

  const factory WebsocketEvent.bookmarkSection({required Section section}) =
      _BookmarkSection;

  const factory WebsocketEvent.disconnect() = _Disconnect;
}
