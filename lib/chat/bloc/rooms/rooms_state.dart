part of 'rooms_cubit.dart';

@freezed
class RoomsState with _$RoomsState {
  const factory RoomsState.initial() = RoomsInitial;
  const factory RoomsState.loading() = RoomsLoading;
  const factory RoomsState.loaded({required List<Room> rooms}) = RoomsLoaded;
  const factory RoomsState.failure({required String error}) = RoomsFailure;
}
