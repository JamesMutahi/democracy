import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_transform/stream_transform.dart';

part 'websocket_event.dart';
part 'websocket_state.dart';
part 'websocket_bloc.freezed.dart';

EventTransformer<E> droppableThrottled<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class WebsocketBloc extends Bloc<WebsocketEvent, WebsocketState> {
  WebsocketBloc({required this.authRepository, required this.webSocketService})
    : super(const WebsocketState()) {
    on<_Connect>(
      (event, emit) async => _onConnect(emit),
      transformer: droppableThrottled(Duration(seconds: 5)),
    );
    on<_ChangeState>(
      (event, emit) => emit(event.state),
      transformer: restartable(),
    );
    on<_Disconnect>((event, emit) async {
      emit(state.copyWith(status: WebsocketStatus.loading));
      await _subscription?.cancel();
      _subscription = null;
      await webSocketService.disconnect();
      emit(WebsocketState());
    });
  }

  Future _onConnect(Emitter<WebsocketState> emit) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    try {
      String ticket = await authRepository.getTicket();
      String url = '${dotenv.env['WEBSOCKET_URL']!}?uuid=$ticket';
      _subscription = webSocketService.messages.listen((message) {
        if (message.containsKey(websocket)) {
          switch (message[websocket]) {
            case WebsocketStatus.initial:
              add(
                _ChangeState(
                  state: state.copyWith(
                    status: WebsocketStatus.initial,
                    initialConnectionAchieved: false,
                  ),
                ),
              );
            case WebsocketStatus.connected:
              add(
                _ChangeState(
                  state: state.copyWith(
                    status: WebsocketStatus.connected,
                    initialConnectionAchieved: true,
                  ),
                ),
              );
            case WebsocketStatus.disconnected:
              add(
                _ChangeState(
                  state: state.copyWith(status: WebsocketStatus.disconnected),
                ),
              );
              _reconnect();
            case WebsocketStatus.failure:
              add(
                _ChangeState(
                  state: state.copyWith(status: WebsocketStatus.failure),
                ),
              );
              _reconnect();
          }
        }
      });
      await webSocketService.connect(url: url, ticket: ticket);
    } catch (e) {
      emit(state.copyWith(status: WebsocketStatus.failure));
      _reconnect();
    }
  }

  void _reconnect() {
    Future.delayed(Duration(seconds: 10), () {
      if (_subscription != null) {
        add(_Connect());
      }
    });
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }

  StreamSubscription? _subscription;
  final AuthRepository authRepository;
  final WebSocketService webSocketService;
}
