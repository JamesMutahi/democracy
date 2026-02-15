import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/post/models/post.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmarks_bloc.freezed.dart';
part 'bookmarks_state.dart';
part 'bookmarks_event.dart';

const String stream = 'posts';
const String requestId = 'posts';
const String action = 'bookmarks';

class BookmarksBloc extends Bloc<BookmarksEvent, BookmarksState> {
  BookmarksBloc({required this.webSocketService})
    : super(const BookmarksState()) {
    webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Get>((event, emit) {
      _onGet(event, emit);
    });
    on<_Received>((event, emit) {
      _onReceived(event, emit);
    });
  }

  Future _onGet(_Get event, Emitter<BookmarksState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': action,
        'last_posts': event.lastPosts?.map((post) => post.id).toList(),
      },
    };
    webSocketService.send(message);
  }

  Future _onReceived(_Received event, Emitter<BookmarksState> emit) async {
    emit(state.copyWith(status: BookmarksStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        event.payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      List lastPosts = event.payload['data']['last_posts'] ?? [];
      emit(
        state.copyWith(
          status: BookmarksStatus.success,
          posts: lastPosts.isEmpty ? posts : [...state.posts, ...posts],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: BookmarksStatus.failure));
    }
  }

  final WebSocketService webSocketService;
}
