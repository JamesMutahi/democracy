import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/app/utils/transformers.dart';
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
    webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        if (message['payload']['action'] == 'community_notes') {
          add(_Received(payload: message['payload']));
        }
      }
    });
    on<_Get>((event, emit) {
      _onGet(event, emit);
    }, transformer: debounce());
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

  Future _onGet(_Get event, Emitter<CommunityNotesState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'community_notes',
        'request_id': event.post.id,
        'pk': event.post.id,
        'search_term': event.searchTerm,
        'sort_by': event.sortBy,
        'last_posts': event.lastPosts?.map((post) => post.id).toList(),
      },
    };
    webSocketService.send(message);
  }

  Future _onReceived(_Received event, Emitter<CommunityNotesState> emit) async {
    emit(state.copyWith(status: CommunityNotesStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Post> communityNotes = List.from(
        event.payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      List lastPosts = event.payload['data']['last_posts'] ?? [];
      emit(
        state.copyWith(
          status: CommunityNotesStatus.success,
          communityNotes: lastPosts.isEmpty
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

  Future _onResubscribe(
    _Resubscribe event,
    Emitter<CommunityNotesState> emit,
  ) async {
    List<int> pks = [];
    for (Post post in event.communityNotes) {
      pks.add(post.id);
    }
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'resubscribe_community_notes',
        'request_id': event.post.id,
        'pks': pks,
      },
    };
    webSocketService.send(message);
  }

  Future _onUnsubscribe(
    _Unsubscribe event,
    Emitter<CommunityNotesState> emit,
  ) async {
    List<int> pks = [];
    for (Post post in event.communityNotes) {
      pks.add(post.id);
    }
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'unsubscribe_community_notes',
        'request_id': event.post.id,
        'pks': pks,
      },
    };
    webSocketService.send(message);
  }

  final WebSocketService webSocketService;
}
