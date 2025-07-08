import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/models/user.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/poll/models/option.dart';
import 'package:democracy/poll/models/poll.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/choice_answer.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/models/text_answer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'websocket_event.dart';
part 'websocket_state.dart';
part 'websocket_bloc.freezed.dart';

const String postsStream = 'posts';
const String pollsStream = 'polls';
const String chatsStream = 'chats';
const String surveysStream = 'surveys';
const int postRequestId = 1;
const int postUpdateRequestId = 2;
const int pollRequestId = 1;
const int chatRequestId = 1;
const int messageRequestId = 2;
const int surveyRequestId = 1;
const int responseRequestId = 2;

class WebsocketBloc extends Bloc<WebsocketEvent, WebsocketState> {
  WebsocketBloc({required this.authRepository})
    : super(const WebsocketInitial()) {
    on<_Connect>((event, emit) async {
      _onConnect(emit);
    });
    on<_ChangeState>((event, emit) => emit(event.state));
    on<_CreatePost>((event, emit) {
      _onCreatePost(emit, event);
    });
    on<_UpdatePost>((event, emit) {
      _onUpdatePost(emit, event);
    });
    on<_LikePost>((event, emit) {
      _onLikePost(emit, event);
    });
    on<_BookmarkPost>((event, emit) {
      _onBookmarkPost(emit, event);
    });
    on<_DeletePost>((event, emit) {
      _onDeletePost(emit, event);
    });
    on<_ReportPost>((event, emit) {
      _onReportPost(emit, event);
    });
    on<_GetReplies>((event, emit) {
      _onGetReplies(emit, event);
    });
    on<_UnsubscribeReplies>((event, emit) {
      _onUnsubscribeReplies(emit, event);
    });
    on<_LoadUserPosts>((event, emit) {
      _onLoadUserPosts(emit, event);
    });
    on<_LoadBookmarks>((event, emit) {
      _onLoadBookmarks(emit, event);
    });
    on<_LoadLikedPosts>((event, emit) {
      _onLoadLikedPosts(emit, event);
    });
    on<_LoadUserReplies>((event, emit) {
      _onLoadUserReplies(emit, event);
    });
    on<_LoadChats>((event, emit) {
      _onLoadChats(emit, event);
    });
    on<_CreateChat>((event, emit) {
      _onCreateChat(emit, event);
    });
    on<_CreateMessage>((event, emit) {
      _onCreateMessage(emit, event);
    });
    on<_EditMessage>((event, emit) {
      _onEditMessage(emit, event);
    });
    on<_DeleteMessage>((event, emit) {
      _onDeleteMessage(emit, event);
    });
    on<_MarkAsRead>((event, emit) {
      _onMarkAsRead(emit, event);
    });
    on<_UserBlocked>((event, emit) {
      _onUserBlocked(emit, event);
    });
    on<_GetPolls>((event, emit) {
      _onGetPolls(emit, event);
    });
    on<_Vote>((event, emit) {
      _onVote(emit, event);
    });
    on<_SubmitReason>((event, emit) {
      _onSubmitReason(emit, event);
    });
    on<_GetSurveys>((event, emit) {
      _onGetSurveys(emit, event);
    });
    on<_SubmitResponse>((event, emit) {
      _onSubmitResponse(emit, event);
    });
    on<_Disconnect>((event, emit) {
      _channel.sink.close();
    });
  }

  Future _onConnect(Emitter<WebsocketState> emit) async {
    emit(WebsocketLoading());
    try {
      String? token = await authRepository.getToken();
      final wsUrl = Uri.parse('${dotenv.env['WEBSOCKET_URL']}');
      _channel = IOWebSocketChannel.connect(
        wsUrl,
        headers: {'Authorization': 'Token $token'},
      );
      await _channel.ready;
      _channel.stream.listen(
        (message) {
          add(
            _ChangeState(state: WebsocketSuccess(message: jsonDecode(message))),
          );
        },
        onDone: () {
          add(
            _ChangeState(
              state: WebsocketFailure(error: 'Server connection lost'),
            ),
          );
          Future.delayed(Duration(seconds: 10)).then((value) {
            add(_Connect());
          });
        },
        onError: (error) {
          add(
            _ChangeState(
              state: WebsocketFailure(error: 'Server connection lost'),
            ),
          );
          debugPrint('ws error $error');
          Future.delayed(Duration(seconds: 10)).then((value) {
            add(_Connect());
          });
        },
      );
      // Get posts
      Map<String, dynamic> message = {
        'stream': postsStream,
        'payload': {"action": 'list', "request_id": postRequestId},
      };
      _channel.sink.add(jsonEncode(message));
    } catch (e) {
      add(_ChangeState(state: WebsocketFailure(error: e.toString())));
    }
  }

