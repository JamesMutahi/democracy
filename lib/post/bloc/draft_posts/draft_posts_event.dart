part of 'draft_posts_bloc.dart';

@freezed
sealed class DraftPostsEvent with _$DraftPostsEvent {
  const factory DraftPostsEvent.get({Post? lastPost}) = _Get;
  const factory DraftPostsEvent.received({
    required Map<String, dynamic> payload,
  }) = _Received;
}
