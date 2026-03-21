import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/app/utils/transformers.dart';
import 'package:democracy/post/models/post.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'posts_bloc.freezed.dart';
part 'posts_state.dart';
part 'posts_event.dart';

const String stream = 'posts';
const String action = 'list';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc({required this.webSocketService}) : super(PostsState()) {
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

  Future _onGet(_Get event, Emitter<PostsState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": action,
        "request_id": {'searchTerm': event.searchTerm, 'sort_by': event.sortBy},
        'sort_by': event.sortBy,
        'search_term': event.searchTerm,
        'previous_posts': event.previousPosts?.map((post) => post.id).toList(),
        'start_date': event.startDate?.toIso8601String(),
        'end_date': event.endDate?.toIso8601String(),
      },
    };
    webSocketService.send(message);
  }

  Future _onReceived(_Received event, Emitter<PostsState> emit) async {
    emit(state.copyWith(status: PostsStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        event.payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      List previousPosts = event.payload['data']['previous_posts'] ?? [];
      emit(
        state.copyWith(
          status: PostsStatus.success,
          searchTerm: event.payload['request_id']['searchTerm'],
          sortBy: event.payload['request_id']['sort_by'],
          posts: previousPosts.isEmpty ? posts : [...state.posts, ...posts],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: PostsStatus.failure));
    }
  }

  final WebSocketService webSocketService;
}
