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
    on<_Get>((event, emit) {
      _onGet(event, emit);
    });
    on<_Received>((event, emit) {
      _onReceived(event, emit);
    });
    on<_Resubscribe>((event, emit) {
      _onResubscribe(event, emit);
    });
    on<_Unsubscribe>((event, emit) {
      _onUnsubscribe(event, emit);
    });
  }

  Future _onGet(_Get event, Emitter<RepliesState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'replies',
        'request_id': event.post.id,
        'pk': event.post.id,
        'last_posts': event.lastPosts?.map((post) => post.id).toList(),
      },
    };
    webSocketService.send(message);
  }

  Future _onReceived(_Received event, Emitter<RepliesState> emit) async {
    emit(state.copyWith(status: RepliesStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        event.payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      List lastPosts = event.payload['data']['last_posts'] ?? [];
      emit(
        state.copyWith(
          status: RepliesStatus.success,
          posts: lastPosts.isEmpty ? posts : [...state.posts, ...posts],
          postId: event.payload['request_id'],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: RepliesStatus.failure));
    }
  }

  Future _onResubscribe(_Resubscribe event, Emitter<RepliesState> emit) async {
    List<int> postIds = [];
    for (Post post in event.replies) {
      postIds.add(post.id);
      if (post.thread.isNotEmpty) {
        postIds.addAll(getThreadIds(post.thread));
      }
    }
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'resubscribe_replies',
        'request_id': event.post.id,
        'pks': postIds,
      },
    };
    webSocketService.send(message);
  }

  Future _onUnsubscribe(_Unsubscribe event, Emitter<RepliesState> emit) async {
    List<int> postIds = [];
    for (Post post in event.replies) {
      postIds.add(post.id);
      if (post.thread.isNotEmpty) {
        postIds.addAll(getThreadIds(post.thread));
      }
    }
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'unsubscribe_replies',
        'request_id': event.post.id,
        'pks': postIds,
      },
    };
    webSocketService.send(message);
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
