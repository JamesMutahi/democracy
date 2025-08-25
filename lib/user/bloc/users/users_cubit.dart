import 'package:bloc/bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:equatable/equatable.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(const UsersState());

  void websocketFailure({required String error}) {
    if (state.status == UsersStatus.initial ||
        state.status == UsersStatus.loading) {
      emit(state.copyWith(status: UsersStatus.failure));
    }
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(state.copyWith(status: UsersStatus.loading));
    if (payload['response_status'] == 200) {
      final List<User> users = List.from(
        payload['data']['results'].map((e) => User.fromJson(e)),
      );
      int? lastUser = payload['data']['last_user'];
      emit(
        state.copyWith(
          status: UsersStatus.success,
          users: lastUser == null ? users : [...state.users, ...users],
          hasNext: payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: UsersStatus.failure));
    }
  }
}
