import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/user/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_event.dart';
part 'post_state.dart';
part 'post_bloc.freezed.dart';

const String stream = 'posts';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required this.webSocketService}) : super(const PostState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        switch (message['payload']['action']) {
          case 'retrieve':
            add(_Loaded(payload: message['payload']));
        }
      }
    });
    on<_Load>((event, emit) => _onLoad(event, emit));
    on<_Loaded>((event, emit) => _onLoaded(event, emit));
    on<_PostCreated>((event, emit) => _onPostCreated(event, emit));
    on<_DetailUpdated>((event, emit) => _onDetailUpdated(event, emit));
    on<_LikeUpdated>((event, emit) => _onLikeUpdated(event, emit));
    on<_BookmarkUpdated>((event, emit) => _onBookmarkUpdated(event, emit));
    on<_UpvoteUpdated>((event, emit) => _onUpvoteUpdated(event, emit));
    on<_DownvoteUpdated>((event, emit) => _onDownvoteUpdated(event, emit));
    on<_AuthorUpdated>((event, emit) => _onAuthorUpdated(event, emit));
    on<_BallotUpdated>((event, emit) => _onBallotUpdated(event, emit));
    on<_SurveyUpdated>((event, emit) => _onSurveyUpdated(event, emit));
    on<_BroadcastUpdated>((event, emit) => _onBroadcastUpdated(event, emit));
    on<_PetitionUpdated>((event, emit) => _onPetitionUpdated(event, emit));
  }

  void _onLoad(_Load event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: PostStatus.loading, postId: event.postId));
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: PostStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'retrieve',
        'request_id': event.postId,
        'pk': event.postId,
      },
    };
    webSocketService.send(message);
  }

  void _onLoaded(_Loaded event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: PostStatus.loading));
    if (event.payload['response_status'] == 200) {
      final post = Post.fromJson(event.payload['data']);
      emit(
        state.copyWith(
          status: PostStatus.success,
          post: post,
          postId: event.payload['request_id'],
        ),
      );
    } else {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }

  void _onPostCreated(_PostCreated event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: PostStatus.loading));
    if (state.post?.id == event.post.repostOf?.id) {
      if (event.post.repostType == RepostType.quote) {
        emit(
          state.copyWith(
            status: PostStatus.success,
            post: state.post!.copyWith(isQuoted: true),
          ),
        );
      }
      if (event.post.repostType == RepostType.repost) {
        emit(
          state.copyWith(
            status: PostStatus.success,
            post: state.post!.copyWith(isReposted: true),
          ),
        );
      }
    }
  }

  void _onDetailUpdated(_DetailUpdated event, Emitter<PostState> emit) async {
    if (event.postId == state.postId) {
      emit(state.copyWith(status: PostStatus.loading));
      emit(
        state.copyWith(
          status: PostStatus.success,
          post: state.post?.copyWith(
            likes: event.likes,
            bookmarks: event.bookmarks,
            views: event.views,
            replies: event.replies,
            reposts: event.reposts,
            communityNote: event.communityNote,
            upvotes: event.upvotes,
            downvotes: event.downvotes,
            isDeleted: event.isDeleted,
            isActive: event.isActive,
          ),
        ),
      );
    }
    // update post's repost_of
    if (state.post?.repostOf?.id == event.postId) {
      emit(state.copyWith(status: PostStatus.loading));
      Post repostOf = state.post!.repostOf!.copyWith(
        likes: event.likes,
        bookmarks: event.bookmarks,
        views: event.views,
        replies: event.replies,
        reposts: event.reposts,
        communityNote: event.communityNote,
        upvotes: event.upvotes,
        downvotes: event.downvotes,
        isDeleted: event.isDeleted,
        isActive: event.isActive,
      );
      emit(
        state.copyWith(
          status: PostStatus.success,
          post: state.post?.copyWith(repostOf: repostOf),
        ),
      );
    }
  }

  void _onLikeUpdated(_LikeUpdated event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: PostStatus.loading));
    emit(
      state.copyWith(
        status: PostStatus.success,
        post: state.post?.copyWith(isLiked: event.isLiked, likes: event.likes),
      ),
    );
  }

  void _onBookmarkUpdated(
    _BookmarkUpdated event,
    Emitter<PostState> emit,
  ) async {
    emit(state.copyWith(status: PostStatus.loading));
    emit(
      state.copyWith(
        status: PostStatus.success,
        post: state.post?.copyWith(
          isBookmarked: event.isBookmarked,
          bookmarks: event.bookmarks,
        ),
      ),
    );
  }

  void _onUpvoteUpdated(_UpvoteUpdated event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: PostStatus.loading));
    emit(
      state.copyWith(
        status: PostStatus.success,
        post: state.post?.copyWith(
          isUpvoted: event.isUpvoted,
          upvotes: event.upvotes,
          isDownvoted: event.isDownvoted,
          downvotes: event.downvotes,
        ),
      ),
    );
  }

  void _onDownvoteUpdated(
    _DownvoteUpdated event,
    Emitter<PostState> emit,
  ) async {
    emit(state.copyWith(status: PostStatus.loading));
    emit(
      state.copyWith(
        status: PostStatus.success,
        post: state.post?.copyWith(
          isUpvoted: event.isUpvoted,
          upvotes: event.upvotes,
          isDownvoted: event.isDownvoted,
          downvotes: event.downvotes,
        ),
      ),
    );
  }

  void _onAuthorUpdated(_AuthorUpdated event, Emitter<PostState> emit) async {
    // post
    if (state.post?.author.id == event.user.id) {
      emit(state.copyWith(status: PostStatus.loading));
      emit(
        state.copyWith(
          status: PostStatus.success,
          post: state.post?.copyWith(author: event.user),
        ),
      );
    }
    // repost
    if (state.post?.repostOf?.author.id == event.user.id) {
      Post repostOf = state.post!.repostOf!.copyWith(author: event.user);
      emit(state.copyWith(status: PostStatus.loading));
      emit(
        state.copyWith(
          status: PostStatus.success,
          post: state.post?.copyWith(repostOf: repostOf),
        ),
      );
    }
  }

  void _onBallotUpdated(_BallotUpdated event, Emitter<PostState> emit) async {
    // post
    if (state.post?.ballot?.id == event.ballot.id) {
      emit(state.copyWith(status: PostStatus.loading));
      emit(
        state.copyWith(
          status: PostStatus.success,
          post: state.post?.copyWith(ballot: event.ballot),
        ),
      );
    }
    // repost
    if (state.post?.repostOf?.ballot?.id == event.ballot.id) {
      Post repostOf = state.post!.repostOf!.copyWith(ballot: event.ballot);
      emit(state.copyWith(status: PostStatus.loading));
      emit(
        state.copyWith(
          status: PostStatus.success,
          post: state.post?.copyWith(repostOf: repostOf),
        ),
      );
    }
  }

  void _onSurveyUpdated(_SurveyUpdated event, Emitter<PostState> emit) async {
    // post
    if (state.post?.survey?.id == event.survey.id) {
      emit(state.copyWith(status: PostStatus.loading));
      emit(
        state.copyWith(
          status: PostStatus.success,
          post: state.post?.copyWith(survey: event.survey),
        ),
      );
    }
    // repost
    if (state.post?.repostOf?.survey?.id == event.survey.id) {
      Post repostOf = state.post!.repostOf!.copyWith(survey: event.survey);
      emit(state.copyWith(status: PostStatus.loading));
      emit(
        state.copyWith(
          status: PostStatus.success,
          post: state.post?.copyWith(repostOf: repostOf),
        ),
      );
    }
  }

  void _onBroadcastUpdated(
    _BroadcastUpdated event,
    Emitter<PostState> emit,
  ) async {
    // post
    if (state.post?.broadcast?.id == event.broadcast.id) {
      emit(state.copyWith(status: PostStatus.loading));
      emit(
        state.copyWith(
          status: PostStatus.success,
          post: state.post?.copyWith(broadcast: event.broadcast),
        ),
      );
    }
    // repost
    if (state.post?.repostOf?.broadcast?.id == event.broadcast.id) {
      Post repostOf = state.post!.repostOf!.copyWith(
        broadcast: event.broadcast,
      );
      emit(state.copyWith(status: PostStatus.loading));
      emit(
        state.copyWith(
          status: PostStatus.success,
          post: state.post?.copyWith(repostOf: repostOf),
        ),
      );
    }
  }

  void _onPetitionUpdated(
    _PetitionUpdated event,
    Emitter<PostState> emit,
  ) async {
    // post
    if (state.post?.petition?.id == event.petition.id) {
      emit(state.copyWith(status: PostStatus.loading));
      emit(
        state.copyWith(
          status: PostStatus.success,
          post: state.post?.copyWith(petition: event.petition),
        ),
      );
    }
    // repost
    if (state.post?.repostOf?.petition?.id == event.petition.id) {
      Post repostOf = state.post!.repostOf!.copyWith(petition: event.petition);
      emit(state.copyWith(status: PostStatus.loading));
      emit(
        state.copyWith(
          status: PostStatus.success,
          post: state.post?.copyWith(repostOf: repostOf),
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  late StreamSubscription _subscription;
  final WebSocketService webSocketService;
}
