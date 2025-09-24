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

  const factory WebsocketEvent.getPetitions({
    String? searchTerm,
    Petition? lastPetition,
  }) = _GetPetitions;

  const factory WebsocketEvent.createPetition({
    required String title,
    required String imagePath,
    required String description,
  }) = _CreatePetition;

  const factory WebsocketEvent.resubscribePetitions({
    required List<Petition> petitions,
  }) = _ResubscribePetitions;

  const factory WebsocketEvent.supportPetition({required Petition petition}) =
      _SupportPetition;

  const factory WebsocketEvent.getUserPetitions({
    required User user,
    Petition? lastPetition,
  }) = _GetUserPetitions;

  const factory WebsocketEvent.resubscribeUserPetitions({
    required User user,
    required List<Petition> petitions,
  }) = _ResubscribeUserPetitions;

  const factory WebsocketEvent.unsubscribeUserPetitions({
    required User user,
    required List<Petition> petitions,
  }) = _UnsubscribeUserPetitions;

  const factory WebsocketEvent.getConstitution() = _GetConstitution;

  const factory WebsocketEvent.getConstitutionTags({String? searchTerm}) =
      _GetConstitutionTags;

  const factory WebsocketEvent.bookmarkSection({required Section section}) =
      _BookmarkSection;

  const factory WebsocketEvent.disconnect() = _Disconnect;
}
