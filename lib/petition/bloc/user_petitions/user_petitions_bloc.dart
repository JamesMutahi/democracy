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
    on<_Get>((event, emit) {
      _onGet(event, emit);
    });
    on<_Received>((event, emit) {
      _onReceived(event, emit);
    });
    on<_Resubscribe>((event, emit) {
      _onResubscribe(event, emit);
    });
    on<_Unsubscribe>((event, emit) {
      _onUnsubscribe(event, emit);
    });
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

  Future _onResubscribe(
    _Resubscribe event,
    Emitter<UserPetitionsState> emit,
  ) async {
    List<int> petitionIds = event.petitions
        .map((petition) => petition.id)
        .toList();
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'resubscribe_user_petitions',
        'request_id': event.user.id,
        'pks': petitionIds,
      },
    };
    webSocketService.send(message);
  }

  Future _onUnsubscribe(
    _Unsubscribe event,
    Emitter<UserPetitionsState> emit,
  ) async {
    List<int> petitionIds = event.petitions
        .map((petition) => petition.id)
        .toList();
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'unsubscribe_user_petitions',
        'request_id': event.user.id,
        'pks': petitionIds,
      },
    };
    webSocketService.send(message);
  }

  final WebSocketService webSocketService;
}
