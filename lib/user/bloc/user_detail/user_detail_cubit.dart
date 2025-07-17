import 'package:bloc/bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_detail_state.dart';
part 'user_detail_cubit.freezed.dart';

class UserDetailCubit extends Cubit<UserDetailState> {
  UserDetailCubit() : super(const _Initial());

  void loaded({required Map<String, dynamic> payload}) {
    emit(_Loading());
    if (payload['response_status'] == 200) {
      User user = User.fromJson(payload['data']);
      emit(UserLoaded(user: user));
    } else {
      emit(UserDetailFailure(error: payload['errors'][0]));
    }
  }

  void updated({required Map<String, dynamic> payload}) {
    emit(_Loading());
    if (payload['response_status'] == 200) {
      User user = User.fromJson(payload['data']);
      emit(UserUpdated(user: user));
    } else {
      emit(UserDetailFailure(error: payload['errors'][0]));
    }
  }
}
