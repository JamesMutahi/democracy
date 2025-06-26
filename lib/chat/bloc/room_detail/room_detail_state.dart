part of 'room_detail_cubit.dart';

@freezed
class RoomDetailState with _$RoomDetailState {
  const factory RoomDetailState.initial() = RoomDetailInitial;
  const factory RoomDetailState.loading() = RoomDetailLoading;
  const factory RoomDetailState.roomCreated({required Room room}) = RoomCreated;
  const factory RoomDetailState.messageCreated({required Room room}) =
      MessageCreated;
  const factory RoomDetailState.failure() = RoomDetailFailure;
}
