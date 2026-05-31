import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ballot_event.dart';
part 'ballot_state.dart';
part 'ballot_bloc.freezed.dart';

const String stream = 'ballots';

class BallotBloc extends Bloc<BallotEvent, BallotState> {
  BallotBloc({required this.webSocketService}) : super(const BallotState()) {
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

  void _onLoad(_Load event, Emitter<BallotState> emit) async {
    emit(state.copyWith(status: BallotStatus.loading, ballotId: event.ballotId));
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: BallotStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'retrieve',
        'request_id': event.ballotId,
        'pk': event.ballotId,
      },
    };
    webSocketService.send(message);
  }

  void _onLoaded(_Loaded event, Emitter<BallotState> emit) async {
    emit(state.copyWith(status: BallotStatus.loading));
    if (event.payload['response_status'] == 200) {
      final ballot = Ballot.fromJson(event.payload['data']);
      emit(
        state.copyWith(
          status: BallotStatus.success,
          ballot: ballot,
          ballotId: event.payload['request_id'],
        ),
      );
    } else {
      emit(state.copyWith(status: BallotStatus.failure));
    }
  }

  void _onUpdated(_Updated event, Emitter<BallotState> emit) async {
    emit(state.copyWith(status: BallotStatus.loading));
    emit(
      state.copyWith(
        status: BallotStatus.success,
        ballot: event.ballot,
        ballotId: event.ballot.id,
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
