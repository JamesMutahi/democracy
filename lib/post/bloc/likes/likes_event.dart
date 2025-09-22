part of 'likes_bloc.dart';

@freezed
sealed class LikesEvent with _$LikesEvent {
  const factory LikesEvent.get({required User user, Post? lastPost}) = _Get;
  const factory LikesEvent.received({required Map<String, dynamic> payload}) =
      _Received;
}
