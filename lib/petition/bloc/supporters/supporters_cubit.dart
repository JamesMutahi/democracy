import 'package:bloc/bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:equatable/equatable.dart';

part 'supporters_state.dart';

class SupportersCubit extends Cubit<SupportersState> {
  SupportersCubit() : super(SupportersState());

  void websocketFailure({required String error}) {
    emit(state.copyWith(status: SupportersStatus.failure));
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(state.copyWith(status: SupportersStatus.loading));
    if (payload['response_status'] == 200) {
      final List<User> users = List.from(
        payload['data']['results'].map((e) => User.fromJson(e)),
      );
      int? lastUser = payload['data']['last_user'];
      emit(
        state.copyWith(
          status: SupportersStatus.success,
          users: lastUser == null ? users : [...state.users, ...users],
          hasNext: payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: SupportersStatus.failure));
    }
  }
}
