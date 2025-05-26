import 'package:bloc/bloc.dart';
import 'package:democracy/app/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/app/auth/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_cubit.freezed.dart';
part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit({required this.authRepository})
    : super(const RegistrationState.initial());

  void register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      emit(const RegistrationState.loading());
      User user = await authRepository.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );
      await authRepository.saveUserToSharedPreferences(user: user);
      emit(const RegistrationState.unverified());
    } catch (e) {
      emit(RegistrationState.failure(error: e.toString()));
    }
  }

  void resendOTP() async {
    try {
      emit(const RegistrationState.loading());
      String? token = await authRepository.getToken();
      await authRepository.resendRegistrationOTP(token: token!);
      emit(const RegistrationState.unverified());
    } catch (error) {
      emit(RegistrationState.failure(error: error.toString()));
    }
  }

  void verify({required String code}) async {
    try {
      emit(const RegistrationState.loading());
      String? token = await authRepository.getToken();
      User user = await authRepository.verifyRegistrationOTP(
        token: token!,
        code: code,
      );
      await authRepository.saveUserToSharedPreferences(user: user);
      emit(const RegistrationState.verified());
    } catch (error) {
      emit(RegistrationState.failure(error: error.toString()));
    }
  }

  final AuthRepository authRepository;
}
