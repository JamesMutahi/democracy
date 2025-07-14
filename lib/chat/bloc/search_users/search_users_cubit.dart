import 'package:bloc/bloc.dart';
import 'package:democracy/auth/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_users_state.dart';
part 'search_users_cubit.freezed.dart';

class SearchUsersCubit extends Cubit<SearchUsersState> {
  SearchUsersCubit() : super(const SearchUsersInitial());

  void websocketFailure({required String error}) {
    if (state is SearchUsersInitial || state is SearchUsersLoading) {
      emit(SearchUsersFailure(error: error));
    }
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(SearchUsersLoading());
    if (payload['response_status'] == 200) {
      List<User> users = List.from(
        payload['data'].map((e) => User.fromJson(e)),
      );
      emit(SearchUsersLoaded(users: users));
    } else {
      emit(SearchUsersFailure(error: payload['errors'].toString()));
    }
  }
}
