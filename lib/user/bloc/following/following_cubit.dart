import 'package:bloc/bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:equatable/equatable.dart';

part 'following_state.dart';

class FollowingCubit extends Cubit<FollowingState> {
  FollowingCubit() : super(FollowingState());

  void websocketFailure({required String error}) {
    if (state.status == FollowingStatus.initial ||
        state.status == FollowingStatus.loading) {
      emit(state.copyWith(status: FollowingStatus.failure));
    }
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(state.copyWith(status: FollowingStatus.loading));
    if (payload['response_status'] == 200) {
      final List<User> users = List.from(
        payload['data']['results'].map((e) => User.fromJson(e)),
      );
      int currentPage = payload['data']['current_page'];
      emit(
        state.copyWith(
          status: FollowingStatus.success,
          users: currentPage == 1 ? users : [...state.users, ...users],
          currentPage: currentPage,
          hasNext: payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: FollowingStatus.failure));
    }
  }
}
