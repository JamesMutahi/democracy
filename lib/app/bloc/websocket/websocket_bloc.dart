import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'websocket_event.dart';

part 'websocket_state.dart';

part 'websocket_bloc.freezed.dart';

// Streams
const String constitutionStream = 'constitution';

// Request ids
const String constitutionRequestId = 'constitution';

class WebsocketBloc extends Bloc<WebsocketEvent, WebsocketState> {
  WebsocketBloc({required this.authRepository, required this.webSocketService})
    : super(const WebsocketState()) {
    on<_Connect>((event, emit) async {
      _onConnect(emit);
    });
    on<_ChangeState>((event, emit) => emit(event.state));
    on<_GetConstitution>((event, emit) {
      _onGetConstitution(emit);
    });
    on<_GetConstitutionTags>((event, emit) {
      _onGetConstitutionTags(emit, event);
    });
    on<_BookmarkSection>((event, emit) {
      _onBookmarkSection(emit, event);
    });
    on<_Disconnect>((event, emit) async {
      await webSocketService.disconnect();
      emit(WebsocketState());
    });
  }

  Future _onConnect(Emitter<WebsocketState> emit) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    try {
      String? token = await authRepository.getToken();
      String url = dotenv.env['WEBSOCKET_URL']!;
      await webSocketService.connect(url, token!);
      add(
        _ChangeState(
          state: state.copyWith(
            status: WebsocketStatus.connected,
            initialConnectionAchieved: true,
          ),
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: WebsocketStatus.failure));
    }
  }


  Future _onGetConstitution(Emitter<WebsocketState> emit) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': constitutionStream,
      'payload': {'action': 'list', 'request_id': constitutionRequestId},
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetConstitutionTags(
    Emitter<WebsocketState> emit,
    _GetConstitutionTags event,
  ) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': constitutionStream,
      'payload': {
        "action": 'tags',
        "request_id": constitutionRequestId,
        'search_term': event.searchTerm,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onBookmarkSection(
    Emitter<WebsocketState> emit,
    _BookmarkSection event,
  ) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': constitutionStream,
      'payload': {
        'action': 'bookmark',
        'request_id': constitutionRequestId,
        'pk': event.section.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  @override
  Future<void> close() {
    _channel.sink.close();
    return super.close();
  }

  late WebSocketChannel _channel;
  final AuthRepository authRepository;
  final WebSocketService webSocketService;
}
