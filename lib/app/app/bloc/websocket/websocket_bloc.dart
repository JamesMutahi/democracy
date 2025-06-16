import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/auth/bloc/auth/auth_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'websocket_event.dart';
part 'websocket_state.dart';
part 'websocket_bloc.freezed.dart';

class WebsocketBloc extends Bloc<WebsocketEvent, WebsocketState> {
  WebsocketBloc({required this.authRepository})
    : super(const WebsocketState()) {
    on<_Connect>((event, emit) async {
      _onConnect(emit);
    });
    on<_ChangeState>((event, emit) => emit(event.state));
    on<_GetPosts>((event, emit) {
      _onGetPosts(emit, event);
    });
    on<_CreatePost>((event, emit) {
      _onCreatePost(emit, event);
    });
  }

  Future _onConnect(Emitter<WebsocketState> emit) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    try {
      String? token = await authRepository.getToken();
      final wsUrl = Uri.parse('${dotenv.env['WEBSOCKET_URL']}');
      _channel = IOWebSocketChannel.connect(
        wsUrl,
        headers: {'Authorization': 'Token $token'},
      );
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

  Future _onGetPosts(Emitter<WebsocketState> emit, _GetPosts event) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': streams[Stream.posts],
      'payload': {
        "action": actions[Act.list],
        "request_id": requests[Request.posts],
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onCreatePost(Emitter<WebsocketState> emit, _CreatePost event) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': streams[Stream.posts],
      'payload': {
        'action': actions[Act.create],
        'request_id': requests[Request.posts],
        'data': {'body': event.body},
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  @override
  Future<void> close() {
    _websocketSubscription.cancel();
    return super.close();
  }

  late WebSocketChannel _channel;
  late StreamSubscription _websocketSubscription;
  final AuthRepository authRepository;
}
