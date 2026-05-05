import 'dart:async';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/repository/api/api_repository.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:democracy/user/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meeting_detail_event.dart';
part 'meeting_detail_state.dart';
part 'meeting_detail_bloc.freezed.dart';

const String stream = 'meetings';
const String requestId = 'meetings';

class MeetingDetailBloc extends Bloc<MeetingDetailEvent, MeetingDetailState> {
  MeetingDetailBloc({
    required this.webSocketService,
    required this.apiRepository,
  }) : super(const MeetingDetailState.initial()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        switch (message['payload']['action']) {
          case 'create':
            add(_Created(payload: message['payload']));
          case 'retrieve':
          case 'subscribe':
            add(_Loaded(payload: message['payload']));
          case 'update':
            add(_Updated(payload: message['payload']));
          case 'delete':
            add(_Deleted(payload: message['payload']));
        }
      }
    });
    on<_Created>((event, emit) => _onCreated(event, emit));
    on<_Loaded>((event, emit) => _onLoaded(event, emit));
    on<_Updated>((event, emit) => _onUpdated(event, emit));
    on<_Deleted>((event, emit) => _onDeleted(event, emit));
    on<_Create>((event, emit) => _onCreate(event, emit));
    on<_Join>((event, emit) async => await _onJoin(event, emit));
    on<_Retrieve>((event, emit) => _onRetrieve(event, emit));
    on<_Subscribe>((event, emit) => _onSubscribe(event, emit));
    on<_Unsubscribe>((event, emit) => _onUnsubscribe(event, emit));
  }

  void _onCreated(_Created event, Emitter<MeetingDetailState> emit) {
    emit(MeetingDetailLoading());
    if (event.payload['response_status'] == 201) {
      Meeting meeting = Meeting.fromJson(event.payload['data']);
      emit(MeetingCreated(meeting: meeting));
    } else {
      emit(MeetingDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onLoaded(_Loaded event, Emitter<MeetingDetailState> emit) {
    emit(MeetingDetailLoading());
    if (event.payload['response_status'] == 200) {
      Meeting meeting = Meeting.fromJson(event.payload['data']);
      emit(MeetingLoaded(meeting: meeting));
    } else {
      emit(MeetingDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onUpdated(_Updated event, Emitter<MeetingDetailState> emit) {
    emit(MeetingDetailLoading());
    if (event.payload['response_status'] == 200) {
      Meeting meeting = Meeting.fromJson(event.payload['data']);
      emit(MeetingUpdated(meeting: meeting));
    } else {
      emit(MeetingDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onDeleted(_Deleted event, Emitter<MeetingDetailState> emit) {
    emit(MeetingDetailLoading());
    if (event.payload['response_status'] == 204) {
      emit(MeetingDeleted(meetingId: event.payload['pk']));
    } else {
      emit(MeetingDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onCreate(_Create event, Emitter<MeetingDetailState> emit) {
    emit(MeetingDetailLoading());
    if (!webSocketService.isConnected) {
      emit(MeetingDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'create',
        'request_id': requestId,
        'data': {
          'title': event.title,
          'description': event.description,
          'is_live_stream': event.isLiveStream,
        },
      },
    };
    webSocketService.send(message);
  }

  Future<void> _onJoin(_Join event, Emitter<MeetingDetailState> emit) async {
    emit(MeetingDetailLoading());
    try {
      final data = await apiRepository.getMeetingToken(meeting: event.meeting);
      await event.engine.joinChannel(
        token: data['token'],
        channelId: event.meeting.id.toString(),
        uid: event.user.id,
        options: ChannelMediaOptions(
          clientRoleType: event.meeting.id == event.user.id
              ? ClientRoleType.clientRoleBroadcaster
              : ClientRoleType.clientRoleAudience,
        ),
      );
      emit(MeetingJoined(meeting: event.meeting));
    } catch (e) {
      emit(MeetingDetailFailure(error: e.toString()));
    }
  }

  void _onRetrieve(_Retrieve event, Emitter<MeetingDetailState> emit) {
    emit(MeetingDetailLoading());
    if (!webSocketService.isConnected) {
      emit(MeetingDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'retrieve',
        'request_id': requestId,
        'pk': event.meeting.id,
      },
    };
    webSocketService.send(message);
  }

  void _onSubscribe(_Subscribe event, Emitter<MeetingDetailState> emit) {
    emit(MeetingDetailLoading());
    if (!webSocketService.isConnected) {
      emit(MeetingDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'subscribe',
        'request_id': requestId,
        'pk': event.meeting.id,
      },
    };
    webSocketService.send(message);
  }

  void _onUnsubscribe(_Unsubscribe event, Emitter<MeetingDetailState> emit) {
    emit(MeetingDetailLoading());
    if (!webSocketService.isConnected) {
      emit(MeetingDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'unsubscribe',
        'request_id': requestId,
        'pk': event.meeting.id,
      },
    };
    webSocketService.send(message);
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  late StreamSubscription _subscription;
  final WebSocketService webSocketService;
  final APIRepository apiRepository;
}
