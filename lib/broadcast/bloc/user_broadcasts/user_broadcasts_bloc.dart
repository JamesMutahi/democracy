import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/user/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_broadcasts_bloc.freezed.dart';
part 'user_broadcasts_state.dart';
part 'user_broadcasts_event.dart';

const String stream = 'broadcasts';
const String action = 'user_broadcasts';

class UserBroadcastsBloc
    extends Bloc<UserBroadcastsEvent, UserBroadcastsState> {
  UserBroadcastsBloc({required this.webSocketService})
    : super(UserBroadcastsState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Get>((event, emit) => _onGet(event, emit));
    on<_Received>((event, emit) => _onReceived(event, emit));
    on<_Add>((event, emit) => _onAdd(event, emit));
    on<_Update>((event, emit) => _onUpdate(event, emit));
    on<_Remove>((event, emit) => _onRemove(event, emit));
  }

  Future _onGet(_Get event, Emitter<UserBroadcastsState> emit) async {
    emit(
      state.copyWith(
        status: UserBroadcastsStatus.loading,
        userId: event.user.id,
      ),
    );
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: UserBroadcastsStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': action,
        'request_id': event.user.id,
        'user': event.user.id,
        'previous_broadcasts': event.previousBroadcasts
            ?.map((broadcast) => broadcast.id)
            .toList(),
      },
    };
    webSocketService.send(message);
  }

  Future _onReceived(_Received event, Emitter<UserBroadcastsState> emit) async {
    emit(state.copyWith(status: UserBroadcastsStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Broadcast> broadcasts = List.from(
        event.payload['data']['results'].map((e) => Broadcast.fromJson(e)),
      );
      List previousBroadcasts =
          event.payload['data']['previous_broadcasts'] ?? [];
      emit(
        state.copyWith(
          status: UserBroadcastsStatus.success,
          broadcasts: previousBroadcasts.isEmpty
              ? broadcasts
              : [...state.broadcasts, ...broadcasts],
          userId: event.payload['request_id'],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: UserBroadcastsStatus.failure));
    }
  }

  void _onAdd(_Add event, Emitter<UserBroadcastsState> emit) {
    final exists = state.broadcasts.any(
          (element) => element.id == event.broadcast.id,
    );

    if (!exists) {
      emit(
        state.copyWith(
          broadcasts: [event.broadcast, ...state.broadcasts],
          status: UserBroadcastsStatus.success,
        ),
      );
    }
  }

  void _onUpdate(_Update event, Emitter<UserBroadcastsState> emit) {
    final index = state.broadcasts.indexWhere(
          (element) => element.id == event.broadcast.id,
    );
    if (index == -1) return;

    final updatedBroadcasts = List<Broadcast>.from(state.broadcasts);
    updatedBroadcasts[index] = event.broadcast;

    emit(
      state.copyWith(
        broadcasts: updatedBroadcasts,
        status: UserBroadcastsStatus.success,
      ),
    );
  }

  void _onRemove(_Remove event, Emitter<UserBroadcastsState> emit) {
    final updatedBroadcasts = state.broadcasts
        .where((element) => element.id != event.broadcastId)
        .toList();

    emit(
      state.copyWith(
        broadcasts: updatedBroadcasts,
        status: UserBroadcastsStatus.success,
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
