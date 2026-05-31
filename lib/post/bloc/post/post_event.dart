part of 'post_bloc.dart';

@freezed
class PostEvent with _$PostEvent {
  const factory PostEvent.load({required int postId}) = _Load;
  const factory PostEvent.loaded({required Map<String, dynamic> payload}) =
      _Loaded;
  const factory PostEvent.updated({required Post post}) = _Updated;
}
