import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/token_interceptor.dart';
import 'package:democracy/app/bloc/services/token_storage.dart';
import 'package:democracy/user/models/user.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_provider.dart';
part 'auth_repository.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.authRepository,
    required this.tokenStorage,
    required this.tokenInterceptor,
  }) : super(const AuthState()) {
    on<_Authenticate>((event, emit) async {
      await _authenticate(emit);
    });
    on<_TokenExpired>(_onTokenExpired);
    on<_UpdateUser>((event, emit) {
      emit(state.copyWith(user: event.user));
    });
  }

  Future _authenticate(Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.authenticating));
    try {
      String? token = await tokenStorage.getAccessToken();
      if (token == null || token.isEmpty) {
        emit(const AuthState());
      } else {
        User user = await authRepository.getUserFromAPI();
        emit(state.copyWith(status: AuthStatus.authenticated, user: user));
      }
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.failure, error: e.toString()));
    }

    _listenToTokenExpired();
  }

  void _listenToTokenExpired() {
    _tokenExpiredSubscription = tokenInterceptor.onTokenExpired.listen((_) {
      add(_TokenExpired());
    });
  }

  void _onTokenExpired(_TokenExpired event, Emitter<AuthState> emit) {
    emit(AuthState());
  }

  @override
  Future<void> close() async {
    await _tokenExpiredSubscription?.cancel();
    tokenInterceptor.dispose();
    await super.close();
  }

  StreamSubscription? _tokenExpiredSubscription;
  final AuthRepository authRepository;
  final TokenStorage tokenStorage;
  final TokenInterceptor tokenInterceptor;
}
