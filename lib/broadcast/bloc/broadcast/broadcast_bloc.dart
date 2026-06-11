import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'broadcast_event.dart';
part 'broadcast_state.dart';
part 'broadcast_bloc.freezed.dart';

const String stream = 'broadcasts';

class BroadcastBloc extends Bloc<BroadcastEvent, BroadcastState> {
  BroadcastBloc({required this.webSocketService}) : super(const BroadcastState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        switch (message['payload']['action']) {
          case 'retrieve':
            add(_Loaded(payload: message['payload']));
        }
      }
    });
    on<_Load>((event, emit) => _onLoad(event, emit));
    on<_Loaded>((event, emit) => _onLoaded(event, emit));
    on<_Updated>((event, emit) => _onUpdated(event, emit));
  }

  void _onLoad(_Load event, Emitter<BroadcastState> emit) async {
    emit(
      state.copyWith(status: BroadcastStatus.loading, broadcastId: event.broadcastId),
    );
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: BroadcastStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'retrieve',
        'request_id': event.broadcastId,
        'pk': event.broadcastId,
      },
    };
    webSocketService.send(message);
  }

  void _onLoaded(_Loaded event, Emitter<BroadcastState> emit) async {
    emit(state.copyWith(status: BroadcastStatus.loading));
    if (event.payload['response_status'] == 200) {
      final broadcast = Broadcast.fromJson(event.payload['data']);
      emit(
        state.copyWith(
          status: BroadcastStatus.success,
          broadcast: broadcast,
          broadcastId: event.payload['request_id'],
        ),
      );
    } else {
      emit(state.copyWith(status: BroadcastStatus.failure));
    }
  }

  void _onUpdated(_Updated event, Emitter<BroadcastState> emit) async {
    emit(state.copyWith(status: BroadcastStatus.loading));
    emit(
      state.copyWith(
        status: BroadcastStatus.success,
        broadcast: event.broadcast,
        broadcastId: event.broadcast.id,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  late StreamSubscription _subscription;
  final WebSocketService webSocketService;
}
