part of 'room_detail_cubit.dart';

@freezed
class RoomDetailState with _$RoomDetailState {
  const factory RoomDetailState.initial() = RoomDetailInitial;
  const factory RoomDetailState.loading() = RoomDetailLoading;
  const factory RoomDetailState.created({required Room room}) = RoomCreated;
  const factory RoomDetailState.failure() = RoomDetailFailure;
}
