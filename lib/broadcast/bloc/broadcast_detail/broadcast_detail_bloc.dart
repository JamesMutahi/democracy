import 'dart:async';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/repository/api/api_repository.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/user/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'broadcast_detail_event.dart';
part 'broadcast_detail_state.dart';
part 'broadcast_detail_bloc.freezed.dart';

const String stream = 'broadcasts';
const String requestId = 'broadcasts';

class BroadcastDetailBloc
    extends Bloc<BroadcastDetailEvent, BroadcastDetailState> {
  BroadcastDetailBloc({
    required this.webSocketService,
    required this.apiRepository,
  }) : super(const BroadcastDetailState.initial()) {
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
    on<_StartRecording>((event, emit) => _onStartRecording(event, emit));
    on<_StopRecording>((event, emit) => _onStopRecording(event, emit));
  }

  void _onCreated(_Created event, Emitter<BroadcastDetailState> emit) {
    emit(BroadcastDetailLoading());
    if (event.payload['response_status'] == 201) {
      Broadcast broadcast = Broadcast.fromJson(event.payload['data']);
      emit(BroadcastCreated(broadcast: broadcast));
    } else {
      emit(BroadcastDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onLoaded(_Loaded event, Emitter<BroadcastDetailState> emit) {
    emit(BroadcastDetailLoading());
    if (event.payload['response_status'] == 200) {
      Broadcast broadcast = Broadcast.fromJson(event.payload['data']);
      emit(BroadcastLoaded(broadcast: broadcast));
    } else {
      emit(BroadcastDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onUpdated(_Updated event, Emitter<BroadcastDetailState> emit) {
    emit(BroadcastDetailLoading());
    if (event.payload['response_status'] == 200) {
      Broadcast broadcast = Broadcast.fromJson(event.payload['data']);
      emit(BroadcastUpdated(broadcast: broadcast));
    } else {
      emit(BroadcastDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onDeleted(_Deleted event, Emitter<BroadcastDetailState> emit) {
    emit(BroadcastDetailLoading());
    if (event.payload['response_status'] == 200) {
      emit(BroadcastDeleted(broadcastId: event.payload['pk']));
    } else {
      emit(BroadcastDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onCreate(_Create event, Emitter<BroadcastDetailState> emit) {
    emit(BroadcastDetailLoading());
    if (!webSocketService.isConnected) {
      emit(BroadcastDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'create',
        'request_id': requestId,
        'data': {
          'type': BroadcastTypeConverter().toJson(event.type),
          'title': event.title,
          'description': event.description,
          'start_time': event.startTime?.toIso8601String(),
        },
      },
    };
    webSocketService.send(message);
  }

  Future<void> _onJoin(_Join event, Emitter<BroadcastDetailState> emit) async {
    emit(BroadcastDetailLoading());
    try {
      final data = await apiRepository.getBroadcastToken(
        broadcast: event.broadcast,
      );
      await event.engine.joinChannel(
        token: data['token'],
        channelId: event.broadcast.id.toString(),
        uid: event.user.id,
        options: ChannelMediaOptions(
          clientRoleType: event.broadcast.id == event.user.id
              ? ClientRoleType.clientRoleBroadcaster
              : ClientRoleType.clientRoleAudience,
        ),
      );
      emit(BroadcastJoined(broadcast: event.broadcast));
    } catch (e) {
      emit(BroadcastDetailFailure(error: e.toString()));
    }
  }

  void _onRetrieve(_Retrieve event, Emitter<BroadcastDetailState> emit) {
    emit(BroadcastDetailLoading());
    if (!webSocketService.isConnected) {
      emit(BroadcastDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'retrieve',
        'request_id': requestId,
        'pk': event.broadcast.id,
      },
    };
    webSocketService.send(message);
  }

  void _onSubscribe(_Subscribe event, Emitter<BroadcastDetailState> emit) {
    emit(BroadcastDetailLoading());
    if (!webSocketService.isConnected) {
      emit(BroadcastDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'subscribe',
        'request_id': requestId,
        'pk': event.broadcast.id,
        'is_muted': event.isMuted,
      },
    };
    webSocketService.send(message);
  }

  void _onUnsubscribe(_Unsubscribe event, Emitter<BroadcastDetailState> emit) {
    emit(BroadcastDetailLoading());
    if (!webSocketService.isConnected) {
      emit(BroadcastDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'unsubscribe',
        'request_id': requestId,
        'pk': event.broadcast.id,
      },
    };
    webSocketService.send(message);
  }

  Future<void> _onStartRecording(
    _StartRecording event,
    Emitter<BroadcastDetailState> emit,
  ) async {
    emit(BroadcastDetailLoading());
    try {
      await apiRepository.startRecording(broadcast: event.broadcast);
      emit(BroadcastJoined(broadcast: event.broadcast));
    } catch (e) {
      emit(BroadcastDetailFailure(error: e.toString()));
    }
  }

  Future<void> _onStopRecording(
    _StopRecording event,
    Emitter<BroadcastDetailState> emit,
  ) async {
    emit(BroadcastDetailLoading());
    try {
      await apiRepository.stopRecording(broadcast: event.broadcast);
      emit(BroadcastJoined(broadcast: event.broadcast));
    } catch (e) {
      emit(BroadcastDetailFailure(error: e.toString()));
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
