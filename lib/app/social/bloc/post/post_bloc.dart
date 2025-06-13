import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/social/models/post.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
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
      _initialize(emit);
    });
    on<_ChangeState>((event, emit) => emit(event.state));
  }

  Future _initialize(Emitter<PostState> emit) async {
    final wsUrl = Uri.parse('ws://192.168.185.84:8000/posts/');
    final channel = WebSocketChannel.connect(wsUrl);
    await channel.ready;
    channel.sink.add(jsonEncode({"action": "list", "request_id": 42}));
    _websocketSubscription = channel.stream.listen((message) async {
      dynamic decoded = jsonDecode(message);
      if (decoded['response_status'] == 200) {
        final List<Post> posts = List.from(
          decoded['data'].map((e) => Post.fromJson(e)),
        );
        add(
          _ChangeState(
            state: state.copyWith(
              status: PostStatus.success,
              posts: [...state.posts, ...posts],
            ),
          ),
        );
      }
    });
  }

  @override
  Future<void> close() {
    _websocketSubscription.cancel();
    return super.close();
  }

  late StreamSubscription _websocketSubscription;
  final PostRepository postRepository;
}
