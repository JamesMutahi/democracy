import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/models/user.dart';

part 'password_reset_state.dart';
part 'password_reset_cubit.freezed.dart';

class PasswordResetCubit extends Cubit<PasswordResetState> {
  PasswordResetCubit({required this.authRepository})
      : super(const PasswordResetState.initial());

  void verifyEmail({required String email}) async {
    try {
      emit(const PasswordResetState.loading());
      await authRepository.verifyEmail(email: email);
      await authRepository.holdEmail(email: email);
      emit(PasswordResetState.emailVerified(email: email));
    } catch (e) {
      emit(PasswordResetState.failure(error: e.toString()));
    }
  }

  void verifyCode({required String code}) async {
    try {
      emit(const PasswordResetState.loading());
      String email = await authRepository.getEmail();
      User user = await authRepository.verifyPasswordResetOTP(
        email: email,
        code: code,
      );
      await authRepository.saveUserToSharedPreferences(user: user);
      emit(const PasswordResetState.codeVerified());
    } catch (e) {
      emit(PasswordResetState.failure(error: e.toString()));
    }
  }

  void resendOTP() async {
    try {
      emit(const PasswordResetState.loading());
      String email = await authRepository.getEmail();
      await authRepository.verifyEmail(email: email);
      emit(PasswordResetState.emailVerified(email: email));
    } catch (error) {
      emit(PasswordResetState.failure(error: error.toString()));
    }
  }

  void resetPassword({
    required String password1,
    required String password2,
  }) async {
    try {
      emit(const PasswordResetState.loading());
      String? token = await authRepository.getToken();
      await authRepository.resetPassword(
        token: token!,
        password1: password1,
        password2: password2,
      );
      emit(const PasswordResetState.resetComplete());
    } catch (e) {
      emit(PasswordResetState.failure(error: e.toString()));
    }
  }

  final AuthRepository authRepository;
}
