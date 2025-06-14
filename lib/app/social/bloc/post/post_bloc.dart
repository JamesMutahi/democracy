import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'post_bloc.freezed.dart';
part 'post_event.dart';
part 'post_provider.dart';
part 'post_repository.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required this.postRepository}) : super(const PostState()) {
    on<_Initialize>((event, emit) async {
      _onInitialize(emit);
    });
    on<_ChangeState>((event, emit) => emit(event.state));
    on<_SendMessage>((event, emit) {
      _onSendMessage(emit, event);
    });
  }

  Future _onInitialize(Emitter<PostState> emit) async {
    final wsUrl = Uri.parse('${dotenv.env['WEBSOCKET_URL']}/posts/');
    _channel = WebSocketChannel.connect(wsUrl);
    await _channel.ready;
    _websocketSubscription = _channel.stream.listen((message) async {
      // Keys: (errors, data, action, response_status, request_id)
      add(
        _ChangeState(
          state: state.copyWith(
            status: PostStatus.success,
            message: jsonDecode(message),
          ),
        ),
      );
    });
    add(_SendMessage(message: {"action": "list", "request_id": 0}));
  }

  Future _onSendMessage(Emitter<PostState> emit, _SendMessage event) async {
    _channel.sink.add(jsonEncode(event.message));
  }

  @override
  Future<void> close() {
    _websocketSubscription.cancel();
    return super.close();
  }

  late WebSocketChannel _channel;
  late StreamSubscription _websocketSubscription;
  final PostRepository postRepository;
}
