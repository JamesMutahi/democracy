import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/broadcast/models/comment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_detail_event.dart';
part 'comment_detail_state.dart';
part 'comment_detail_bloc.freezed.dart';

const String stream = 'broadcasts';
const String requestId = 'comments';

class CommentDetailBloc extends Bloc<CommentDetailEvent, CommentDetailState> {
  CommentDetailBloc({required this.webSocketService})
    : super(const CommentDetailState.initial()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == 'broadcasts') {
        switch (message['payload']['action']) {
          case 'comment_create':
            add(_Created(payload: message['payload']));
          case 'comment_update':
            add(_Updated(payload: message['payload']));
          case 'comment_delete':
            add(_Deleted(payload: message['payload']));
        }
      }
    });
    on<_Created>(_onCreated);
    on<_Updated>(_onUpdated);
    on<_Deleted>(_onDeleted);
    on<_Create>(_onCreate);
    on<_Delete>(_onDelete);
  }

  void _onCreated(_Created event, Emitter<CommentDetailState> emit) {
    emit(CommentDetailLoading());
    if (event.payload['response_status'] == 200) {
      Comment comment = Comment.fromJson(event.payload['data']);
      emit(CommentCreated(comment: comment));
    } else {
      emit(CommentDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onUpdated(_Updated event, Emitter<CommentDetailState> emit) {
    emit(CommentDetailLoading());
    if (event.payload['response_status'] == 200) {
      final comment = Comment.fromJson(event.payload['data']);
      emit(CommentUpdated(comment: comment));
    } else {
      emit(CommentDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onDeleted(_Deleted event, Emitter<CommentDetailState> emit) {
    emit(CommentDetailLoading());
    if (event.payload['response_status'] == 200) {
      emit(CommentDeleted(commentId: event.payload['pk']));
    } else {
      emit(CommentDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onCreate(_Create event, Emitter<CommentDetailState> emit) {
    emit(CommentDetailLoading());
    if (!webSocketService.isConnected) {
      emit(CommentDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'create_comment',
        'request_id': requestId,
        'data': {'broadcast': event.broadcastId, 'text': event.text},
      },
    };
    webSocketService.send(message);
  }

  void _onDelete(_Delete event, Emitter<CommentDetailState> emit) {
    emit(CommentDetailLoading());
    if (!webSocketService.isConnected) {
      emit(CommentDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'delete_comment',
        'request_id': requestId,
        'pk': event.comment.id,
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
}
