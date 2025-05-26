import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:democracy/app/auth/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';
part 'auth_repository.dart';
part 'auth_provider.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository})
      : super(const AuthState.unAuthenticated()) {
    on<_Authenticate>((event, emit) async {
      await _authenticate(emit);
    });
  }

  Future _authenticate(Emitter<AuthState> emit) async {
    emit(const AuthState.authenticating());
    String? token = await authRepository.getToken();
    if (token == null) {
      emit(const AuthState.unAuthenticated());
    } else {
      User user = await authRepository.getUserFromSharedPreferences();
      emit(AuthState.authenticated(user: user));
    }
  }

  final AuthRepository authRepository;
}
