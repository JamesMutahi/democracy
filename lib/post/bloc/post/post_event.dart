part of 'post_bloc.dart';

@freezed
class PostEvent with _$PostEvent {
  const factory PostEvent.load({required int postId}) = _Load;

  const factory PostEvent.loaded({required Map<String, dynamic> payload}) =
      _Loaded;

  const factory PostEvent.postCreated({required Post post}) = _PostCreated;

  const factory PostEvent.detailUpdated({
    required int postId,
    required int likes,
    required int bookmarks,
    required int views,
    required int replies,
    required int reposts,
    required String communityNote,
    required int upvotes,
    required int downvotes,
    required bool isDeleted,
    required bool isActive,
  }) = _DetailUpdated;

  const factory PostEvent.likeUpdated({
    required bool isLiked,
    required int likes,
  }) = _LikeUpdated;

  const factory PostEvent.bookmarkUpdated({
    required bool isBookmarked,
    required int bookmarks,
  }) = _BookmarkUpdated;

  const factory PostEvent.upvoteUpdated({
    required bool isUpvoted,
    required int upvotes,
    required bool isDownvoted,
    required int downvotes,
  }) = _UpvoteUpdated;

  const factory PostEvent.downvoteUpdated({
    required bool isUpvoted,
    required int upvotes,
    required bool isDownvoted,
    required int downvotes,
  }) = _DownvoteUpdated;

  const factory PostEvent.authorUpdated({required User user}) = _AuthorUpdated;

  const factory PostEvent.ballotUpdated({required Ballot ballot}) =
      _BallotUpdated;

  const factory PostEvent.broadcastUpdated({required Broadcast broadcast}) =
      _BroadcastUpdated;

  const factory PostEvent.surveyUpdated({required Survey survey}) =
      _SurveyUpdated;

  const factory PostEvent.petitionUpdated({required Petition petition}) =
      _PetitionUpdated;
}
