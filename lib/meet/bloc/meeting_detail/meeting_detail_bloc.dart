import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/meet/models/meeting.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meeting_detail_event.dart';
part 'meeting_detail_state.dart';
part 'meeting_detail_bloc.freezed.dart';

const String stream = 'meetings';
const String requestId = 'meetings';

class MeetingDetailBloc extends Bloc<MeetingDetailEvent, MeetingDetailState> {
  MeetingDetailBloc({required this.webSocketService})
    : super(const MeetingDetailState.initial()) {
    webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        switch (message['payload']['action']) {
          case 'create':
            add(_Created(payload: message['payload']));
          case 'update':
            add(_Updated(payload: message['payload']));
          case 'delete':
            add(_Deleted(payload: message['payload']));
          case 'join':
            add(_Joined(payload: message['payload']));
          case 'leave':
            add(_Left(payload: message['payload']));
        }
      }
    });
    on<_Created>((event, emit) {
      _onCreated(event, emit);
    });
    on<_Updated>((event, emit) {
      _onUpdated(event, emit);
    });
    on<_Deleted>((event, emit) {
      _onDeleted(event, emit);
    });
    on<_Join>((event, emit) {
      _onJoin(event, emit);
    });
    on<_Joined>((event, emit) {
      _onJoined(event, emit);
    });
    on<_Leave>((event, emit) {
      _onLeave(event, emit);
    });
    on<_Left>((event, emit) {
      _onLeft(event, emit);
    });
  }

  Future _onCreated(_Created event, Emitter<MeetingDetailState> emit) async {
    emit(MeetingDetailLoading());
    if (event.payload['response_status'] == 201) {
      Meeting meeting = Meeting.fromJson(event.payload['data']);
      emit(MeetingCreated(meeting: meeting));
    } else {
      emit(MeetingDetailFailure(error: event.payload['errors'][0]));
    }
  }

  Future _onUpdated(_Updated event, Emitter<MeetingDetailState> emit) async {
    emit(MeetingDetailLoading());
    if (event.payload['response_status'] == 200) {
      final Meeting meeting = Meeting.fromJson(event.payload['data']);
      emit(MeetingUpdated(meeting: meeting));
    } else {
      emit(MeetingDetailFailure(error: event.payload['errors'][0]));
    }
  }

  Future _onDeleted(_Deleted event, Emitter<MeetingDetailState> emit) async {
    emit(MeetingDetailLoading());
    if (event.payload['response_status'] == 204) {
      emit(MeetingDeleted(meetingId: event.payload['pk']));
    } else {
      emit(MeetingDetailFailure(error: event.payload['errors'][0]));
    }
  }

  Future _onJoin(_Join event, Emitter<MeetingDetailState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'join',
        'request_id': requestId,
        'pk': event.meeting.id,
      },
    };
    webSocketService.send(message);
  }

  Future _onJoined(_Joined event, Emitter<MeetingDetailState> emit) async {
    emit(MeetingDetailLoading());
    if (event.payload['response_status'] == 200) {
      emit(MeetingJoined(meetingId: event.payload['data']['pk']));
    } else {
      emit(MeetingDetailFailure(error: event.payload['errors'][0]));
    }
  }

  Future _onLeave(_Leave event, Emitter<MeetingDetailState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'leave',
        'request_id': requestId,
        'pk': event.meeting.id,
      },
    };
    webSocketService.send(message);
  }

  Future _onLeft(_Left event, Emitter<MeetingDetailState> emit) async {
    emit(MeetingDetailLoading());
    if (event.payload['response_status'] == 200) {
      emit(MeetingLeft(meetingId: event.payload['data']['pk']));
    } else {
      emit(MeetingDetailFailure(error: event.payload['errors'][0]));
    }
  }

  final WebSocketService webSocketService;
}
