import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/app/utils/transformers.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ballots_bloc.freezed.dart';
part 'ballots_state.dart';
part 'ballots_event.dart';

const String stream = 'ballots';
const String requestId = 'ballots';
const String action = 'list';

class BallotsBloc extends Bloc<BallotsEvent, BallotsState> {
  BallotsBloc({required this.webSocketService}) : super(const BallotsState()) {
    webSocketService.messages.listen((message) {
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
  }

  Future _onGet(_Get event, Emitter<BallotsState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'list',
        'request_id': requestId,
        'search_term': event.searchTerm,
        'last_ballot': event.lastBallot?.id,
        'is_active': event.isActive,
        'sort_by': event.sortBy,
        'filter_by_region': event.filterByRegion,
        'start_date': event.startDate?.toIso8601String(),
        'end_date': event.endDate?.toIso8601String(),
      },
    };
    webSocketService.send(message);
  }

  Future _onReceived(_Received event, Emitter<BallotsState> emit) async {
    emit(state.copyWith(status: BallotsStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Ballot> ballots = List.from(
        event.payload['data']['results'].map((e) => Ballot.fromJson(e)),
      );
      int? lastBallot = event.payload['data']['last_ballot'];
      emit(
        state.copyWith(
          status: BallotsStatus.success,
          ballots:
              lastBallot == null ? ballots : [...state.ballots, ...ballots],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: BallotsStatus.failure));
    }
  }

  final WebSocketService webSocketService;
}
