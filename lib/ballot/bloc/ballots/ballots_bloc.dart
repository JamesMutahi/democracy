import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/utils/transformers.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ballots_bloc.freezed.dart';
part 'ballots_state.dart';
part 'ballots_event.dart';

const String stream = 'ballots';
const String action = 'list';

class BallotsBloc extends Bloc<BallotsEvent, BallotsState> {
  BallotsBloc({required this.webSocketService}) : super(const BallotsState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Get>((event, emit) => _onGet(event, emit), transformer: debounce());
    on<_Received>((event, emit) => _onReceived(event, emit));
    on<_Add>((event, emit) => _onAdd(event, emit));
    on<_Update>((event, emit) => _onUpdate(event, emit));
    on<_Remove>((event, emit) => _onRemove(event, emit));
  }

  void _onGet(_Get event, Emitter<BallotsState> emit) {
    emit(state.copyWith(status: BallotsStatus.loading, searchTerm: event.searchTerm));
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: BallotsStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'list',
        'request_id': event.searchTerm,
        'search_term': event.searchTerm,
        'previous_ballots': event.previousBallots
            ?.map((ballot) => ballot.id)
            .toList(),
        'is_active': event.isActive,
        'sort_by': event.sortBy,
        'filter_by_region': event.filterByRegion,
        'start_date': event.startDate?.toIso8601String(),
        'end_date': event.endDate?.toIso8601String(),
      },
    };
    webSocketService.send(message);
  }

  void _onReceived(_Received event, Emitter<BallotsState> emit) {
    emit(state.copyWith(status: BallotsStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Ballot> ballots = List.from(
        event.payload['data']['results'].map((e) => Ballot.fromJson(e)),
      );
      List previousBallots = event.payload['data']['previous_ballots'] ?? [];
      emit(
        state.copyWith(
          status: BallotsStatus.success,
          searchTerm: event.payload['request_id'],
          ballots: previousBallots.isEmpty
              ? ballots
              : [...state.ballots, ...ballots],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: BallotsStatus.failure));
    }
  }

  void _onAdd(_Add event, Emitter<BallotsState> emit) {
    final exists = state.ballots.any(
      (element) => element.id == event.ballot.id,
    );

    if (!exists) {
      emit(
        state.copyWith(
          ballots: [event.ballot, ...state.ballots],
          status: BallotsStatus.success,
        ),
      );
    }
  }

  void _onUpdate(_Update event, Emitter<BallotsState> emit) {
    final index = state.ballots.indexWhere(
      (element) => element.id == event.ballot.id,
    );
    if (index == -1) return;

    final updatedBallots = List<Ballot>.from(state.ballots);
    updatedBallots[index] = event.ballot;

    emit(
      state.copyWith(ballots: updatedBallots, status: BallotsStatus.success),
    );
  }

  void _onRemove(_Remove event, Emitter<BallotsState> emit) {
    final updatedBallots = state.ballots
        .where((element) => element.id != event.ballotId)
        .toList();

    emit(
      state.copyWith(ballots: updatedBallots, status: BallotsStatus.success),
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
