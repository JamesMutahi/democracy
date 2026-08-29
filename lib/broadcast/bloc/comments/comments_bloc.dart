import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/utils/transformers.dart';
import 'package:democracy/broadcast/models/comment.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comments_event.dart';
part 'comments_state.dart';
part 'comments_bloc.freezed.dart';

const String stream = 'broadcasts';
const String action = 'comments';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsBloc({required this.webSocketService})
    : super(const CommentsState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        if (message['payload']['action'] == action) {
          add(_Received(payload: message['payload']));
        }
      }
    });
    on<_Get>((event, emit) => _onGet(event, emit), transformer: debounce());
    on<_Received>((event, emit) => _onReceived(event, emit));
    on<_Add>((event, emit) => _onAdd(event, emit));
    on<_Update>((event, emit) => _onUpdate(event, emit));
    on<_Remove>((event, emit) => _onRemove(event, emit));
  }

  void _onGet(_Get event, Emitter<CommentsState> emit) {
    emit(
      state.copyWith(
        status: CommentsStatus.loading,
        broadcastId: event.broadcastId,
      ),
    );
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: CommentsStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': action,
        'pk': event.broadcastId,
        'oldest_comment_id': event.oldestComment?.id,
        'newest_comment_id': event.newestComment?.id,
      },
    };
    webSocketService.send(message);
  }

  void _onReceived(_Received event, Emitter<CommentsState> emit) {
    emit(state.copyWith(status: CommentsStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<Comment> comments = List.from(
        event.payload['data']['results'].map((e) => Comment.fromJson(e)),
      );
      List<Comment> newCommentList = comments;
      final oldestCommentId = event.payload['data']['oldest_comment_id'];
      if (oldestCommentId != null) {
        newCommentList = [...state.comments, ...comments];
      }
      final newestCommentId = event.payload['data']['newest_comment_id'];
      if (newestCommentId != null) {
        newCommentList = [...comments, ...state.comments];
      }
      emit(
        state.copyWith(
          status: CommentsStatus.success,
          comments: newCommentList,
          hasNext: event.payload['data']['has_next'],
          broadcastId: event.payload['data']['broadcast_id'],
        ),
      );
    } else {
      emit(state.copyWith(status: CommentsStatus.failure));
    }
  }

  void _onAdd(_Add event, Emitter<CommentsState> emit) {
    final exists = state.comments.any(
      (element) => element.id == event.comment.id,
    );

    if (!exists) {
      emit(
        state.copyWith(
          comments: [event.comment, ...state.comments],
          status: CommentsStatus.success,
        ),
      );
    }
  }

  void _onUpdate(_Update event, Emitter<CommentsState> emit) {
    final index = state.comments.indexWhere(
      (element) => element.id == event.comment.id,
    );
    if (index == -1) return;
    emit(state.copyWith(status: CommentsStatus.loading));

    final updatedComments = List<Comment>.from(state.comments);
    updatedComments[index] = event.comment;

    emit(
      state.copyWith(comments: updatedComments, status: CommentsStatus.success),
    );
  }

  void _onRemove(_Remove event, Emitter<CommentsState> emit) {
    final updatedComments = state.comments
        .where((element) => element.id != event.commentId)
        .toList();

    emit(
      state.copyWith(comments: updatedComments, status: CommentsStatus.success),
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
