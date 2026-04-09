import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/app/shared/utils/transformers.dart';
import 'package:democracy/meet/models/meeting.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meetings_event.dart';
part 'meetings_state.dart';
part 'meetings_bloc.freezed.dart';

const String stream = 'meetings';
const String requestId = 'meetings';
const String action = 'list';

class MeetingsBloc extends Bloc<MeetingsEvent, MeetingsState> {
  MeetingsBloc({required this.webSocketService})
    : super(const MeetingsState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Get>((event, emit) => _onGet(event, emit), transformer: debounce());
    on<_Received>((event, emit) => _onReceived(event, emit));
    on<_Add>((event, emit) => _onAdd(event, emit));
    on<_Update>((event, emit) => _onUpdate(event, emit));
    on<_Remove>((event, emit) => _onRemove(event, emit));
  }

  void _onGet(_Get event, Emitter<MeetingsState> emit) {
    emit(state.copyWith(status: MeetingsStatus.loading));
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: MeetingsStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'list',
        'request_id': requestId,
        'search_term': event.searchTerm,
        'previous_meetings': event.previousMeetings
            ?.map((meeting) => meeting.id)
            .toList(),
        'is_active': event.isActive,
        'sort_by': event.sortBy,
        'filter_by_region': event.filterByRegion,
        'start_date': event.startDate?.toIso8601String(),
        'end_date': event.endDate?.toIso8601String(),
      },
    };
    webSocketService.send(message);
  }

  void _onReceived(_Received event, Emitter<MeetingsState> emit) {
    emit(state.copyWith(status: MeetingsStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Meeting> meetings = List.from(
        event.payload['data']['results'].map((e) => Meeting.fromJson(e)),
      );
      List previousMeetings = event.payload['data']['previous_meetings'] ?? [];
      emit(
        state.copyWith(
          status: MeetingsStatus.success,
          meetings: previousMeetings.isEmpty
              ? meetings
              : [...state.meetings, ...meetings],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: MeetingsStatus.failure));
    }
  }

  void _onAdd(_Add event, Emitter<MeetingsState> emit) {
    final exists = state.meetings.any(
      (element) => element.id == event.meeting.id,
    );

    if (!exists) {
      emit(
        state.copyWith(
          meetings: [event.meeting, ...state.meetings],
          status: MeetingsStatus.success,
        ),
      );
    }
  }

  void _onUpdate(_Update event, Emitter<MeetingsState> emit) {
    final index = state.meetings.indexWhere(
      (element) => element.id == event.meeting.id,
    );
    if (index == -1) return;

    final updatedMeetings = List<Meeting>.from(state.meetings);
    updatedMeetings[index] = event.meeting;

    emit(
      state.copyWith(meetings: updatedMeetings, status: MeetingsStatus.success),
    );
  }

  void _onRemove(_Remove event, Emitter<MeetingsState> emit) {
    final updatedMeetings = state.meetings
        .where((element) => element.id != event.meetingId)
        .toList();

    emit(
      state.copyWith(meetings: updatedMeetings, status: MeetingsStatus.success),
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
