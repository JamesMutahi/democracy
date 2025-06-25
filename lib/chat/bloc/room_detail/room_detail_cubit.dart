import 'package:bloc/bloc.dart';
import 'package:democracy/chat/models/room.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_detail_state.dart';
part 'room_detail_cubit.freezed.dart';

class RoomDetailCubit extends Cubit<RoomDetailState> {
  RoomDetailCubit() : super(const RoomDetailState.initial());

  void websocketFailure({required String error}) {
    if (state is RoomDetailInitial || state is RoomDetailLoading) {
      emit(RoomDetailFailure());
    }
  }

  void created({required Map<String, dynamic> payload}) {
    emit(RoomDetailLoading());
    if (payload['response_status'] == 201) {
      final Room room = Room.fromJson(payload['data']);
      emit(RoomCreated(room: room));
    } else {
      emit(RoomDetailFailure());
    }
  }
}
