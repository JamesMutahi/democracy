import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/user/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_petitions_bloc.freezed.dart';
part 'user_petitions_state.dart';
part 'user_petitions_event.dart';

const String stream = 'petitions';
const String action = 'user_petitions';

class UserPetitionsBloc extends Bloc<UserPetitionsEvent, UserPetitionsState> {
  UserPetitionsBloc({required this.webSocketService})
    : super(UserPetitionsState()) {
    webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Get>((event, emit) => _onGet(event, emit));
    on<_Received>((event, emit) => _onReceived(event, emit));
    on<_Add>((event, emit) => _onAdd(event, emit));
    on<_Update>((event, emit) => _onUpdate(event, emit));
    on<_Remove>((event, emit) => _onRemove(event, emit));
  }

  Future _onGet(_Get event, Emitter<UserPetitionsState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': action,
        'request_id': event.user.id,
        'user': event.user.id,
        'previous_petitions': event.previousPetitions
            ?.map((petition) => petition.id)
            .toList(),
      },
    };
    webSocketService.send(message);
  }

  Future _onReceived(_Received event, Emitter<UserPetitionsState> emit) async {
    emit(state.copyWith(status: UserPetitionsStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Petition> petitions = List.from(
        event.payload['data']['results'].map((e) => Petition.fromJson(e)),
      );
      List previousPetitions =
          event.payload['data']['previous_petitions'] ?? [];
      emit(
        state.copyWith(
          status: UserPetitionsStatus.success,
          petitions: previousPetitions.isEmpty
              ? petitions
              : [...state.petitions, ...petitions],
          userId: event.payload['request_id'],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: UserPetitionsStatus.failure));
    }
  }

  void _onAdd(_Add event, Emitter<UserPetitionsState> emit) {
    final exists = state.petitions.any(
      (element) => element.id == event.petition.id,
    );

    if (!exists) {
      emit(
        state.copyWith(
          petitions: [event.petition, ...state.petitions],
          status: UserPetitionsStatus.success,
        ),
      );
    }
  }

  void _onUpdate(_Update event, Emitter<UserPetitionsState> emit) {
    final index = state.petitions.indexWhere(
      (element) => element.id == event.petition.id,
    );
    if (index == -1) return;

    final updatedPetitions = List<Petition>.from(state.petitions);
    updatedPetitions[index] = event.petition;

    emit(
      state.copyWith(
        petitions: updatedPetitions,
        status: UserPetitionsStatus.success,
      ),
    );
  }

  void _onRemove(_Remove event, Emitter<UserPetitionsState> emit) {
    final updatedPetitions = state.petitions
        .where((element) => element.id != event.petitionId)
        .toList();

    emit(
      state.copyWith(
        petitions: updatedPetitions,
        status: UserPetitionsStatus.success,
      ),
    );
  }

  final WebSocketService webSocketService;
}
