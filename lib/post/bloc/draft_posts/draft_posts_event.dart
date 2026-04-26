part of 'draft_posts_bloc.dart';

@freezed
sealed class DraftPostsEvent with _$DraftPostsEvent {
  const factory DraftPostsEvent.get() = _Get;
  const factory DraftPostsEvent.add({required DraftPost draft}) = _Add;
  const factory DraftPostsEvent.update({required DraftPost draft}) = _Update;
  const factory DraftPostsEvent.remove({required int id}) = _Remove;
}
