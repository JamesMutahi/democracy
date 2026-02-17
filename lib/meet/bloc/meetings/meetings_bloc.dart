import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/app/utils/transformers.dart';
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
    webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Get>((event, emit) {
      _onGet(event, emit);
    }, transformer: debounce());
    on<_Received>((event, emit) {
      _onReceived(event, emit);
    });
    on<_Resubscribe>((event, emit) {
      _onResubscribe(event, emit);
    });
  }

  Future _onGet(_Get event, Emitter<MeetingsState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'list',
        'request_id': requestId,
        'search_term': event.searchTerm,
        'previous_meetings': event.previousMeetings
            ?.map((survey) => survey.id)
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

  Future _onReceived(_Received event, Emitter<MeetingsState> emit) async {
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

  Future _onResubscribe(_Resubscribe event, Emitter<MeetingsState> emit) async {
    List<int> meetingIds = event.meetings.map((meeting) => meeting.id).toList();
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'resubscribe',
        'request_id': requestId,
        'pks': meetingIds,
      },
    };
    webSocketService.send(message);
  }

  final WebSocketService webSocketService;
}
