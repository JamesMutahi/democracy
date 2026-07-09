import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/models/simple_user.dart';
import 'package:democracy/app/shared/utils/transformers.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'autocomplete_event.dart';
part 'autocomplete_state.dart';
part 'autocomplete_bloc.freezed.dart';

const String stream = 'posts';
const String requestId = 'autocomplete';
const String action = 'autocomplete';

class AutocompleteBloc extends Bloc<AutocompleteEvent, AutocompleteState> {
  AutocompleteBloc({required this.webSocketService})
    : super(AutocompleteState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Search>(
      (event, emit) => _onSearch(event, emit),
      transformer: debounce(),
    );
    on<_Received>((event, emit) => _onReceived(event, emit));
    on<_Redo>((event, emit) {
      add(_Search(searchTerm: state.searchTerm));
    });
  }

  void _onSearch(_Search event, Emitter<AutocompleteState> emit) {
    emit(state.copyWith(status: AutocompleteStatus.loading));
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: AutocompleteStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': action,
        'request_id': event.searchTerm,
        'query': event.searchTerm,
      },
    };
    webSocketService.send(message);
  }

  void _onReceived(_Received event, Emitter<AutocompleteState> emit) {
    emit(state.copyWith(status: AutocompleteStatus.loading));
    if (event.payload['response_status'] == 200) {
      List<String> hashtags = [];
      List<String> words = [];
      List<SimpleUser> users = [];
      for (Map<String, dynamic> result in event.payload['data']) {
        if (result['type'] == 'hashtag') {
          hashtags.add(result['text']);
        }
        if (result['type'] == 'word') {
          words.add(result['text']);
        }
        if (result['type'] == 'user') {
          users.add(SimpleUser.fromJson(result));
        }
      }
      emit(
        state.copyWith(
          status: AutocompleteStatus.success,
          searchTerm: event.payload['request_id'],
          hashtags: hashtags,
          words: words,
          users: users,
        ),
      );
    } else {
      emit(state.copyWith(status: AutocompleteStatus.failure));
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