  Future _onCreatePost(Emitter<WebsocketState> emit, _CreatePost event) async {
    if (state is WebsocketFailure) {
      await _onConnect(emit);
    }
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'create',
        'request_id': postRequestId,
        'data': {
          'body': event.body,
          'reply_to_id': event.replyTo?.id,
          'repost_of_id': event.repostOf?.id,
          'poll_id': event.poll?.id,
          'survey_id': event.survey?.id,
          'status':
              event.status == PostStatus.published ? 'published' : 'draft',
        },
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onUpdatePost(Emitter<WebsocketState> emit, _UpdatePost event) async {
    if (state is WebsocketFailure) {
      await _onConnect(emit);
    }
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'update',
        'request_id': postUpdateRequestId,
        'data': {'pk': event.id, 'body': event.body},
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onLikePost(Emitter<WebsocketState> emit, _LikePost event) async {
    if (state is WebsocketFailure) {
      await _onConnect(emit);
    }
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'like',
        'request_id': postRequestId,
        'data': {'pk': event.post.id},
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onBookmarkPost(
    Emitter<WebsocketState> emit,
    _BookmarkPost event,
  ) async {
    if (state is WebsocketFailure) {
      await _onConnect(emit);
    }
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'bookmark',
        'request_id': postRequestId,
        'data': {'pk': event.post.id},
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onDeletePost(Emitter<WebsocketState> emit, _DeletePost event) async {
    if (state is WebsocketFailure) {
      await _onConnect(emit);
    }
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'delete',
        'request_id': postRequestId,
        'data': {'pk': event.post.id},
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onReportPost(Emitter<WebsocketState> emit, _ReportPost event) async {
    if (state is WebsocketFailure) {
      await _onConnect(emit);
    }
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'report',
        'data': {'pk': event.post.id},
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetReplies(Emitter<WebsocketState> emit, _GetReplies event) async {
    if (state is WebsocketFailure) {
      await _onConnect(emit);
    }
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'replies',
        'request_id': event.post.id,
        'pk': event.post.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onUnsubscribeReplies(
    Emitter<WebsocketState> emit,
    _UnsubscribeReplies event,
  ) async {
    if (state is WebsocketFailure) {
      await _onConnect(emit);
    }
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'unsubscribe_replies',
        'request_id': event.post.id,
        'pk': event.post.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onLoadUserPosts(
    Emitter<WebsocketState> emit,
    _LoadUserPosts event,
  ) async {
    if (state is WebsocketFailure) {
      await _onConnect(emit);
    }
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {'action': 'user_posts', 'user': event.user.id},
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onLoadBookmarks(
    Emitter<WebsocketState> emit,
    _LoadBookmarks event,
  ) async {
    if (state is WebsocketFailure) {
      await _onConnect(emit);
    }
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {'action': 'bookmarks'},
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onLoadLikedPosts(
    Emitter<WebsocketState> emit,
    _LoadLikedPosts event,
  ) async {
    if (state is WebsocketFailure) {
      await _onConnect(emit);
    }
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {'action': 'liked_posts', 'user': event.user.id},
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onLoadUserReplies(
    Emitter<WebsocketState> emit,
    _LoadUserReplies event,
  ) async {
    if (state is WebsocketFailure) {
      await _onConnect(emit);
    }
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {'action': 'user_replies', 'user': event.user.id},
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onLoadChats(Emitter<WebsocketState> emit, _LoadChats event) async {
    if (state is WebsocketFailure) {
      await _onConnect(emit);
    }
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': chatsStream,
      'payload': {'action': 'list', 'request_id': chatRequestId},
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onCreateChat(Emitter<WebsocketState> emit, _CreateChat event) async {
    if (state is WebsocketFailure) {
      await _onConnect(emit);
    }
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': chatsStream,
      'payload': {
        'action': 'create',
        'request_id': chatRequestId,
        'data': {'user': event.user.id},
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onCreateMessage(
    Emitter<WebsocketState> emit,
    _CreateMessage event,
  ) async {
    if (state is WebsocketFailure) {
      await _onConnect(emit);
    }
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': chatsStream,
      'payload': {
        'action': 'create_message',
        'request_id': messageRequestId,
        'data': {'chat': event.chat.id, 'text': event.text},
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onEditMessage(
    Emitter<WebsocketState> emit,
    _EditMessage event,
  ) async {
    if (state is WebsocketFailure) {
      await _onConnect(emit);
    }
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': chatsStream,
      'payload': {
        'action': 'edit_message',
        'request_id': messageRequestId,
        'pk': event.messageId,
        'data': {'text': event.text},
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onDeleteMessage(
    Emitter<WebsocketState> emit,
    _DeleteMessage event,
  ) async {
    if (state is WebsocketFailure) {
      await _onConnect(emit);
    }
    emit(WebsocketLoading());
    for (Message msg in event.messages) {
      Map<String, dynamic> message = {
        'stream': chatsStream,
        'payload': {
          'action': 'delete_message',
          'request_id': messageRequestId,
          'pk': msg.id,
        },
      };
      _channel.sink.add(jsonEncode(message));
    }
  }

  Future _onMarkAsRead(Emitter<WebsocketState> emit, _MarkAsRead event) async {
    if (state is WebsocketFailure) {
      await _onConnect(emit);
    }
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': chatsStream,
      'payload': {
        'action': 'mark_as_read',
        'request_id': messageRequestId,
        'pk': event.chat.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onUserBlocked(
    Emitter<WebsocketState> emit,
    _UserBlocked event,
  ) async {
    if (state is WebsocketFailure) {
      await _onConnect(emit);
    }
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': chatsStream,
      'payload': {
        'action': 'block_user',
        'request_id': chatRequestId,
        'user': event.user.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetPolls(Emitter<WebsocketState> emit, _GetPolls event) async {
    if (state is WebsocketFailure) {
      await _onConnect(emit);
    }
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': pollsStream,
      'payload': {'action': 'list', 'request_id': pollRequestId},
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onVote(Emitter<WebsocketState> emit, _Vote event) async {
    if (state is WebsocketFailure) {
      await _onConnect(emit);
    }
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': pollsStream,
      'payload': {
        'action': 'vote',
        'request_id': pollRequestId,
        'option': event.option.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onSubmitReason(
    Emitter<WebsocketState> emit,
    _SubmitReason event,
  ) async {
    if (state is WebsocketFailure) {
      await _onConnect(emit);
    }
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': pollsStream,
      'payload': {
        'action': 'add_reason',
        'request_id': pollRequestId,
        'pk': event.poll.id,
        'text': event.text,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetSurveys(Emitter<WebsocketState> emit, _GetSurveys event) async {
    if (state is WebsocketFailure) {
      await _onConnect(emit);
    }
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': surveysStream,
      'payload': {'action': 'list', 'request_id': surveyRequestId},
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onSubmitResponse(
    Emitter<WebsocketState> emit,
    _SubmitResponse event,
  ) async {
    if (state is WebsocketFailure) {
      await _onConnect(emit);
    }
    emit(WebsocketLoading());
    List<Map<String, dynamic>> textAnswersAsJson = [];
    List<Map<String, dynamic>> choiceAnswersAsJson = [];
    for (TextAnswer textAnswer in event.textAnswers) {
      textAnswersAsJson.add({
        'question': textAnswer.question.id,
        'text': textAnswer.text,
      });
    }
    for (ChoiceAnswer choiceAnswer in event.choiceAnswers) {
      choiceAnswersAsJson.add({
        'question': choiceAnswer.question.id,
        'choice': choiceAnswer.choice.id,
      });
    }
    Map<String, dynamic> message = {
      'stream': surveysStream,
      'payload': {
        'action': 'create_response',
        'request_id': responseRequestId,
        'data': {
          'survey': event.survey.id,
          'start_time': event.startTime.toString(),
          'end_time': event.endTime.toString(),
          'text_answers': textAnswersAsJson,
          'choice_answers': choiceAnswersAsJson,
        },
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  @override
  Future<void> close() {
    _channel.sink.close();
    return super.close();
  }

  late WebSocketChannel _channel;
  final AuthRepository authRepository;
}
