import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/meet/models/meeting.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_detail_bloc.freezed.dart';
part 'post_detail_state.dart';
part 'post_detail_event.dart';

const String stream = 'posts';
const String requestId = 'posts';

class PostDetailBloc extends Bloc<PostDetailEvent, PostDetailState> {
  PostDetailBloc({required this.webSocketService})
    : super(const PostDetailState.initial()) {
    webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        switch (message['payload']['action']) {
          case 'create':
            add(_Created(payload: message['payload']));
          case 'retrieve':
            add(_Loaded(payload: message['payload']));
          case 'update':
            add(_Updated(payload: message['payload']));
          case 'delete':
            add(_Deleted(payload: message['payload']));
          case 'bookmark':
            break;
          case 'report':
            add(_Reported(payload: message['payload']));
        }
      }
    });
    on<_Created>((event, emit) {
      _onCreated(event, emit);
    });
    on<_Loaded>((event, emit) {
      _onLoaded(event, emit);
    });
    on<_Updated>((event, emit) {
      _onUpdated(event, emit);
    });
    on<_Deleted>((event, emit) {
      _onDeleted(event, emit);
    });
    on<_Reported>((event, emit) {
      _onReported(event, emit);
    });
    on<_Create>((event, emit) {
      _onCreate(event, emit);
    });
    on<_Get>((event, emit) {
      _onGet(event, emit);
    });
    on<_Update>((event, emit) {
      _onUpdate(event, emit);
    });
    on<_Like>((event, emit) {
      _onLike(event, emit);
    });
    on<_Bookmark>((event, emit) {
      _onBookmark(event, emit);
    });
    on<_Delete>((event, emit) {
      _onDelete(event, emit);
    });
    on<_DeleteRepost>((event, emit) {
      _onDeleteRepost(event, emit);
    });
    on<_Report>((event, emit) {
      _onReport(event, emit);
    });
  }

  Future _onCreated(_Created event, Emitter<PostDetailState> emit) async {
    if (event.payload['response_status'] == 201) {
      final Post post = Post.fromJson(event.payload['data']);
      emit(PostCreated(post: post));
    } else {
      emit(PostDetailFailure(error: event.payload['errors'][0].toString()));
    }
  }

  Future _onLoaded(_Loaded event, Emitter<PostDetailState> emit) async {
    emit(PostDetailLoading());
    if (event.payload['response_status'] == 200) {
      final Post post = Post.fromJson(event.payload['data']);
      emit(PostLoaded(post: post));
    } else {
      emit(PostDetailFailure(error: event.payload['errors'][0].toString()));
    }
  }

  Future _onUpdated(_Updated event, Emitter<PostDetailState> emit) async {
    emit(PostDetailLoading());
    if (event.payload['response_status'] == 200) {
      emit(
        PostUpdated(
          postId: event.payload['pk'],
          body: event.payload['data']['body'],
          likes: event.payload['data']['likes'],
          isLiked: event.payload['data']['is_liked'],
          bookmarks: event.payload['data']['bookmarks'],
          isBookmarked: event.payload['data']['is_bookmarked'],
          views: event.payload['data']['views'],
          replies: event.payload['data']['replies'],
          reposts: event.payload['data']['reposts'],
          isReposted: event.payload['data']['is_reposted'],
          isQuoted: event.payload['data']['is_quoted'],
          isDeleted: event.payload['data']['is_deleted'],
          isActive: event.payload['data']['is_active'],
        ),
      );
    } else {
      emit(PostDetailFailure(error: event.payload['errors'][0].toString()));
    }
  }

  Future _onDeleted(_Deleted event, Emitter<PostDetailState> emit) async {
    emit(PostDetailLoading());
    if (event.payload['response_status'] == 204) {
      emit(PostDeleted(postId: event.payload['pk']));
    } else {
      emit(PostDetailFailure(error: event.payload['errors'][0].toString()));
    }
  }

  Future _onReported(_Reported event, Emitter<PostDetailState> emit) async {
    emit(PostDetailLoading());
    if (event.payload['response_status'] == 200) {
      emit(PostReported());
    } else {
      emit(PostDetailFailure(error: event.payload['errors'][0].toString()));
    }
  }

  Future _onCreate(_Create event, Emitter<PostDetailState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'create',
        'request_id': requestId,
        'data': {
          'body': event.body,
          'reply_to_id': event.replyTo?.id,
          'repost_of_id': event.repostOf?.id,
          'ballot_id': event.ballot?.id,
          'survey_id': event.survey?.id,
          'petition_id': event.petition?.id,
          'meeting_id': event.meeting?.id,
          'status':
              event.status == PostStatus.published ? 'published' : 'draft',
          'tags': event.tags,
        },
      },
    };
    webSocketService.send(message);
  }

  Future _onGet(_Get event, Emitter<PostDetailState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'retrieve',
        'request_id': requestId,
        'pk': event.post.id,
      },
    };
    webSocketService.send(message);
  }

  Future _onUpdate(_Update event, Emitter<PostDetailState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'patch',
        'request_id': requestId,
        'data': {'pk': event.id, 'body': event.body},
      },
    };
    webSocketService.send(message);
  }

  Future _onLike(_Like event, Emitter<PostDetailState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'like',
        'request_id': requestId,
        'pk': event.post.id,
      },
    };
    webSocketService.send(message);
  }

  Future _onBookmark(_Bookmark event, Emitter<PostDetailState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'bookmark',
        'request_id': requestId,
        'pk': event.post.id,
      },
    };
    webSocketService.send(message);
  }

  Future _onDelete(_Delete event, Emitter<PostDetailState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'delete',
        'request_id': requestId,
        'pk': event.post.id,
      },
    };
    webSocketService.send(message);
  }

  Future _onDeleteRepost(
    _DeleteRepost event,
    Emitter<PostDetailState> emit,
  ) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'delete_repost',
        'request_id': requestId,
        'pk': event.post.id,
      },
    };
    webSocketService.send(message);
  }

  Future _onReport(_Report event, Emitter<PostDetailState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'report',
        'data': {'issue': event.issue, 'post': event.post.id},
      },
    };
    webSocketService.send(message);
  }

  final WebSocketService webSocketService;
}
