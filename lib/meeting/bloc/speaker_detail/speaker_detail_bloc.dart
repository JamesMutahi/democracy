import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/repository/api/api_repository.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:democracy/meeting/models/speaker_request.dart';
import 'package:democracy/user/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'speaker_detail_event.dart';
part 'speaker_detail_state.dart';
part 'speaker_detail_bloc.freezed.dart';

const String stream = 'meetings';
const String requestId = 'speaker_requests';

class SpeakerDetailBloc extends Bloc<SpeakerDetailEvent, SpeakerDetailState> {
  SpeakerDetailBloc({
    required this.webSocketService,
    required this.apiRepository,
  }) : super(const SpeakerDetailState.initial()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == 'meetings') {
        switch (message['payload']['action']) {
          case 'speaker_request_create':
            add(_RequestCreated(payload: message['payload']));
          case 'speaker_request_retrieve':
            add(_RequestLoaded(payload: message['payload']));
          case 'speaker_request_update':
            add(_RequestUpdated(payload: message['payload']));
          case 'speaker_request_delete':
            add(_RequestDeleted(payload: message['payload']));
          case 'request_to_speak':
            add(_RequestToSpeakCompleted(payload: message['payload']));
          case 'speaker_request':
            add(SpeakerRequestReceived(payload: message['payload']));
          case 'mute':
            add(_MuteStatusReceived(payload: message['payload']));
          case 'mute_everyone':
            add(_MutedEveryoneReceived(payload: message['payload']));
          case 'manage_co_host':
            add(_ManageCoHostReceived(payload: message['payload']));
          case 'manage_speaker':
            add(_ManageSpeakerReceived(payload: message['payload']));
        }
      }
    });
    on<_RequestCreated>((event, emit) => _onRequestCreated(event, emit));
    on<_RequestLoaded>((event, emit) => _onRequestLoaded(event, emit));
    on<_RequestUpdated>((event, emit) => _onRequestUpdated(event, emit));
    on<_RequestDeleted>((event, emit) => _onRequestDeleted(event, emit));
    on<RequestToSpeak>(_onRequestToSpeak);
    on<_RequestToSpeakCompleted>(_onRequestToSpeakCompleted);
    on<HandleSpeakerRequest>(_onHandleSpeakerRequest);
    on<ChangeMuteStatus>(_onChangeMuteStatus);
    on<_MuteStatusReceived>(_onMuteStatusReceived);
    on<MuteSpeaker>(_onMuteSpeaker);
    on<MuteEveryone>(_onMuteEveryone);
    on<_MutedEveryoneReceived>(_onMutedEveryoneReceived);
    on<ManageCoHost>(_onManageCoHost);
    on<_ManageCoHostReceived>(_onManageCoHostReceived);
    on<ManageSpeaker>(_onManageSpeaker);
    on<_ManageSpeakerReceived>(_onManageSpeakerReceived);
  }

  void _onRequestCreated(
    _RequestCreated event,
    Emitter<SpeakerDetailState> emit,
  ) {
    emit(SpeakerDetailLoading());
    if (event.payload['response_status'] == 200) {
      SpeakerRequest request = SpeakerRequest.fromJson(event.payload['data']);
      emit(SpeakerRequestCreated(request: request));
    } else {
      emit(SpeakerDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onRequestLoaded(
    _RequestLoaded event,
    Emitter<SpeakerDetailState> emit,
  ) {
    emit(SpeakerDetailLoading());
    if (event.payload['response_status'] == 200) {
      SpeakerRequest request = SpeakerRequest.fromJson(event.payload['data']);
      emit(SpeakerRequestLoaded(request: request));
    } else {
      emit(SpeakerDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onRequestUpdated(
    _RequestUpdated event,
    Emitter<SpeakerDetailState> emit,
  ) {
    emit(SpeakerDetailLoading());
    if (event.payload['response_status'] == 200) {
      final SpeakerRequest request = SpeakerRequest.fromJson(
        event.payload['data'],
      );
      emit(SpeakerRequestUpdated(request: request));
    } else {
      emit(SpeakerDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onRequestDeleted(
    _RequestDeleted event,
    Emitter<SpeakerDetailState> emit,
  ) {
    emit(SpeakerDetailLoading());
    if (event.payload['response_status'] == 200) {
      emit(SpeakerRequestDeleted(requestId: event.payload['pk']));
    } else {
      emit(SpeakerDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onRequestToSpeak(
    RequestToSpeak event,
    Emitter<SpeakerDetailState> emit,
  ) {
    emit(SpeakerDetailLoading());
    if (!webSocketService.isConnected) {
      emit(SpeakerDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'request_to_speak',
        'request_id': requestId,
        'pk': event.meeting.id,
      },
    };
    webSocketService.send(message);
  }

  void _onRequestToSpeakCompleted(
    _RequestToSpeakCompleted event,
    Emitter<SpeakerDetailState> emit,
  ) {
    emit(SpeakerDetailLoading());
    if (event.payload['response_status'] == 200) {
      emit(RequestedToSpeak());
    } else {
      emit(SpeakerDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  Future<void> _onHandleSpeakerRequest(
    HandleSpeakerRequest event,
    Emitter<SpeakerDetailState> emit,
  ) async {
    emit(SpeakerDetailLoading());
    if (!webSocketService.isConnected) {
      emit(SpeakerDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'handle_speaker_request',
        'request_id': requestId,
        'pk': event.request.id,
        "data": {'is_approved': event.isApproved},
      },
    };
    webSocketService.send(message);
  }

  Future<void> _onChangeMuteStatus(
    ChangeMuteStatus event,
    Emitter<SpeakerDetailState> emit,
  ) async {
    emit(SpeakerDetailLoading());
    if (!webSocketService.isConnected) {
      emit(SpeakerDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'mute',
        'request_id': requestId,
        'pk': event.meeting.id,
        "data": {'is_muted': event.isMuted},
      },
    };
    webSocketService.send(message);
  }

  Future<void> _onMuteStatusReceived(
    _MuteStatusReceived event,
    Emitter<SpeakerDetailState> emit,
  ) async {
    emit(SpeakerDetailLoading());
    if (event.payload['response_status'] == 200) {
      emit(MuteStatusChanged(isMuted: event.payload['data']['is_muted']));
    } else {
      emit(SpeakerDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  Future<void> _onMuteSpeaker(
    MuteSpeaker event,
    Emitter<SpeakerDetailState> emit,
  ) async {
    emit(SpeakerDetailLoading());
    if (!webSocketService.isConnected) {
      emit(SpeakerDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'mute_speaker',
        'request_id': requestId,
        'pk': event.meeting.id,
        "data": {'user_id': event.user.id},
      },
    };
    webSocketService.send(message);
  }

  Future<void> _onMuteEveryone(
    MuteEveryone event,
    Emitter<SpeakerDetailState> emit,
  ) async {
    emit(SpeakerDetailLoading());
    if (!webSocketService.isConnected) {
      emit(SpeakerDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'mute_everyone',
        'request_id': requestId,
        'pk': event.meeting.id,
      },
    };
    webSocketService.send(message);
  }

  Future<void> _onMutedEveryoneReceived(
    _MutedEveryoneReceived event,
    Emitter<SpeakerDetailState> emit,
  ) async {
    emit(SpeakerDetailLoading());
    if (event.payload['response_status'] == 200) {
      emit(MutedEveryone());
    } else {
      emit(SpeakerDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  Future<void> _onManageCoHost(
    ManageCoHost event,
    Emitter<SpeakerDetailState> emit,
  ) async {
    emit(SpeakerDetailLoading());
    if (!webSocketService.isConnected) {
      emit(SpeakerDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'manage_co_host',
        'request_id': requestId,
        'pk': event.meeting.id,
        'user_id': event.user.id,
      },
    };
    webSocketService.send(message);
  }

  void _onManageCoHostReceived(
    _ManageCoHostReceived event,
    Emitter<SpeakerDetailState> emit,
  ) {
    emit(SpeakerDetailLoading());
    if (event.payload['response_status'] == 200) {
      emit(CoHostStatusChanged(isCoHost: event.payload['data']['is_co_host']));
    } else {
      emit(SpeakerDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  Future<void> _onManageSpeaker(
    ManageSpeaker event,
    Emitter<SpeakerDetailState> emit,
  ) async {
    emit(SpeakerDetailLoading());
    if (!webSocketService.isConnected) {
      emit(SpeakerDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'manage_speaker',
        'request_id': requestId,
        'pk': event.meeting.id,
        'user_id': event.user.id,
      },
    };
    webSocketService.send(message);
  }

  void _onManageSpeakerReceived(
    _ManageSpeakerReceived event,
    Emitter<SpeakerDetailState> emit,
  ) {
    emit(SpeakerDetailLoading());
    if (event.payload['response_status'] == 200) {
      emit(
        SpeakerStatusChanged(isSpeaker: event.payload['data']['is_speaker']),
      );
    } else {
      emit(SpeakerDetailFailure(error: event.payload['errors'].toString()));
    }
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
