part of 'post_bloc.dart';

@freezed
class PostEvent with _$PostEvent {
  const factory PostEvent.initialize() = _Initialize;

  const factory PostEvent.getPosts() = GetPosts;

  const factory PostEvent.filter({
    required String? searchTerm,
  }) = _Filter;

  const factory PostEvent.reload() = _Reload;
}
