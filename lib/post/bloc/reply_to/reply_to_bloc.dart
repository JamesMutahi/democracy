import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/post/models/post.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reply_to_bloc.freezed.dart';
part 'reply_to_event.dart';
part 'reply_to_state.dart';

const String stream = 'posts';

class ReplyToBloc extends Bloc<ReplyToEvent, ReplyToState> {
  ReplyToBloc({required this.webSocketService}) : super(const ReplyToState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        if (message['payload']['action'] == 'reply_to') {
          add(_Received(payload: message['payload']));
        }
      }
    });
    on<_Get>((event, emit) => _onGet(event, emit));
    on<_Received>((event, emit) => _onReceived(event, emit));
    on<_Add>((event, emit) => _onAdd(event, emit));
    on<_Update>((event, emit) => _onUpdate(event, emit));
  }

  void _onGet(_Get event, Emitter<ReplyToState> emit) {
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: ReplyToStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'reply_to',
        'request_id': event.post.id,
        'pk': event.post.id,
      },
    };
    webSocketService.send(message);
  }

  void _onReceived(_Received event, Emitter<ReplyToState> emit) {
    emit(state.copyWith(status: ReplyToStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        event.payload['data'].map((e) => Post.fromJson(e)),
      );
      emit(
        state.copyWith(
          status: ReplyToStatus.success,
          posts: [...state.posts, ...posts],
          postId: event.payload['request_id'],
        ),
      );
    } else {
      emit(state.copyWith(status: ReplyToStatus.failure));
    }
  }

  void _onAdd(_Add event, Emitter<ReplyToState> emit) {
    final exists = state.posts.any((post) => post.id == event.post.id);

    if (!exists) {
      emit(state.copyWith(status: ReplyToStatus.loading));
      emit(
        state.copyWith(
          posts: [event.post, ...state.posts],
          status: ReplyToStatus.success,
          postId: event.post.id,
        ),
      );
    }
  }

  void _onUpdate(_Update event, Emitter<ReplyToState> emit) {
    emit(state.copyWith(status: ReplyToStatus.loading));
    emit(state.copyWith(posts: event.posts, status: ReplyToStatus.success));
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  late StreamSubscription _subscription;
  final WebSocketService webSocketService;
}

List<int> getPostIds(List<Post> posts) {
  List<int> postIds = [];
  for (Post post in posts) {
    postIds.add(post.id);
    if (post.thread.isNotEmpty) {
      postIds.addAll(getPostIds(post.thread));
    }
  }
  return postIds;
}
