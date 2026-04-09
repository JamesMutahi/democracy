import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/app/shared/utils/transformers.dart';
import 'package:democracy/post/models/post.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recent_posts_event.dart';
part 'recent_posts_state.dart';
part 'recent_posts_bloc.freezed.dart';

const String stream = 'posts';
const String action = 'list';

class RecentPostsBloc extends Bloc<RecentPostsEvent, RecentPostsState> {
  RecentPostsBloc({required this.webSocketService})
    : super(RecentPostsState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        if (message['payload']['action'] == action) {
          if (message['payload']['request_id']['sort_by'] == 'recent') {
            add(_Received(payload: message['payload']));
          }
        }
      }
    });
    on<_Get>((event, emit) => _onGet(event, emit), transformer: debounce());
    on<_Received>((event, emit) => _onReceived(event, emit));
    on<_Update>((event, emit) => _onUpdate(event, emit));
  }

  void _onGet(_Get event, Emitter<RecentPostsState> emit) async {
    emit(
      state.copyWith(
        status: RecentPostsStatus.loading,
        searchTerm: event.searchTerm,
      ),
    );
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: RecentPostsStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": action,
        "request_id": {'searchTerm': event.searchTerm, 'sort_by': 'recent'},
        'search_term': event.searchTerm,
        'previous_posts': event.previousPosts?.map((post) => post.id).toList(),
        'start_date': event.startDate?.toIso8601String(),
        'end_date': event.endDate?.toIso8601String(),
      },
    };
    webSocketService.send(message);
  }

  void _onReceived(_Received event, Emitter<RecentPostsState> emit) async {
    emit(state.copyWith(status: RecentPostsStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        event.payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      List previousPosts = event.payload['data']['previous_posts'] ?? [];
      emit(
        state.copyWith(
          status: RecentPostsStatus.success,
          searchTerm: event.payload['request_id']['searchTerm'],
          posts: previousPosts.isEmpty ? posts : [...state.posts, ...posts],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: RecentPostsStatus.failure));
    }
  }

  void _onUpdate(_Update event, Emitter<RecentPostsState> emit) {
    emit(state.copyWith(status: RecentPostsStatus.loading));
    emit(state.copyWith(posts: event.posts, status: RecentPostsStatus.success));
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  late StreamSubscription _subscription;
  final WebSocketService webSocketService;
}
