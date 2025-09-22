import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/user/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_replies_bloc.freezed.dart';
part 'user_replies_state.dart';
part 'user_replies_event.dart';

const String stream = 'posts';
const String action = 'user_replies';

class UserRepliesBloc extends Bloc<UserRepliesEvent, UserRepliesState> {
  UserRepliesBloc({required this.webSocketService})
    : super(const UserRepliesState()) {
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

  Future _onGet(_Get event, Emitter<UserRepliesState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': action,
        'request_id': event.user.id,
        'user': event.user.id,
        'last_post': event.lastPost?.id,
      },
    };
    webSocketService.send(message);
  }

  Future _onReceived(_Received event, Emitter<UserRepliesState> emit) async {
    emit(state.copyWith(status: UserRepliesStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        event.payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      int? lastPost = event.payload['data']['last_post'];
      emit(
        state.copyWith(
          status: UserRepliesStatus.success,
          posts: lastPost == null ? posts : [...state.posts, ...posts],
          userId: event.payload['request_id'],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: UserRepliesStatus.failure));
    }
  }

  final WebSocketService webSocketService;
}
