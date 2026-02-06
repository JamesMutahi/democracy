import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/post/models/post.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'for_you_bloc.freezed.dart';
part 'for_you_state.dart';
part 'for_you_event.dart';

const String stream = 'posts';
const String requestId = 'posts';
const String action = 'for_you';

class ForYouBloc extends Bloc<ForYouEvent, ForYouState> {
  ForYouBloc({required this.webSocketService}) : super(const ForYouState()) {
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

  Future _onGet(_Get event, Emitter<ForYouState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': action,
        'request_id': requestId,
        'last_post': event.lastPost?.id,
      },
    };
    webSocketService.send(message);
  }

  Future _onReceived(_Received event, Emitter<ForYouState> emit) async {
    emit(state.copyWith(status: ForYouStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        event.payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      int? lastPost = event.payload['data']['last_post'];
      emit(
        state.copyWith(
          status: ForYouStatus.success,
          posts: lastPost == null ? posts : [...state.posts, ...posts],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: ForYouStatus.failure));
    }
  }

  final WebSocketService webSocketService;
}
