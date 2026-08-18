import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/ballot/models/option.dart';
import 'package:democracy/geo/models/constituency.dart';
import 'package:democracy/geo/models/county.dart';
import 'package:democracy/geo/models/ward.dart';
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
    on<_VotedOptionUpdated>(
      (event, emit) => _onVotedOptionUpdated(event, emit),
    );
    on<_BallotDetailUpdated>(
      (event, emit) => _onBallotDetailUpdated(event, emit),
    );
    on<_ReasonUpdated>((event, emit) => _onReasonUpdated(event, emit));
  }

  void _onLoad(_Load event, Emitter<BallotState> emit) async {
    emit(
      state.copyWith(status: BallotStatus.loading, ballotId: event.ballotId),
    );
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

  void _onBallotDetailUpdated(
    _BallotDetailUpdated event,
    Emitter<BallotState> emit,
  ) async {
    emit(state.copyWith(status: BallotStatus.loading));
    emit(
      state.copyWith(
        status: BallotStatus.success,
        ballot: state.ballot!.copyWith(
          title: event.title,
          description: event.description,
          county: event.county,
          constituency: event.constituency,
          ward: event.ward,
          startTime: event.startTime,
          endTime: event.endTime,
          hasStarted: event.hasStarted,
          hasEnded: event.hasEnded,
          totalVotes: event.totalVotes,
          options: event.options,
          isActive: event.isActive,
        ),
      ),
    );
  }

  void _onVotedOptionUpdated(
    _VotedOptionUpdated event,
    Emitter<BallotState> emit,
  ) async {
    emit(state.copyWith(status: BallotStatus.loading));
    emit(
      state.copyWith(
        status: BallotStatus.success,
        ballot: state.ballot!.copyWith(votedOption: event.votedOptionId),
      ),
    );
  }

  void _onReasonUpdated(
    _ReasonUpdated event,
    Emitter<BallotState> emit,
  ) async {
    emit(state.copyWith(status: BallotStatus.loading));
    emit(
      state.copyWith(
        status: BallotStatus.success,
        ballot: state.ballot!.copyWith(reason: event.reason),
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
