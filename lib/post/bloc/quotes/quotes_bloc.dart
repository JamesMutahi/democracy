import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/post/models/post.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quotes_event.dart';
part 'quotes_state.dart';
part 'quotes_bloc.freezed.dart';

const String stream = 'posts';

class QuotesBloc extends Bloc<QuotesEvent, QuotesState> {
  QuotesBloc({required this.webSocketService}) : super(const QuotesState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        if (message['payload']['action'] == 'quotes') {
          add(_Received(payload: message['payload']));
        }
      }
    });
    on<_Get>((event, emit) => _onGet(event, emit));
    on<_Received>((event, emit) => _onReceived(event, emit));
    on<_Update>((event, emit) => _onUpdate(event, emit));
  }

  void _onGet(_Get event, Emitter<QuotesState> emit) async {
    emit(state.copyWith(status: QuotesStatus.loading, postId: event.postId));
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: QuotesStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'quotes',
        'request_id': event.postId,
        'pk': event.postId,
        'previous_posts': event.previousPosts?.map((post) => post.id).toList(),
      },
    };
    webSocketService.send(message);
  }

  void _onReceived(_Received event, Emitter<QuotesState> emit) async {
    emit(state.copyWith(status: QuotesStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        event.payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      List previousPosts = event.payload['data']['previous_posts'] ?? [];
      emit(
        state.copyWith(
          status: QuotesStatus.success,
          posts: previousPosts.isEmpty ? posts : [...state.posts, ...posts],
          postId: event.payload['request_id'],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: QuotesStatus.failure));
    }
  }

  void _onUpdate(_Update event, Emitter<QuotesState> emit) {
    emit(state.copyWith(status: QuotesStatus.loading));
    emit(
      state.copyWith(
        postId: event.postId,
        posts: event.posts,
        status: QuotesStatus.success,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  late StreamSubscription _subscription;
  final WebSocketService webSocketService;
}
