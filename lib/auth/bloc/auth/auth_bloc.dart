import 'package:bloc/bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_provider.dart';
part 'auth_repository.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository}) : super(const AuthState()) {
    on<_Authenticate>((event, emit) async {
      await _authenticate(emit);
    });
    on<_UpdateUser>((event, emit) {
      emit(state.copyWith(user: event.user));
    });
  }

  Future _authenticate(Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.authenticating));
    try {
      String? token = await authRepository.getToken();
      if (token == null) {
        emit(const AuthState());
      } else {
        User user = await authRepository.getUserFromAPI(token: token);
        emit(state.copyWith(status: AuthStatus.authenticated, user: user));
      }
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.failure, error: e.toString()));
    }
  }

  final AuthRepository authRepository;
}
