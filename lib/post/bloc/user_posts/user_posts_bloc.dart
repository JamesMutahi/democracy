import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/user/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_posts_bloc.freezed.dart';
part 'user_posts_state.dart';
part 'user_posts_event.dart';

const String stream = 'posts';

class UserPostsBloc extends Bloc<UserPostsEvent, UserPostsState> {
  UserPostsBloc({required this.webSocketService})
    : super(const UserPostsState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        if (message['payload']['action'] == 'user_posts') {
          add(_Received(payload: message['payload']));
        }
      }
    });
    on<_Get>((event, emit) => _onGet(event, emit));
    on<_Received>((event, emit) => _onReceived(event, emit));
    on<_Update>((event, emit) => _onUpdate(event, emit));
  }

  void _onGet(_Get event, Emitter<UserPostsState> emit) async {
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: UserPostsStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'user_posts',
        'request_id': event.user.id,
        'user': event.user.id,
        'previous_posts': event.previousPosts?.map((post) => post.id).toList(),
      },
    };
    webSocketService.send(message);
  }

  void _onReceived(_Received event, Emitter<UserPostsState> emit) async {
    emit(state.copyWith(status: UserPostsStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        event.payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      List previousPosts = event.payload['data']['previous_posts'] ?? [];
      emit(
        state.copyWith(
          status: UserPostsStatus.success,
          posts: previousPosts.isEmpty ? posts : [...state.posts, ...posts],
          userId: event.payload['request_id'],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: UserPostsStatus.failure));
    }
  }

  void _onUpdate(_Update event, Emitter<UserPostsState> emit) {
    emit(state.copyWith(status: UserPostsStatus.loading));
    emit(state.copyWith(posts: event.posts, status: UserPostsStatus.success));
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  late StreamSubscription _subscription;
  final WebSocketService webSocketService;
}
