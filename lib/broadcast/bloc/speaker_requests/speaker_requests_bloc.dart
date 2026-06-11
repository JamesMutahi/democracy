import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/utils/transformers.dart';
import 'package:democracy/broadcast/models/speaker_request.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'speaker_requests_event.dart';
part 'speaker_requests_state.dart';
part 'speaker_requests_bloc.freezed.dart';

const String stream = 'broadcasts';
const String action = 'speaker_requests';

class SpeakerRequestsBloc
    extends Bloc<SpeakerRequestsEvent, SpeakerRequestsState> {
  SpeakerRequestsBloc({required this.webSocketService})
    : super(const SpeakerRequestsState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        if (message['payload']['action'] == action) {
          add(_Received(payload: message['payload']));
        }
      }
    });
    on<_Get>((event, emit) => _onGet(event, emit), transformer: debounce());
    on<_Received>((event, emit) => _onReceived(event, emit));
    on<_Add>((event, emit) => _onAdd(event, emit));
    on<_Update>((event, emit) => _onUpdate(event, emit));
    on<_Remove>((event, emit) => _onRemove(event, emit));
  }

  void _onGet(_Get event, Emitter<SpeakerRequestsState> emit) {
    emit(state.copyWith(status: SpeakerRequestsStatus.loading));
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: SpeakerRequestsStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': action,
        'pk': event.broadcast.id,
        'previous_requests': event.previousRequests
            .map((request) => request.id)
            .toList(),
      },
    };
    webSocketService.send(message);
  }

  void _onReceived(_Received event, Emitter<SpeakerRequestsState> emit) {
    emit(state.copyWith(status: SpeakerRequestsStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<SpeakerRequest> requests = List.from(
        event.payload['data']['results'].map((e) => SpeakerRequest.fromJson(e)),
      );
      List previousRequests = event.payload['data']['previous_requests'] ?? [];
      emit(
        state.copyWith(
          status: SpeakerRequestsStatus.success,
          requests: previousRequests.isEmpty
              ? requests
              : [...state.requests, ...requests],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: SpeakerRequestsStatus.failure));
    }
  }

  void _onAdd(_Add event, Emitter<SpeakerRequestsState> emit) {
    final exists = state.requests.any(
      (element) => element.id == event.request.id,
    );

    if (!exists) {
      emit(
        state.copyWith(
          requests: [event.request, ...state.requests],
          status: SpeakerRequestsStatus.success,
        ),
      );
    }
  }

  void _onUpdate(_Update event, Emitter<SpeakerRequestsState> emit) {
    final index = state.requests.indexWhere(
      (element) => element.id == event.request.id,
    );
    if (index == -1) return;
    emit(state.copyWith(status: SpeakerRequestsStatus.loading));

    final updatedRequests = List<SpeakerRequest>.from(state.requests);
    updatedRequests[index] = event.request;

    emit(
      state.copyWith(
        requests: updatedRequests,
        status: SpeakerRequestsStatus.success,
      ),
    );
  }

  void _onRemove(_Remove event, Emitter<SpeakerRequestsState> emit) {
    final updatedRequests = state.requests
        .where((element) => element.id != event.requestId)
        .toList();

    emit(
      state.copyWith(
        requests: updatedRequests,
        status: SpeakerRequestsStatus.success,
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
