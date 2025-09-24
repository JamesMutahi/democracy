import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'websocket_event.dart';

part 'websocket_state.dart';

part 'websocket_bloc.freezed.dart';

class WebsocketBloc extends Bloc<WebsocketEvent, WebsocketState> {
  WebsocketBloc({required this.authRepository, required this.webSocketService})
    : super(const WebsocketState()) {
    on<_Connect>((event, emit) async {
      _onConnect(emit);
    });
    on<_ChangeState>((event, emit) => emit(event.state));
    on<_Disconnect>((event, emit) async {
      await webSocketService.disconnect();
      emit(WebsocketState());
    });
  }

  Future _onConnect(Emitter<WebsocketState> emit) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    try {
      String? token = await authRepository.getToken();
      String url = dotenv.env['WEBSOCKET_URL']!;
      await webSocketService.connect(url, token!);
      add(
        _ChangeState(
          state: state.copyWith(
            status: WebsocketStatus.connected,
            initialConnectionAchieved: true,
          ),
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: WebsocketStatus.failure));
    }
  }

  final AuthRepository authRepository;
  final WebSocketService webSocketService;
}
