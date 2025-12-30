import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/user/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_community_notes_event.dart';
part 'user_community_notes_state.dart';
part 'user_community_notes_bloc.freezed.dart';

const String stream = 'posts';
const String action = 'user_community_notes';

class UserCommunityNotesBloc
    extends Bloc<UserCommunityNotesEvent, UserCommunityNotesState> {
  UserCommunityNotesBloc({required this.webSocketService})
    : super(const UserCommunityNotesState()) {
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

  Future _onGet(_Get event, Emitter<UserCommunityNotesState> emit) async {
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

  Future _onReceived(
    _Received event,
    Emitter<UserCommunityNotesState> emit,
  ) async {
    emit(state.copyWith(status: UserCommunityNotesStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        event.payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      int? lastPost = event.payload['data']['last_post'];
      emit(
        state.copyWith(
          status: UserCommunityNotesStatus.success,
          posts: lastPost == null ? posts : [...state.posts, ...posts],
          userId: event.payload['request_id'],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: UserCommunityNotesStatus.failure));
    }
  }

  final WebSocketService webSocketService;
}
