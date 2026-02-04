import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/ballot/models/option.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ballot_detail_bloc.freezed.dart';
part 'ballot_detail_state.dart';
part 'ballot_detail_event.dart';

const String stream = 'ballots';
const String requestId = 'ballots';

class BallotDetailBloc extends Bloc<BallotDetailEvent, BallotDetailState> {
  BallotDetailBloc({required this.webSocketService})
    : super(const BallotDetailState.initial()) {
    webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        switch (message['payload']['action']) {
          case 'create':
            add(_Created(payload: message['payload']));
          case 'update':
            add(_Updated(payload: message['payload']));
          case 'delete':
            add(_Deleted(payload: message['payload']));
          case 'vote':
            add(_Received(payload: message['payload']));
        }
      }
    });
    on<_Created>((event, emit) {
      _onCreated(event, emit);
    });
    on<_Updated>((event, emit) {
      _onUpdated(event, emit);
    });
    on<_Deleted>((event, emit) {
      _onDeleted(event, emit);
    });
    on<_Vote>((event, emit) {
      _onVote(event, emit);
    });
    on<_Received>((event, emit) {
      _onReceived(event, emit);
    });
    on<_SubmitReason>((event, emit) {
      _onSubmitReason(event, emit);
    });
  }

  Future _onCreated(_Created event, Emitter<BallotDetailState> emit) async {
    emit(BallotDetailLoading());
    if (event.payload['response_status'] == 201) {
      Ballot ballot = Ballot.fromJson(event.payload['data']);
      emit(BallotCreated(ballot: ballot));
    } else {
      emit(BallotDetailFailure(error: event.payload['errors'][0]));
    }
  }

  Future _onUpdated(_Updated event, Emitter<BallotDetailState> emit) async {
    emit(BallotDetailLoading());
    if (event.payload['response_status'] == 200) {
      final Ballot ballot = Ballot.fromJson(event.payload['data']);
      emit(BallotUpdated(ballot: ballot));
    } else {
      emit(BallotDetailFailure(error: event.payload['errors'][0]));
    }
  }

  Future _onDeleted(_Deleted event, Emitter<BallotDetailState> emit) async {
    emit(BallotDetailLoading());
    if (event.payload['response_status'] == 204) {
      emit(BallotDeleted(ballotId: event.payload['pk']));
    } else {
      emit(BallotDetailFailure(error: event.payload['errors'][0]));
    }
  }

  Future _onVote(_Vote event, Emitter<BallotDetailState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'vote',
        'request_id': requestId,
        'pk': event.option.id,
      },
    };
    webSocketService.send(message);
  }

  Future _onReceived(_Received event, Emitter<BallotDetailState> emit) async {
    emit(BallotDetailLoading());
    if (event.payload['response_status'] == 200) {
      //
    } else {
      emit(BallotDetailFailure(error: event.payload['errors'][0]));
    }
  }

  Future _onSubmitReason(
    _SubmitReason event,
    Emitter<BallotDetailState> emit,
  ) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'add_reason',
        'request_id': requestId,
        'pk': event.ballot.id,
        'text': event.text,
      },
    };
    webSocketService.send(message);
  }

  final WebSocketService webSocketService;
}
