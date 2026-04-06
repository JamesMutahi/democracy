import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/post/models/post.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'replies_bloc.freezed.dart';
part 'replies_state.dart';
part 'replies_event.dart';

const String stream = 'posts';

class RepliesBloc extends Bloc<RepliesEvent, RepliesState> {
  RepliesBloc({required this.webSocketService}) : super(const RepliesState()) {
    webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        if (message['payload']['action'] == 'replies') {
          add(_Received(payload: message['payload']));
        }
      }
    });
    on<_Initialize>((event, emit) {
      emit(RepliesState(postId: event.post.id));
      add(_Get(post: event.post));
    });
    on<_Get>((event, emit) => _onGet(event, emit));
    on<_Received>((event, emit) => _onReceived(event, emit));
    on<_Add>((event, emit) => _onAdd(event, emit));
    on<_Update>((event, emit) => _onUpdate(event, emit));
  }

  void _onGet(_Get event, Emitter<RepliesState> emit) async {
    emit(state.copyWith(status: RepliesStatus.loading));
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'replies',
        'request_id': event.post.id,
        'pk': event.post.id,
        'previous_posts': event.previousPosts?.map((post) => post.id).toList(),
      },
    };
    webSocketService.send(message);
  }

  void _onReceived(_Received event, Emitter<RepliesState> emit) async {
    emit(state.copyWith(status: RepliesStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        event.payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      List previousPosts = event.payload['data']['previous_posts'] ?? [];
      emit(
        state.copyWith(
          status: RepliesStatus.success,
          posts: previousPosts.isEmpty ? posts : [...state.posts, ...posts],
          postId: event.payload['request_id'],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: RepliesStatus.failure));
    }
  }

  void _onAdd(_Add event, Emitter<RepliesState> emit) {
    final exists = state.posts.any((post) => post.id == event.post.id);

    if (!exists) {
      emit(
        state.copyWith(
          posts: [event.post, ...state.posts],
          status: RepliesStatus.success,
        ),
      );
    }
  }

  void _onUpdate(_Update event, Emitter<RepliesState> emit) {
    emit(state.copyWith(status: RepliesStatus.loading));
    emit(state.copyWith(posts: event.posts, status: RepliesStatus.success));
  }

  final WebSocketService webSocketService;
}

List<int> getThreadIds(List<Post> thread) {
  List<int> postIds = [];
  for (Post post in thread) {
    postIds.add(post.id);
    if (post.thread.isNotEmpty) {
      postIds.addAll(getThreadIds(post.thread));
    }
  }
  return postIds;
}
