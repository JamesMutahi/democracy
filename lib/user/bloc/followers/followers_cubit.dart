import 'package:bloc/bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:equatable/equatable.dart';

part 'followers_state.dart';

class FollowersCubit extends Cubit<FollowersState> {
  FollowersCubit() : super(FollowersState());

  void websocketFailure({required String error}) {
    if (state.status == FollowersStatus.initial ||
        state.status == FollowersStatus.loading) {
      emit(state.copyWith(status: FollowersStatus.failure));
    }
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(state.copyWith(status: FollowersStatus.loading));
    if (payload['response_status'] == 200) {
      final List<User> users = List.from(
        payload['data']['results'].map((e) => User.fromJson(e)),
      );
      int? lastUser = payload['data']['last_user'];
      emit(
        state.copyWith(
          status: FollowersStatus.success,
          users: lastUser == null ? users : [...state.users, ...users],
          hasNext: payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: FollowersStatus.failure));
    }
  }
}
