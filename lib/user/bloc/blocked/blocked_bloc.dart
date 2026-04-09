import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/user/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'blocked_bloc.freezed.dart';
part 'blocked_state.dart';
part 'blocked_event.dart';

const String stream = 'users';
const String requestId = 'users';
const String action = 'blocked';

class BlockedBloc extends Bloc<BlockedEvent, BlockedState> {
  BlockedBloc({required this.webSocketService}) : super(BlockedState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Get>((event, emit) => _onGet(event, emit));
    on<_Received>((event, emit) => _onReceived(event, emit));
    on<_Update>((event, emit) => _onUpdate(event, emit));
  }

  void _onGet(_Get event, Emitter<BlockedState> emit) {
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: BlockedStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': action,
        'request_id': requestId,
        'last_user': event.lastUser?.id,
      },
    };
    webSocketService.send(message);
  }

  void _onReceived(_Received event, Emitter<BlockedState> emit) {
    emit(state.copyWith(status: BlockedStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<User> users = List.from(
        event.payload['data']['results'].map((e) => User.fromJson(e)),
      );
      int? lastUser = event.payload['data']['last_user'];
      emit(
        state.copyWith(
          status: BlockedStatus.success,
          users: lastUser == null ? users : [...state.users, ...users],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: BlockedStatus.failure));
    }
  }

  void _onUpdate(_Update event, Emitter<BlockedState> emit) {
    emit(state.copyWith(status: BlockedStatus.loading));
    emit(state.copyWith(users: event.users, status: BlockedStatus.success));
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  late StreamSubscription _subscription;
  final WebSocketService webSocketService;
}
