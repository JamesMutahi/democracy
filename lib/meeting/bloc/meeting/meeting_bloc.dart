import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meeting_event.dart';
part 'meeting_state.dart';
part 'meeting_bloc.freezed.dart';

const String stream = 'meetings';

class MeetingBloc extends Bloc<MeetingEvent, MeetingState> {
  MeetingBloc({required this.webSocketService}) : super(const MeetingState()) {
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

  void _onLoad(_Load event, Emitter<MeetingState> emit) async {
    emit(
      state.copyWith(status: MeetingStatus.loading, meetingId: event.meetingId),
    );
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: MeetingStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'retrieve',
        'request_id': event.meetingId,
        'pk': event.meetingId,
      },
    };
    webSocketService.send(message);
  }

  void _onLoaded(_Loaded event, Emitter<MeetingState> emit) async {
    emit(state.copyWith(status: MeetingStatus.loading));
    if (event.payload['response_status'] == 200) {
      final meeting = Meeting.fromJson(event.payload['data']);
      emit(
        state.copyWith(
          status: MeetingStatus.success,
          meeting: meeting,
          meetingId: event.payload['request_id'],
        ),
      );
    } else {
      emit(state.copyWith(status: MeetingStatus.failure));
    }
  }

  void _onUpdated(_Updated event, Emitter<MeetingState> emit) async {
    emit(state.copyWith(status: MeetingStatus.loading));
    emit(
      state.copyWith(
        status: MeetingStatus.success,
        meeting: event.meeting,
        meetingId: event.meeting.id,
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
