import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/token_storage.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepository, required this.tokenStorage})
    : super(const LoginState.initial());

  void login({required String username, required String password}) async {
    try {
      emit(const LoginState.loading());
      final data = await authRepository.login(
        username: username,
        password: password,
      );
      final accessToken = data['access'] as String;
      final refreshToken = data['refresh'] as String;

      await tokenStorage.saveTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
      emit(const LoginState.loggedIn());
    } catch (e) {
      emit(LoginState.failure(error: e.toString()));
    }
  }

  void logout() async {
    try {
      emit(const LoginState.loading());
      try {
        final refreshToken = await tokenStorage.getRefreshToken();
        await authRepository.logout(refreshToken: refreshToken!);
      } catch (_) {
        // Ignored: failure here does not affect user experience.
      }
      await tokenStorage.clearTokens();
      emit(const LoginState.loggedOut());
    } catch (e) {
      emit(LoginState.failure(error: e.toString()));
    }
  }

  final AuthRepository authRepository;
  final TokenStorage tokenStorage;
}
