import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'petition_event.dart';
part 'petition_state.dart';
part 'petition_bloc.freezed.dart';

const String stream = 'petitions';

class PetitionBloc extends Bloc<PetitionEvent, PetitionState> {
  PetitionBloc({required this.webSocketService})
    : super(const PetitionState()) {
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

  void _onLoad(_Load event, Emitter<PetitionState> emit) async {
    emit(
      state.copyWith(
        status: PetitionStatus.loading,
        petitionId: event.petitionId,
      ),
    );
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: PetitionStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'retrieve',
        'request_id': event.petitionId,
        'pk': event.petitionId,
      },
    };
    webSocketService.send(message);
  }

  void _onLoaded(_Loaded event, Emitter<PetitionState> emit) async {
    emit(state.copyWith(status: PetitionStatus.loading));
    if (event.payload['response_status'] == 200) {
      final petition = Petition.fromJson(event.payload['data']);
      emit(
        state.copyWith(
          status: PetitionStatus.success,
          petition: petition,
          petitionId: event.payload['request_id'],
        ),
      );
    } else {
      emit(state.copyWith(status: PetitionStatus.failure));
    }
  }

  void _onUpdated(_Updated event, Emitter<PetitionState> emit) async {
    emit(state.copyWith(status: PetitionStatus.loading));
    emit(
      state.copyWith(
        status: PetitionStatus.success,
        petition: event.petition,
        petitionId: event.petition.id,
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
