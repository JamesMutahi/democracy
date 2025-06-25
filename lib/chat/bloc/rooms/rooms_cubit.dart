import 'package:bloc/bloc.dart';
import 'package:democracy/chat/models/room.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rooms_state.dart';
part 'rooms_cubit.freezed.dart';

class RoomsCubit extends Cubit<RoomsState> {
  RoomsCubit() : super(const RoomsState.initial());

  void websocketFailure({required String error}) {
    if (state is RoomsInitial || state is RoomsLoading) {
      emit(RoomsFailure(error: error));
    }
  }

  void retryButtonPressed() {
    emit(RoomsInitial());
  }

  void loadRooms({required Map<String, dynamic> payload}) {
    if (payload['response_status'] == 200) {
      final List<Room> rooms = List.from(
        payload['data'].map((e) => Room.fromJson(e)),
      );
      emit(RoomsLoaded(rooms: rooms));
    } else {
      emit(RoomsFailure(error: payload['errors'].toString()));
    }
  }
}
