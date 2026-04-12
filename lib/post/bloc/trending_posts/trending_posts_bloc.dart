import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/post/models/post.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'trending_posts_event.dart';
part 'trending_posts_state.dart';
part 'trending_posts_bloc.freezed.dart';

const String stream = 'posts';
const String action = 'trending';

class TrendingPostsBloc extends Bloc<TrendingPostsEvent, TrendingPostsState> {
  TrendingPostsBloc({required this.webSocketService})
    : super(const TrendingPostsState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        if (message['payload']['action'] == action) {
          if (message['payload']['sort_by'] != 'recent') {
            add(_Received(payload: message['payload']));
          }
        }
      }
    });
    on<_Get>((event, emit) => _onGet(event, emit));
    on<_Received>((event, emit) => _onReceived(event, emit));
    on<_Update>((event, emit) => _onUpdate(event, emit));
  }

  void _onGet(_Get event, Emitter<TrendingPostsState> emit) async {
    emit(state.copyWith(status: TrendingPostsStatus.loading));
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: TrendingPostsStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": action,
        'previous_posts': event.previousPosts?.map((post) => post.id).toList(),
      },
    };
    webSocketService.send(message);
  }

  void _onReceived(_Received event, Emitter<TrendingPostsState> emit) async {
    emit(state.copyWith(status: TrendingPostsStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        event.payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      List previousPosts = event.payload['data']['previous_posts'] ?? [];
      emit(
        state.copyWith(
          status: TrendingPostsStatus.success,
          posts: previousPosts.isEmpty ? posts : [...state.posts, ...posts],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: TrendingPostsStatus.failure));
    }
  }

  void _onUpdate(_Update event, Emitter<TrendingPostsState> emit) {
    emit(state.copyWith(status: TrendingPostsStatus.loading));
    emit(
      state.copyWith(posts: event.posts, status: TrendingPostsStatus.success),
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
