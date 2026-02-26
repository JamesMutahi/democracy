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
    webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        if (message['payload']['action'] == 'reply_to') {
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

  Future _onGet(_Get event, Emitter<ReplyToState> emit) async {
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

  Future _onReceived(_Received event, Emitter<ReplyToState> emit) async {
    emit(state.copyWith(status: ReplyToStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        event.payload['data'].map((e) => Post.fromJson(e)),
      );
      emit(
        state.copyWith(
          status: ReplyToStatus.success,
          posts: posts,
          postId: event.payload['request_id'],
        ),
      );
    } else {
      emit(state.copyWith(status: ReplyToStatus.failure));
    }
  }

  Future _onResubscribe(_Resubscribe event, Emitter<ReplyToState> emit) async {
    List<int> postIds = [];
    for (Post post in event.posts) {
      postIds.add(post.id);
      if (post.thread.isNotEmpty) {
        postIds.addAll(getPostIds(post.thread));
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

  Future _onUnsubscribe(_Unsubscribe event, Emitter<ReplyToState> emit) async {
    List<int> postIds = [];
    for (Post post in event.posts) {
      postIds.add(post.id);
      if (post.thread.isNotEmpty) {
        postIds.addAll(getPostIds(post.thread));
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
