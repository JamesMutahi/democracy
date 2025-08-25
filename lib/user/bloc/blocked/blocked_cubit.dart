import 'package:bloc/bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:equatable/equatable.dart';

part 'blocked_state.dart';

class BlockedCubit extends Cubit<BlockedState> {
  BlockedCubit() : super(BlockedState());

  void websocketFailure({required String error}) {
    if (state.status == BlockedStatus.initial ||
        state.status == BlockedStatus.loading) {
      emit(state.copyWith(status: BlockedStatus.failure));
    }
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(state.copyWith(status: BlockedStatus.loading));
    if (payload['response_status'] == 200) {
      final List<User> users = List.from(
        payload['data']['results'].map((e) => User.fromJson(e)),
      );
      int? lastUser = payload['data']['last_user'];
      emit(
        state.copyWith(
          status: BlockedStatus.success,
          users: lastUser == null ? users : [...state.users, ...users],
          hasNext: payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: BlockedStatus.failure));
    }
  }
}
