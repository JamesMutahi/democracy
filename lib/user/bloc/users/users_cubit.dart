import 'package:bloc/bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_state.dart';
part 'users_cubit.freezed.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(const UsersInitial());

  void websocketFailure({required String error}) {
    if (state is UsersInitial || state is UsersLoading) {
      emit(UsersFailure(error: error));
    }
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(UsersLoading());
    if (payload['response_status'] == 200) {
      List<User> users = List.from(
        payload['data'].map((e) => User.fromJson(e)),
      );
      emit(UsersLoaded(users: users));
    } else {
      emit(UsersFailure(error: payload['errors'].toString()));
    }
  }
}
