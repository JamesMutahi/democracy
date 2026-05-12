import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/utils/transformers.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hashtags_event.dart';
part 'hashtags_state.dart';
part 'hashtags_bloc.freezed.dart';

const String stream = 'posts';
const String action = 'hashtags';

class HashtagsBloc extends Bloc<HashtagsEvent, HashtagsState> {
  HashtagsBloc({required this.webSocketService})
    : super(const HashtagsState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Get>((event, emit) => _onGet(event, emit), transformer: debounce());
    on<_Received>((event, emit) => _onReceived(event, emit));
  }

  void _onGet(_Get event, Emitter<HashtagsState> emit) async {
    emit(
      HashtagsState(
        status: HashtagsStatus.loading,
        hashtags: event.searchTerm.isEmpty ? [] : ['#${event.searchTerm}'],
        searchTerm: event.searchTerm,
      ),
    );
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: HashtagsStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': action,
        'request_id': event.searchTerm,
        'search_term': event.searchTerm,
      },
    };
    webSocketService.send(message);
  }

  void _onReceived(_Received event, Emitter<HashtagsState> emit) async {
    emit(state.copyWith(status: HashtagsStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<String> hashtags = List.from(
        event.payload['data'].map((e) => e['name']),
      );
      String searchTerm = event.payload['request_id'];
      emit(
        state.copyWith(
          status: HashtagsStatus.success,
          hashtags: hashtags.isEmpty && searchTerm.isNotEmpty
              ? ['#$searchTerm']
              : hashtags,
          searchTerm: searchTerm,
        ),
      );
    } else {
      emit(state.copyWith(status: HashtagsStatus.failure));
    }
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  late StreamSubscription _subscription;
  final WebSocketService webSocketService;
}
