import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/utils/transformers.dart';
import 'package:democracy/post/models/post.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_notes_event.dart';
part 'community_notes_state.dart';
part 'community_notes_bloc.freezed.dart';

const String stream = 'posts';

class CommunityNotesBloc
    extends Bloc<CommunityNotesEvent, CommunityNotesState> {
  CommunityNotesBloc({required this.webSocketService})
    : super(const CommunityNotesState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        if (message['payload']['action'] == 'community_notes') {
          add(_Received(payload: message['payload']));
        }
      }
    });
    on<_Get>((event, emit) => _onGet(event, emit), transformer: debounce());
    on<_Received>((event, emit) => _onReceived(event, emit));
    on<_Update>((event, emit) => _onUpdate(event, emit));
  }

  void _onGet(_Get event, Emitter<CommunityNotesState> emit) async {
    emit(
      state.copyWith(
        status: CommunityNotesStatus.loading,
        postId: event.post.id,
      ),
    );
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: CommunityNotesStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'community_notes',
        'request_id': event.post.id,
        'pk': event.post.id,
        'search_term': event.searchTerm,
        'sort_by': event.sortBy,
        'previous_posts': event.previousPosts?.map((post) => post.id).toList(),
      },
    };
    webSocketService.send(message);
  }

  void _onReceived(_Received event, Emitter<CommunityNotesState> emit) async {
    emit(state.copyWith(status: CommunityNotesStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Post> communityNotes = List.from(
        event.payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      List previousPosts = event.payload['data']['previous_posts'] ?? [];
      emit(
        state.copyWith(
          status: CommunityNotesStatus.success,
          communityNotes: previousPosts.isEmpty
              ? communityNotes
              : [...state.communityNotes, ...communityNotes],
          postId: event.payload['request_id'],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: CommunityNotesStatus.failure));
    }
  }

  void _onUpdate(_Update event, Emitter<CommunityNotesState> emit) {
    emit(state.copyWith(status: CommunityNotesStatus.loading));
    emit(
      state.copyWith(
        communityNotes: event.posts,
        status: CommunityNotesStatus.success,
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
