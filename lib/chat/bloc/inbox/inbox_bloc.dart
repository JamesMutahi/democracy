import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/repository/database/database_repository.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/utils/transformers.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'inbox_bloc.freezed.dart';
part 'inbox_state.dart';
part 'inbox_event.dart';

const String stream = 'chats';
const String requestId = 'inbox';
const String action = 'inbox';

class InboxBloc extends Bloc<InboxEvent, InboxState> {
  InboxBloc({required this.webSocketService, required this.databaseRepository})
    : super(const InboxState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });

    on<_Get>(
      (event, emit) async => await _onGet(event, emit),
      transformer: debounce(),
    );
    on<_Received>((event, emit) async => await _onReceived(event, emit));
    on<_Update>((event, emit) async => await _onUpdate(event, emit));
  }

  Future _onGet(_Get event, Emitter<InboxState> emit) async {
    // Update state with loading status and current search term
    emit(
      state.copyWith(status: InboxStatus.loading, searchTerm: event.searchTerm),
    );

    // Determine if we are actively searching
    final isSearching = event.searchTerm.trim().isNotEmpty;
    final effectiveSearchTerm = isSearching ? event.searchTerm : null;

    // Immediately show cached results from local DB (filtered if searching)
    final cachedInbox = await databaseRepository.fetchInbox(
      searchTerm: effectiveSearchTerm,
    );

    emit(state.copyWith(chats: cachedInbox));

    // Fetch fresh data from server
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: InboxStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'inbox',
        'request_id': requestId,
        'search_term': effectiveSearchTerm,
        'last_chat': event.lastChat?.id,
      },
    };
    webSocketService.send(message);
  }

  Future _onReceived(_Received event, Emitter<InboxState> emit) async {
    try {
      if (event.payload['response_status'] == 200) {
        // Save the server's response (already filtered by search_term if searching) to local DB
        for (var data in event.payload['data']['results']) {
          await databaseRepository.saveChat(data: data);
        }

        // Re-fetch from local DB, applying the active search term if one exists
        final chats = await databaseRepository.fetchInbox(
          searchTerm: state.searchTerm,
        );

        emit(
          state.copyWith(
            status: InboxStatus.success,
            chats: chats,
            hasNext: event.payload['data']['has_next'],
          ),
        );
      } else {
        emit(state.copyWith(status: InboxStatus.failure));
      }
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: InboxStatus.failure));
    }
  }

  Future _onUpdate(_Update event, Emitter<InboxState> emit) async {
    emit(state.copyWith(status: InboxStatus.loading));
    try {
      // Re-fetch respecting the active search filter
      final chats = await databaseRepository.fetchInbox(
        searchTerm: state.searchTerm,
      );
      emit(state.copyWith(chats: chats, status: InboxStatus.success));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: InboxStatus.failure));
    }
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  late StreamSubscription _subscription;
  final WebSocketService webSocketService;
  final DatabaseRepository databaseRepository;
}
