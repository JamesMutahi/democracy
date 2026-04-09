import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/app/shared/utils/transformers.dart';
import 'package:democracy/post/models/post.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'draft_posts_bloc.freezed.dart';
part 'draft_posts_state.dart';
part 'draft_posts_event.dart';

const String stream = 'posts';
const String requestId = 'posts';
const String action = 'drafts';

class DraftPostsBloc extends Bloc<DraftPostsEvent, DraftPostsState> {
  DraftPostsBloc({required this.webSocketService}) : super(DraftPostsState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Get>((event, emit) => _onGet(event, emit), transformer: debounce());
    on<_Received>((event, emit) => _onReceived(event, emit));
    on<_Update>((event, emit) => _onUpdate(event, emit));
  }

  void _onGet(_Get event, Emitter<DraftPostsState> emit) {
    emit(state.copyWith(status: DraftPostsStatus.loading));
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: DraftPostsStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': action,
        'previous_posts': event.previousPosts?.map((post) => post.id).toList(),
      },
    };
    webSocketService.send(message);
  }

  void _onReceived(_Received event, Emitter<DraftPostsState> emit) {
    emit(state.copyWith(status: DraftPostsStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        event.payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      List previousPosts = event.payload['data']['previous_posts'] ?? [];
      emit(
        state.copyWith(
          status: DraftPostsStatus.success,
          posts: previousPosts.isEmpty ? posts : [...state.posts, ...posts],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: DraftPostsStatus.failure));
    }
  }

  void _onUpdate(_Update event, Emitter<DraftPostsState> emit) {
    emit(state.copyWith(status: DraftPostsStatus.loading));
    emit(state.copyWith(posts: event.posts, status: DraftPostsStatus.success));
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  late StreamSubscription _subscription;
  final WebSocketService webSocketService;
}
