import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/app/utils/transformers.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'petitions_bloc.freezed.dart';
part 'petitions_state.dart';
part 'petitions_event.dart';

const String stream = 'petitions';
const String requestId = 'petitions';
const String action = 'list';

class PetitionsBloc extends Bloc<PetitionsEvent, PetitionsState> {
  PetitionsBloc({required this.webSocketService}) : super(PetitionsState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Get>((event, emit) {
      _onGet(event, emit);
    }, transformer: debounce());
    on<_Received>((event, emit) {
      _onReceived(event, emit);
    });
    on<_Add>((event, emit) => _onAdd(event, emit));
    on<_Update>((event, emit) => _onUpdate(event, emit));
    on<_Remove>((event, emit) => _onRemove(event, emit));
  }

  void _onGet(_Get event, Emitter<PetitionsState> emit) {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'list',
        'request_id': requestId,
        'search_term': event.searchTerm,
        'previous_petitions': event.previousPetitions
            ?.map((petition) => petition.id)
            .toList(),
        'is_open': event.isOpen,
        'sort_by': event.sortBy,
        'filter_by_region': event.filterByRegion,
        'start_date': event.startDate?.toIso8601String(),
        'end_date': event.endDate?.toIso8601String(),
      },
    };
    webSocketService.send(message);
  }

  void _onReceived(_Received event, Emitter<PetitionsState> emit) {
    emit(state.copyWith(status: PetitionsStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Petition> petitions = List.from(
        event.payload['data']['results'].map((e) => Petition.fromJson(e)),
      );
      List previousPetitions =
          event.payload['data']['previous_petitions'] ?? [];
      emit(
        state.copyWith(
          status: PetitionsStatus.success,
          petitions: previousPetitions.isEmpty
              ? petitions
              : [...state.petitions, ...petitions],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: PetitionsStatus.failure));
    }
  }

  void _onAdd(_Add event, Emitter<PetitionsState> emit) {
    final exists = state.petitions.any(
      (element) => element.id == event.petition.id,
    );

    if (!exists) {
      emit(
        state.copyWith(
          petitions: [event.petition, ...state.petitions],
          status: PetitionsStatus.success,
        ),
      );
    }
  }

  void _onUpdate(_Update event, Emitter<PetitionsState> emit) {
    final index = state.petitions.indexWhere(
      (element) => element.id == event.petition.id,
    );
    if (index == -1) return;

    final updatedPetitions = List<Petition>.from(state.petitions);
    updatedPetitions[index] = event.petition;

    emit(
      state.copyWith(
        petitions: updatedPetitions,
        status: PetitionsStatus.success,
      ),
    );
  }

  void _onRemove(_Remove event, Emitter<PetitionsState> emit) {
    final updatedPetitions = state.petitions
        .where((element) => element.id != event.petitionId)
        .toList();

    emit(
      state.copyWith(
        petitions: updatedPetitions,
        status: PetitionsStatus.success,
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
