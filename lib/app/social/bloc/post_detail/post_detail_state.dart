part of 'post_detail_cubit.dart';

@freezed
class PostDetailState with _$PostDetailState {
  const factory PostDetailState.initial() = _Initial;
  const factory PostDetailState.loading() = _Loading;
  const factory PostDetailState.created({required Post post}) = _Created;
  const factory PostDetailState.edited({required Post post}) = _Edited;
  const factory PostDetailState.deleted() = _Deleted;
  const factory PostDetailState.reported() = _Reported;
  const factory PostDetailState.failure({required String error}) = _Failure;
}
