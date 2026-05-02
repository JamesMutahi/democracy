import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/geo/models/constituency.dart';
import 'package:democracy/geo/models/county.dart';
import 'package:democracy/geo/models/ward.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meeting_detail_event.dart';
part 'meeting_detail_state.dart';
part 'meeting_detail_bloc.freezed.dart';

const String stream = 'meetings';
const String requestId = 'meetings';

class MeetingDetailBloc extends Bloc<MeetingDetailEvent, MeetingDetailState> {
  MeetingDetailBloc({required this.webSocketService})
    : super(const MeetingDetailState.initial()) {
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
          case 'leave':
            add(_Left(payload: message['payload']));
        }
      }
    });
    on<_Created>((event, emit) => _onCreated(event, emit));
    on<_Loaded>((event, emit) => _onLoaded(event, emit));
    on<_Updated>((event, emit) => _onUpdated(event, emit));
    on<_Deleted>((event, emit) => _onDeleted(event, emit));
    on<_Retrieve>((event, emit) => _onRetrieve(event, emit));
    on<_Subscribe>((event, emit) => _onSubscribe(event, emit));
    on<_Leave>((event, emit) => _onLeave(event, emit));
    on<_Left>((event, emit) => _onLeft(event, emit));
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
      final data = event.payload['data'];
      emit(
        MeetingUpdated(
          id: event.payload['pk'],
          title: data['title'],
          description: data['description'],
          county: data['county'] == null
              ? null
              : County.fromJson(data['county']),
          constituency: data['constituency'] == null
              ? null
              : Constituency.fromJson(data['constituency']),
          ward: data['ward'] == null ? null : Ward.fromJson(data['ward']),
          participantsCount: data['participants_count'],
          isActive: data['is_active'],
        ),
      );
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

  void _onLeave(_Leave event, Emitter<MeetingDetailState> emit) {
    emit(MeetingDetailLoading());
    if (!webSocketService.isConnected) {
      emit(MeetingDetailFailure(error: serverError));
      return;
    }

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

  void _onLeft(_Left event, Emitter<MeetingDetailState> emit) {
    emit(MeetingDetailLoading());
    if (event.payload['response_status'] == 200) {
      emit(MeetingLeft(meetingId: event.payload['data']['pk']));
    } else {
      emit(MeetingDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  late StreamSubscription _subscription;
  final WebSocketService webSocketService;
}
