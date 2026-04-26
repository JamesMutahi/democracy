part of 'user_detail_bloc.dart';

@freezed
sealed class UserDetailEvent with _$UserDetailEvent {
  const factory UserDetailEvent.retrieved({
    required Map<String, dynamic> payload,
  }) = _Retrieved;

  const factory UserDetailEvent.updated({
    required Map<String, dynamic> payload,
  }) = _Updated;

  const factory UserDetailEvent.get({required int userId}) = _Get;

  const factory UserDetailEvent.patch({
    required User user,
    required String name,
    required String bio,
    required String? imagePath,
    required String? coverPhotoPath,
  }) = _Patch;

  const factory UserDetailEvent.follow({required User user}) = _Follow;

  const factory UserDetailEvent.mute({required User user}) = _Mute;

  const factory UserDetailEvent.block({required User user}) = _Block;

  const factory UserDetailEvent.addVisit({required User user}) = _AddVisit;

  const factory UserDetailEvent.visitAdded({
    required Map<String, dynamic> payload,
  }) = _VisitAdded;

  const factory UserDetailEvent.toggleNotifications({required User user}) =
      _ToggleNotifications;

  const factory UserDetailEvent.unsubscribe({required User user}) =
      _Unsubscribe;
}
