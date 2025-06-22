import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/models/user.dart';
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
    on<_LoadProfile>((event, emit) {
      _onLoadProfile(emit, event);
    });
    on<_LoadBookmarks>((event, emit) {
      _onLoadBookmarks(emit, event);
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

  Future _onLoadProfile(
    Emitter<WebsocketState> emit,
    _LoadProfile event,
  ) async {
    if (state.status == WebsocketStatus.failure) {
      await _onConnect(emit);
    }
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {'action': 'profile', 'request_id': 9, 'pk': event.user.id},
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
