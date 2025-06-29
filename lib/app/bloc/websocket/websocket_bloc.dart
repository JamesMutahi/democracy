import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/models/user.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/post/models/post.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'websocket_event.dart';
part 'websocket_state.dart';
part 'websocket_bloc.freezed.dart';

var postsStream = 'posts';
var chatsStream = 'chats';
int messageRequestId = 2;

class WebsocketBloc extends Bloc<WebsocketEvent, WebsocketState> {
  WebsocketBloc({required this.authRepository})
    : super(const WebsocketState()) {
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
    on<_BookmarkPost>((event, emit) async {
      await _onBookmarkPost(emit, event);
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
  }

  Future _onConnect(Emitter<WebsocketState> emit) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    try {
      String? token = await authRepository.getToken();
      final wsUrl = Uri.parse('${dotenv.env['WEBSOCKET_URL']}');
      _channel = IOWebSocketChannel.connect(
        wsUrl,
        headers: {'Authorization': 'Token $token'},
        connectTimeout: Duration(seconds: 5),
      );
      await _channel.ready;
      _websocketSubscription = _channel.stream.listen((message) async {
        add(
          _ChangeState(
            state: state.copyWith(
              status: WebsocketStatus.success,
              message: jsonDecode(message),
            ),
          ),
        );
      });
      Map<String, dynamic> message = {
        'stream': postsStream,
        'payload': {"action": 'list', "request_id": 1},
      };
      _channel.sink.add(jsonEncode(message));
      message = {
        'stream': chatsStream,
        'payload': {"action": 'join_chats', "request_id": 1},
      };
      _channel.sink.add(jsonEncode(message));
    } catch (e) {
      add(_ChangeState(state: state.copyWith(status: WebsocketStatus.failure)));
    }
  }

  Future _onCreatePost(Emitter<WebsocketState> emit, _CreatePost event) async {
    if (state.status == WebsocketStatus.failure) {
      await _onConnect(emit);
    }
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'create',
        'request_id': 2,
        'data': {'body': event.body},
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onUpdatePost(Emitter<WebsocketState> emit, _UpdatePost event) async {
    if (state.status == WebsocketStatus.failure) {
      await _onConnect(emit);
    }
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'update',
        'request_id': 3,
        'data': {'pk': event.id, 'body': event.body},
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onLikePost(Emitter<WebsocketState> emit, _LikePost event) async {
    if (state.status == WebsocketStatus.failure) {
      await _onConnect(emit);
    }
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'like',
        'request_id': 4,
        'data': {'pk': event.post.id},
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onBookmarkPost(
    Emitter<WebsocketState> emit,
    _BookmarkPost event,
  ) async {
    if (state.status == WebsocketStatus.failure) {
      await _onConnect(emit);
    }
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'bookmark',
        'request_id': 5,
        'data': {'pk': event.post.id},
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onDeletePost(Emitter<WebsocketState> emit, _DeletePost event) async {
    if (state.status == WebsocketStatus.failure) {
      await _onConnect(emit);
    }
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'delete',
        'request_id': 6,
        'data': {'pk': event.post.id},
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onReportPost(Emitter<WebsocketState> emit, _ReportPost event) async {
    if (state.status == WebsocketStatus.failure) {
      await _onConnect(emit);
    }
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'report',
        'request_id': 7,
        'data': {'pk': event.post.id},
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetReplies(Emitter<WebsocketState> emit, _GetReplies event) async {
    if (state.status == WebsocketStatus.failure) {
      await _onConnect(emit);
    }
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {'action': 'replies', 'request_id': 8, 'pk': event.post.id},
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onLoadUserPosts(
    Emitter<WebsocketState> emit,
    _LoadUserPosts event,
  ) async {
    if (state.status == WebsocketStatus.failure) {
      await _onConnect(emit);
    }
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {'action': 'user_posts', 'request_id': 9, 'pk': event.user.id},
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onLoadBookmarks(
    Emitter<WebsocketState> emit,
    _LoadBookmarks event,
  ) async {
    if (state.status == WebsocketStatus.failure) {
      await _onConnect(emit);
    }
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {'action': 'bookmarks', 'request_id': 10, 'pk': event.user.id},
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onLoadLikedPosts(
    Emitter<WebsocketState> emit,
    _LoadLikedPosts event,
  ) async {
    if (state.status == WebsocketStatus.failure) {
      await _onConnect(emit);
    }
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'liked_posts',
        'request_id': 11,
        'pk': event.user.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onLoadUserReplies(
    Emitter<WebsocketState> emit,
    _LoadUserReplies event,
  ) async {
    if (state.status == WebsocketStatus.failure) {
      await _onConnect(emit);
    }
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'user_replies',
        'request_id': 12,
        'pk': event.user.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onLoadChats(Emitter<WebsocketState> emit, _LoadChats event) async {
    if (state.status == WebsocketStatus.failure) {
      await _onConnect(emit);
    }
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': chatsStream,
      'payload': {'action': 'list', 'request_id': 13},
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onCreateChat(Emitter<WebsocketState> emit, _CreateChat event) async {
    if (state.status == WebsocketStatus.failure) {
      await _onConnect(emit);
    }
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': chatsStream,
      'payload': {
        'action': 'create',
        'request_id': 14,
        'data': {'users': event.users},
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onCreateMessage(
    Emitter<WebsocketState> emit,
    _CreateMessage event,
  ) async {
    if (state.status == WebsocketStatus.failure) {
      await _onConnect(emit);
    }
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': chatsStream,
      'payload': {
        'action': 'create_message',
        'request_id': messageRequestId,
        'chat': event.chat.id,
        'text': event.text,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onEditMessage(
    Emitter<WebsocketState> emit,
    _EditMessage event,
  ) async {
    if (state.status == WebsocketStatus.failure) {
      await _onConnect(emit);
    }
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': chatsStream,
      'payload': {
        'action': 'edit_message',
        'request_id': 15,
        'pk': event.messageId,
        'text': event.text,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onDeleteMessage(
    Emitter<WebsocketState> emit,
    _DeleteMessage event,
  ) async {
    if (state.status == WebsocketStatus.failure) {
      await _onConnect(emit);
    }
    emit(state.copyWith(status: WebsocketStatus.loading));
    for (Message msg in event.messages) {
      Map<String, dynamic> message = {
        'stream': chatsStream,
        'payload': {'action': 'delete_message', 'request_id': 16, 'pk': msg.id},
      };
      _channel.sink.add(jsonEncode(message));
    }
  }

  Future _onMarkAsRead(Emitter<WebsocketState> emit, _MarkAsRead event) async {
    if (state.status == WebsocketStatus.failure) {
      await _onConnect(emit);
    }
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': chatsStream,
      'payload': {
        'action': 'mark_as_read',
        'request_id': 17,
        'pk': event.chat.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  @override
  Future<void> close() {
    _channel.sink.close();
    _websocketSubscription.cancel();
    return super.close();
  }

  late WebSocketChannel _channel;
  late StreamSubscription _websocketSubscription;
  final AuthRepository authRepository;
}
