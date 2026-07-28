part of 'reposts_bloc.dart';

@freezed
sealed class RepostsEvent with _$RepostsEvent {
  const factory RepostsEvent.get({required int postId, User? lastUser}) =
      _Get;
  const factory RepostsEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
  const factory RepostsEvent.update({required List<User> users}) = _Update;
}
