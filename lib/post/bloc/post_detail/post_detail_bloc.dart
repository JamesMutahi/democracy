import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/repository/api_repository.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/app/shared/constants/strings.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/meet/models/meeting.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'post_detail_bloc.freezed.dart';
part 'post_detail_state.dart';
part 'post_detail_event.dart';

const String stream = 'posts';
const String requestId = 'posts';

class PostDetailBloc extends Bloc<PostDetailEvent, PostDetailState> {
  PostDetailBloc({
    required this.webSocketService,
    required this.authRepository,
    required this.apiRepository,
  }) : super(const PostDetailState.initial()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        switch (message['payload']['action']) {
          case 'create':
            add(_Created(payload: message['payload']));
          case 'retrieve':
            add(_Loaded(payload: message['payload']));
          case 'update':
            add(_Updated(payload: message['payload']));
          case 'patch':
            add(_Patched(payload: message['payload']));
          case 'delete':
            add(_Deleted(payload: message['payload']));
          case 'delete_repost':
            add(_RepostDeleted(payload: message['payload']));
          case 'like':
            add(_Liked(payload: message['payload']));
          case 'bookmark':
            add(_Bookmarked(payload: message['payload']));
          case 'upvote':
            add(_Upvoted(payload: message['payload']));
          case 'downvote':
            add(_Downvoted(payload: message['payload']));
          case 'add_view':
            add(_ViewAdded(payload: message['payload']));
          case 'report':
            add(_Reported(payload: message['payload']));
        }
      }
    });
    on<_Created>((event, emit) => _onCreated(event, emit));
    on<_Loaded>((event, emit) => _onLoaded(event, emit));
    on<_Updated>((event, emit) => _onUpdated(event, emit));
    on<_Patched>((event, emit) => _onPatched(event, emit));
    on<_Deleted>((event, emit) => _onDeleted(event, emit));
    on<_RepostDeleted>((event, emit) => _onRepostDeleted(event, emit));
    on<_Reported>((event, emit) => _onReported(event, emit));
    on<_Create>((event, emit) async => await _onCreate(event, emit));
    on<_Get>((event, emit) => _onGet(event, emit));
    on<_Patch>((event, emit) async => await _onPatch(event, emit));
    on<_AddView>((event, emit) => _onAddView(event, emit));
    on<_Like>((event, emit) => _onLike(event, emit));
    on<_Bookmark>((event, emit) => _onBookmark(event, emit));
    on<_Upvote>((event, emit) => _onUpvote(event, emit));
    on<_Downvote>((event, emit) => _onDownvote(event, emit));
    on<_Delete>((event, emit) => _onDelete(event, emit));
    on<_DeleteRepost>((event, emit) => _onDeleteRepost(event, emit));
    on<_Liked>((event, emit) => _onLiked(event, emit));
    on<_Bookmarked>((event, emit) => _onBookmarked(event, emit));
    on<_Upvoted>((event, emit) => _onUpvoted(event, emit));
    on<_Downvoted>((event, emit) => _onDownvoted(event, emit));
    on<_ViewAdded>((event, emit) => _onViewAdded(event, emit));
    on<_Report>((event, emit) => _onReport(event, emit));
    on<_Unsubscribe>((event, emit) => _onUnsubscribe(event, emit));
  }

  void _onCreated(_Created event, Emitter<PostDetailState> emit) {
    if (event.payload['response_status'] == 201) {
      final Post post = Post.fromJson(event.payload['data']);
      emit(PostCreated(post: post));
    } else {
      emit(PostDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onLoaded(_Loaded event, Emitter<PostDetailState> emit) {
    emit(PostDetailLoading());
    if (event.payload['response_status'] == 200) {
      final Post post = Post.fromJson(event.payload['data']);
      emit(PostLoaded(post: post));
    } else {
      emit(PostDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onUpdated(_Updated event, Emitter<PostDetailState> emit) {
    emit(PostDetailLoading());
    if (event.payload['response_status'] == 200) {
      emit(
        PostUpdated(
          postId: event.payload['data']['id'],
          body: event.payload['data']['body'],
          likes: event.payload['data']['likes'],
          isLiked: event.payload['data']['is_liked'],
          bookmarks: event.payload['data']['bookmarks'],
          isBookmarked: event.payload['data']['is_bookmarked'],
          views: event.payload['data']['views'],
          isViewed: event.payload['data']['is_viewed'],
          replies: event.payload['data']['replies'],
          reposts: event.payload['data']['reposts'],
          upvotes: event.payload['data']['upvotes'],
          downvotes: event.payload['data']['downvotes'],
          communityNote: event.payload['data']['community_note'],
          isUpvoted: event.payload['data']['is_upvoted'],
          isDownvoted: event.payload['data']['is_downvoted'],
          isReposted: event.payload['data']['is_reposted'],
          isQuoted: event.payload['data']['is_quoted'],
          isDeleted: event.payload['data']['is_deleted'],
          isActive: event.payload['data']['is_active'],
        ),
      );
    } else {
      emit(PostDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onPatched(_Patched event, Emitter<PostDetailState> emit) {
    emit(PostDetailLoading());
    if (event.payload['response_status'] == 200) {
      final Post post = Post.fromJson(event.payload['data']);
      emit(PostPatched(post: post));
    } else {
      emit(PostDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onDeleted(_Deleted event, Emitter<PostDetailState> emit) {
    emit(PostDetailLoading());
    if (event.payload['response_status'] == 204) {
      emit(PostDeleted(postId: event.payload['request_id']));
    } else {
      emit(PostDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onRepostDeleted(_RepostDeleted event, Emitter<PostDetailState> emit) {
    emit(PostDetailLoading());
    if (event.payload['response_status'] == 204) {
      emit(
        RepostDeleted(
          postId: event.payload['data']['pk'],
          repostId: event.payload['data']['repost_pk'],
          reposts: event.payload['data']['reposts'],
        ),
      );
    } else {
      emit(PostDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onLiked(_Liked event, Emitter<PostDetailState> emit) {
    if (event.payload['response_status'] == 200) {
      emit(
        PostLiked(
          postId: event.payload['data']['pk'],
          isLiked: event.payload['data']['is_liked'],
          likes: event.payload['data']['likes'],
        ),
      );
    } else {
      emit(PostDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onBookmarked(_Bookmarked event, Emitter<PostDetailState> emit) {
    if (event.payload['response_status'] == 200) {
      emit(
        PostBookmarked(
          postId: event.payload['data']['pk'],
          isBookmarked: event.payload['data']['is_bookmarked'],
          bookmarks: event.payload['data']['bookmarks'],
        ),
      );
    } else {
      emit(PostDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onUpvoted(_Upvoted event, Emitter<PostDetailState> emit) {
    if (event.payload['response_status'] == 200) {
      emit(
        PostUpvoted(
          postId: event.payload['data']['pk'],
          isUpvoted: event.payload['data']['is_upvoted'],
          upvotes: event.payload['data']['upvotes'],
        ),
      );
    } else {
      emit(PostDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onDownvoted(_Downvoted event, Emitter<PostDetailState> emit) {
    if (event.payload['response_status'] == 200) {
      emit(
        PostDownvoted(
          postId: event.payload['data']['pk'],
          isDownvoted: event.payload['data']['is_downvoted'],
          downvotes: event.payload['data']['downvotes'],
        ),
      );
    } else {
      emit(PostDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onViewAdded(_ViewAdded event, Emitter<PostDetailState> emit) {
    if (event.payload['response_status'] == 200) {
      emit(PostViewed(postId: event.payload['data']['pk']));
    } else {
      emit(PostDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onReported(_Reported event, Emitter<PostDetailState> emit) {
    emit(PostDetailLoading());
    if (event.payload['response_status'] == 200) {
      emit(PostReported());
    } else {
      emit(PostDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  Future _onCreate(_Create event, Emitter<PostDetailState> emit) async {
    emit(PostDetailLoading());
    try {
      String? token = await authRepository.getToken();
      Post post = await apiRepository.createPost(
        token: token!,
        body: event.body,
        status: event.status,
        repostOf: event.repostOf,
        replyTo: event.replyTo,
        communityNoteOf: event.communityNoteOf,
        ballot: event.ballot,
        survey: event.survey,
        petition: event.petition,
        meeting: event.meeting,
        section: event.section,
        tags: event.tags,
        imagePath1: event.imagePath1,
        imagePath2: event.imagePath2,
        imagePath3: event.imagePath3,
        imagePath4: event.imagePath4,
        videoPath: event.videoPath,
        filePath: event.filePath,
        location: event.location,
      );
      emit(PostCreated(post: post));
    } catch (e) {
      emit(PostDetailFailure(error: e.toString()));
    }
  }

  void _onGet(_Get event, Emitter<PostDetailState> emit) {
    emit(PostDetailLoading());
    if (!webSocketService.isConnected) {
      emit(PostDetailFailure(error: serverError));
      return;
    }

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

  Future _onPatch(_Patch event, Emitter<PostDetailState> emit) async {
    emit(PostDetailLoading());
    try {
      String? token = await authRepository.getToken();
      Post post = await apiRepository.patchPost(
        token: token!,
        id: event.id,
        body: event.body,
        status: event.status,
        repostOf: event.repostOf,
        replyTo: event.replyTo,
        communityNoteOf: event.communityNoteOf,
        ballot: event.ballot,
        survey: event.survey,
        petition: event.petition,
        meeting: event.meeting,
        section: event.section,
        tags: event.tags,
        imagePath1: event.imagePath1,
        imagePath2: event.imagePath2,
        imagePath3: event.imagePath3,
        imagePath4: event.imagePath4,
        videoPath: event.videoPath,
        filePath: event.filePath,
        location: event.location,
      );
      emit(PostPatched(post: post));
    } catch (e) {
      emit(PostDetailFailure(error: e.toString()));
    }
  }

  void _onAddView(_AddView event, Emitter<PostDetailState> emit) {
    emit(PostDetailLoading());
    if (!webSocketService.isConnected) {
      emit(PostDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'add_view',
        "request_id": requestId,
        'pk': event.post.id,
      },
    };
    webSocketService.send(message);
  }

  void _onLike(_Like event, Emitter<PostDetailState> emit) {
    emit(PostDetailLoading());
    if (!webSocketService.isConnected) {
      emit(PostDetailFailure(error: serverError));
      return;
    }

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

  void _onBookmark(_Bookmark event, Emitter<PostDetailState> emit) {
    emit(PostDetailLoading());
    if (!webSocketService.isConnected) {
      emit(PostDetailFailure(error: serverError));
      return;
    }

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

  void _onUpvote(_Upvote event, Emitter<PostDetailState> emit) {
    emit(PostDetailLoading());
    if (!webSocketService.isConnected) {
      emit(PostDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'upvote',
        'request_id': requestId,
        'pk': event.post.id,
      },
    };
    webSocketService.send(message);
  }

  void _onDownvote(_Downvote event, Emitter<PostDetailState> emit) {
    emit(PostDetailLoading());
    if (!webSocketService.isConnected) {
      emit(PostDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'downvote',
        'request_id': requestId,
        'pk': event.post.id,
      },
    };
    webSocketService.send(message);
  }

  void _onDelete(_Delete event, Emitter<PostDetailState> emit) {
    emit(PostDetailLoading());
    if (!webSocketService.isConnected) {
      emit(PostDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'delete',
        'request_id': event.post.id,
        'pk': event.post.id,
      },
    };
    webSocketService.send(message);
  }

  void _onDeleteRepost(_DeleteRepost event, Emitter<PostDetailState> emit) {
    emit(PostDetailLoading());
    if (!webSocketService.isConnected) {
      emit(PostDetailFailure(error: serverError));
      return;
    }

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

  void _onReport(_Report event, Emitter<PostDetailState> emit) {
    emit(PostDetailLoading());
    if (!webSocketService.isConnected) {
      emit(PostDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'report',
        'data': {'issue': event.issue, 'post': event.post.id},
      },
    };
    webSocketService.send(message);
  }

  void _onUnsubscribe(_Unsubscribe event, Emitter<PostDetailState> emit) {
    emit(PostDetailLoading());
    if (!webSocketService.isConnected) {
      emit(PostDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'unsubscribe',
        'request_id': event.post.id,
        'pk': event.post.id,
      },
    };
    webSocketService.send(message);
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  late StreamSubscription _subscription;
  final WebSocketService webSocketService;
  final AuthRepository authRepository;
  final APIRepository apiRepository;
}
