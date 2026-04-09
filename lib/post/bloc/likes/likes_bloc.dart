import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/user/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'likes_bloc.freezed.dart';
part 'likes_state.dart';
part 'likes_event.dart';

const String stream = 'posts';
const String action = 'liked_posts';

class LikesBloc extends Bloc<LikesEvent, LikesState> {
  LikesBloc({required this.webSocketService}) : super(const LikesState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Get>((event, emit) => _onGet(event, emit));
    on<_Received>((event, emit) => _onReceived(event, emit));
    on<_Update>((event, emit) => _onUpdate(event, emit));
  }

  void _onGet(_Get event, Emitter<LikesState> emit) {
    emit(state.copyWith(status: LikesStatus.loading, userId: event.user.id));
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: LikesStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': action,
        'request_id': event.user.id,
        'user': event.user.id,
        'previous_posts': event.previousPosts?.map((post) => post.id).toList(),
      },
    };
    webSocketService.send(message);
  }

  void _onReceived(_Received event, Emitter<LikesState> emit) {
    emit(state.copyWith(status: LikesStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        event.payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      List previousPosts = event.payload['data']['previous_posts'] ?? [];
      emit(
        state.copyWith(
          status: LikesStatus.success,
          posts: previousPosts.isEmpty ? posts : [...state.posts, ...posts],
          userId: event.payload['request_id'],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: LikesStatus.failure));
    }
  }

  void _onUpdate(_Update event, Emitter<LikesState> emit) {
    emit(state.copyWith(status: LikesStatus.loading));
    emit(state.copyWith(posts: event.posts, status: LikesStatus.success));
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  late StreamSubscription _subscription;
  final WebSocketService webSocketService;
}
