import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
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
    webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Get>((event, emit) {
      _onGet(event, emit);
    });
    on<_Received>((event, emit) {
      _onReceived(event, emit);
    });
    on<_Resubscribe>((event, emit) {
      _onResubscribe(event, emit);
    });
  }

  Future _onGet(_Get event, Emitter<PetitionsState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'list',
        'request_id': requestId,
        'search_term': event.searchTerm,
        'last_ballot': event.lastPetition?.id,
      },
    };
    webSocketService.send(message);
  }

  Future _onReceived(_Received event, Emitter<PetitionsState> emit) async {
    emit(state.copyWith(status: PetitionsStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Petition> petitions = List.from(
        event.payload['data']['results'].map((e) => Petition.fromJson(e)),
      );
      int? lastPetition = event.payload['data']['last_petition'];
      emit(
        state.copyWith(
          status: PetitionsStatus.success,
          petitions:
              lastPetition == null
                  ? petitions
                  : [...state.petitions, ...petitions],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: PetitionsStatus.failure));
    }
  }

  Future _onResubscribe(
    _Resubscribe event,
    Emitter<PetitionsState> emit,
  ) async {
    List<int> petitionIds =
        event.petitions.map((petition) => petition.id).toList();
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'resubscribe',
        'request_id': requestId,
        'pks': petitionIds,
      },
    };
    webSocketService.send(message);
  }

  final WebSocketService webSocketService;
}
