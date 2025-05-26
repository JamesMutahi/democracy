import 'package:bloc/bloc.dart';
import 'package:democracy/app/auth/bloc/auth/auth_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_change_cubit.freezed.dart';
part 'password_change_state.dart';

class PasswordChangeCubit extends Cubit<PasswordChangeState> {
  PasswordChangeCubit({required this.authRepository})
    : super(const PasswordChangeState.initial());

  void changePassword({
    required String oldPassword,
    required String newPassword1,
    required String newPassword2,
  }) async {
    try {
      emit(const PasswordChangeState.loading());
      String? token = await authRepository.getToken();
      await authRepository.changePassword(
        token: token!,
        oldPassword: oldPassword,
        newPassword1: newPassword1,
        newPassword2: newPassword2,
      );
      emit(const PasswordChangeState.changed());
    } catch (error) {
      emit(PasswordChangeState.failure(error: error.toString()));
    }
  }

  final AuthRepository authRepository;
}
