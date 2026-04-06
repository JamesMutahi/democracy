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
    on<_Initialize>((event, emit) {
      emit(ForYouState());
      add(_Get());
    });
    on<_Get>((event, emit) => _onGet(event, emit));
    on<_Received>((event, emit) => _onReceived(event, emit));
    on<_Update>((event, emit) => _onUpdate(event, emit));
  }

  void _onGet(_Get event, Emitter<ForYouState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': action,
        'request_id': requestId,
        'previous_posts': event.previousPosts?.map((post) => post.id).toList(),
      },
    };
    webSocketService.send(message);
  }

  void _onReceived(_Received event, Emitter<ForYouState> emit) async {
    emit(state.copyWith(status: ForYouStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        event.payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      List previousPosts = event.payload['data']['previous_posts'] ?? [];
      emit(
        state.copyWith(
          status: ForYouStatus.success,
          posts: previousPosts.isEmpty ? posts : [...state.posts, ...posts],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: ForYouStatus.failure));
    }
  }

  void _onUpdate(_Update event, Emitter<ForYouState> emit) {
    emit(state.copyWith(status: ForYouStatus.loading));
    emit(state.copyWith(posts: event.posts, status: ForYouStatus.success));
  }

  final WebSocketService webSocketService;
}
