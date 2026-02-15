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
    webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        if (message['payload']['action'] == 'user_posts') {
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
    on<_Unsubscribe>((event, emit) {
      _onUnsubscribe(event, emit);
    });
    on<_Resubscribe>((event, emit) {
      _onResubscribe(event, emit);
    });
  }

  Future _onGet(_Get event, Emitter<UserPostsState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'user_posts',
        'request_id': event.user.id,
        'user': event.user.id,
        'last_posts': event.lastPosts?.map((post) => post.id).toList(),
      },
    };
    webSocketService.send(message);
  }

  Future _onReceived(_Received event, Emitter<UserPostsState> emit) async {
    emit(state.copyWith(status: UserPostsStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        event.payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      List lastPosts = event.payload['data']['last_posts'] ?? [];
      emit(
        state.copyWith(
          status: UserPostsStatus.success,
          posts: lastPosts.isEmpty ? posts : [...state.posts, ...posts],
          userId: event.payload['request_id'],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: UserPostsStatus.failure));
    }
  }

  Future _onUnsubscribe(
    _Unsubscribe event,
    Emitter<UserPostsState> emit,
  ) async {
    List<int> postIds = event.posts.map((post) => post.id).toList();
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'unsubscribe_user_posts',
        'request_id': event.user.id,
        'pks': postIds,
      },
    };
    webSocketService.send(message);
  }

  Future _onResubscribe(
    _Resubscribe event,
    Emitter<UserPostsState> emit,
  ) async {
    List<int> postIds = event.posts.map((post) => post.id).toList();
    List<Post> reposts =
        event.posts.where((post) => post.repostOf != null).toList();
    postIds.addAll(reposts.map((post) => post.id).toList());
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'resubscribe_user_posts',
        'request_id': event.user.id,
        'pks': postIds,
      },
    };
    webSocketService.send(message);
  }

  final WebSocketService webSocketService;
}
