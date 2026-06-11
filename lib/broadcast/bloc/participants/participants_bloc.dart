import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/user/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'participants_state.dart';
part 'participants_event.dart';
part 'participants_bloc.freezed.dart';

const String stream = 'users';
const String requestId = 'users';
const String action = 'broadcast_participants';

class ParticipantsBloc extends Bloc<ParticipantsEvent, ParticipantsState> {
  ParticipantsBloc({required this.webSocketService})
    : super(ParticipantsState()) {
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

  void _onGet(_Get event, Emitter<ParticipantsState> emit) {
    emit(state.copyWith(status: ParticipantsStatus.loading));
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: ParticipantsStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': action,
        'request_id': requestId,
        'pk': event.broadcast.id,
        'last_user': event.lastUser?.id,
      },
    };
    webSocketService.send(message);
  }

  void _onReceived(_Received event, Emitter<ParticipantsState> emit) {
    emit(state.copyWith(status: ParticipantsStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<User> users = List.from(
        event.payload['data']['results'].map((e) => User.fromJson(e)),
      );
      int? lastUser = event.payload['data']['last_user'];
      emit(
        state.copyWith(
          status: ParticipantsStatus.success,
          users: lastUser == null ? users : [...state.users, ...users],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: ParticipantsStatus.failure));
    }
  }

  void _onUpdate(_Update event, Emitter<ParticipantsState> emit) {
    emit(state.copyWith(status: ParticipantsStatus.loading));
    emit(
      state.copyWith(users: event.users, status: ParticipantsStatus.success),
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
