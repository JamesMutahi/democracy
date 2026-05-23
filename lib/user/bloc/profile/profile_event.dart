part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.load({required int userId}) = _Load;
  const factory ProfileEvent.loaded({required Map<String, dynamic> payload}) =
      _Loaded;
  const factory ProfileEvent.updated({required User user}) = _Updated;
}
