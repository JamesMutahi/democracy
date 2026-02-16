part of 'for_you_bloc.dart';

@freezed
sealed class ForYouEvent with _$ForYouEvent {
  const factory ForYouEvent.get({List<Post>? previousPosts}) = _Get;
  const factory ForYouEvent.received({required Map<String, dynamic> payload}) =
      _Received;
}
