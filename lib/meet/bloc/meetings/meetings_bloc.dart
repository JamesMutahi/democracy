import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
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
    });
    on<_Received>((event, emit) {
      _onReceived(event, emit);
    });
  }

  Future _onGet(_Get event, Emitter<MeetingsState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'list',
        'request_id': requestId,
        'search_term': event.searchTerm,
        'last_ballot': event.lastMeeting?.id,
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
      int? lastBallot = event.payload['data']['last_ballot'];
      emit(
        state.copyWith(
          status: MeetingsStatus.success,
          meetings:
              lastBallot == null ? meetings : [...state.meetings, ...meetings],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: MeetingsStatus.failure));
    }
  }

  final WebSocketService webSocketService;
}
