import 'package:bloc/bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:equatable/equatable.dart';

part 'muted_state.dart';

class MutedCubit extends Cubit<MutedState> {
  MutedCubit() : super(MutedState());

  void websocketFailure({required String error}) {
    if (state.status == MutedStatus.initial ||
        state.status == MutedStatus.loading) {
      emit(state.copyWith(status: MutedStatus.failure));
    }
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(state.copyWith(status: MutedStatus.loading));
    if (payload['response_status'] == 200) {
      final List<User> users = List.from(
        payload['data']['results'].map((e) => User.fromJson(e)),
      );
      int currentPage = payload['data']['current_page'];
      emit(
        state.copyWith(
          status: MutedStatus.success,
          users: currentPage == 1 ? users : [...state.users, ...users],
          currentPage: currentPage,
          hasNext: payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: MutedStatus.failure));
    }
  }
}
