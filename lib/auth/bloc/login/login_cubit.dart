import 'package:bloc/bloc.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepository})
    : super(const LoginState.initial());

  void login({required String email, required String password}) async {
    try {
      emit(const LoginState.loading());
      String token = await authRepository.login(
        email: email,
        password: password,
      );
      await authRepository.saveToken(token: token);
      emit(const LoginState.loggedIn());
    } catch (e) {
      emit(LoginState.failure(error: e.toString()));
    }
  }

  void logout() async {
    try {
      emit(const LoginState.loading());
      String? token = await authRepository.getToken();
      try {
        await authRepository.logout(token: token!);
      } catch (e) {
        //
      }
      await authRepository.deleteToken();
      emit(const LoginState.loggedOut());
    } catch (e) {
      emit(LoginState.failure(error: e.toString()));
    }
  }

  final AuthRepository authRepository;
}
