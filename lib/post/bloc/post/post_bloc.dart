import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/post/models/post.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_event.dart';
part 'post_state.dart';
part 'post_bloc.freezed.dart';

const String stream = 'posts';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required this.webSocketService}) : super(const PostState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        switch (message['payload']['action']) {
          case 'retrieve':
            add(_Loaded(payload: message['payload']));
        }
      }
    });
    on<_Load>((event, emit) => _onLoad(event, emit));
    on<_Loaded>((event, emit) => _onLoaded(event, emit));
    on<_Updated>((event, emit) => _onUpdated(event, emit));
  }

  void _onLoad(_Load event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: PostStatus.loading, postId: event.postId));
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: PostStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'retrieve',
        'request_id': event.postId,
        'pk': event.postId,
      },
    };
    webSocketService.send(message);
  }

  void _onLoaded(_Loaded event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: PostStatus.loading));
    if (event.payload['response_status'] == 200) {
      final post = Post.fromJson(event.payload['data']);
      emit(
        state.copyWith(
          status: PostStatus.success,
          post: post,
          postId: event.payload['request_id'],
        ),
      );
    } else {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }

  void _onUpdated(_Updated event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: PostStatus.loading));
    emit(
      state.copyWith(
        status: PostStatus.success,
        post: event.post,
        postId: event.post.id,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  late StreamSubscription _subscription;
  final WebSocketService webSocketService;
}
