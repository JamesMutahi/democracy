import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/app/utils/transformers.dart';
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
    webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Get>((event, emit) {
      _onGet(event, emit);
    }, transformer: debounce());
    on<_Received>((event, emit) {
      _onReceived(event, emit);
    });
  }

  Future _onGet(_Get event, Emitter<DraftPostsState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': action,
        'last_posts': event.lastPosts?.map((post) => post.id).toList(),
      },
    };
    webSocketService.send(message);
  }

  Future _onReceived(_Received event, Emitter<DraftPostsState> emit) async {
    emit(state.copyWith(status: DraftPostsStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        event.payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      List lastPosts = event.payload['data']['last_posts'] ?? [];
      emit(
        state.copyWith(
          status: DraftPostsStatus.success,
          posts: lastPosts.isEmpty ? posts : [...state.posts, ...posts],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: DraftPostsStatus.failure));
    }
  }

  final WebSocketService webSocketService;
}
