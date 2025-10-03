part of 'user_detail_bloc.dart';

@freezed
sealed class UserDetailEvent with _$UserDetailEvent {
  const factory UserDetailEvent.retrieved({
    required Map<String, dynamic> payload,
  }) = _Retrieved;

  const factory UserDetailEvent.updated({
    required Map<String, dynamic> payload,
  }) = _Updated;

  const factory UserDetailEvent.get({required User user}) = _Get;

  const factory UserDetailEvent.update({
    required User user,
    required String name,
    required String bio,
    required String? imagePath,
    required String? coverPhotoPath,
  }) = _Update;

  const factory UserDetailEvent.follow({required User user}) = _Follow;

  const factory UserDetailEvent.mute({required User user}) = _Mute;

  const factory UserDetailEvent.block({required User user}) = _Block;
}
