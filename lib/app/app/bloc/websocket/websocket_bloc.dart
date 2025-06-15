import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'websocket_event.dart';
part 'websocket_state.dart';
part 'websocket_bloc.freezed.dart';

class WebsocketBloc extends Bloc<WebsocketEvent, WebsocketState> {
  WebsocketBloc() : super(const WebsocketState()) {
    on<_Connect>((event, emit) async {
      _onConnect(emit);
    });
    on<_SendMessage>((event, emit) {
      _onSendMessage(emit, event);
    });
    on<_ChangeState>((event, emit) => emit(event.state));
  }

  Future _onConnect(Emitter<WebsocketState> emit) async {
    try {
      final wsUrl = Uri.parse('${dotenv.env['WEBSOCKET_URL']}');
      _channel = WebSocketChannel.connect(wsUrl);
      await _channel.ready;
      _websocketSubscription = _channel.stream.listen((message) async {
        add(
          _ChangeState(
            state: state.copyWith(
              status: WebsocketStatus.success,
              message: jsonDecode(message),
            ),
          ),
        );
      });
      _channel.sink.add(
        jsonEncode({
          'stream': streams[Stream.posts],
          'payload': {
            'action': actions[Act.list],
            'request_id': requests[Request.posts],
          },
        }),
      );
    } catch (e) {
      add(_ChangeState(state: state.copyWith(status: WebsocketStatus.failure)));
    }
  }

  Future _onSendMessage(
    Emitter<WebsocketState> emit,
    _SendMessage event,
  ) async {
    _channel.sink.add(jsonEncode(event.message));
  }

  @override
  Future<void> close() {
    _websocketSubscription.cancel();
    return super.close();
  }

  late WebSocketChannel _channel;
  late StreamSubscription _websocketSubscription;
}
