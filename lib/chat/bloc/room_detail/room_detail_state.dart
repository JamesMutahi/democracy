part of 'room_detail_cubit.dart';

@freezed
class RoomDetailState with _$RoomDetailState {
  const factory RoomDetailState.initial() = RoomDetailInitial;
  const factory RoomDetailState.loading() = RoomDetailLoading;
  const factory RoomDetailState.roomCreated({required Room room}) = RoomCreated;
  const factory RoomDetailState.messageCreated({required Room room}) =
      MessageCreated;
  const factory RoomDetailState.messageEdited({
    required Room room,
    required Message message,
  }) = MessageEdited;
  const factory RoomDetailState.messageDeleted({
    required Room room,
    required Message message,
  }) = MessageDeleted;
  const factory RoomDetailState.markedAsRead({
    required Room room,
  }) = MarkedAsRead;
  const factory RoomDetailState.failure() = RoomDetailFailure;
}
