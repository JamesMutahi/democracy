import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'trending_topics_event.dart';
part 'trending_topics_state.dart';
part 'trending_topics_bloc.freezed.dart';

const String stream = 'posts';
const String action = 'trending_topics';

class TrendingTopicsBloc
    extends Bloc<TrendingTopicsEvent, TrendingTopicsState> {
  TrendingTopicsBloc({required this.webSocketService})
    : super(const TrendingTopicsState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Get>((event, emit) => _onGet(event, emit));
    on<_Received>((event, emit) => _onReceived(event, emit));
  }

  void _onGet(_Get event, Emitter<TrendingTopicsState> emit) async {
    emit(state.copyWith(status: TrendingTopicsStatus.loading));
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: TrendingTopicsStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {'action': action, 'request_id': action},
    };
    webSocketService.send(message);
  }

  void _onReceived(_Received event, Emitter<TrendingTopicsState> emit) async {
    emit(state.copyWith(status: TrendingTopicsStatus.loading));
    if (event.payload['response_status'] == 200) {
      emit(
        state.copyWith(
          status: TrendingTopicsStatus.success,
          topics: List.from(event.payload['data']),
        ),
      );
    } else {
      emit(state.copyWith(status: TrendingTopicsStatus.failure));
    }
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  late StreamSubscription _subscription;
  final WebSocketService webSocketService;
}
