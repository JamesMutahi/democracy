import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/notification/models/notification.dart';
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

// Streams
const String postsStream = 'posts';
const String pollsStream = 'polls';
const String chatsStream = 'chats';
const String surveysStream = 'surveys';
const String usersStream = 'users';
const String notificationsStream = 'notifications';

// Request ids
const String postRequestId = 'posts';
const String pollRequestId = 'polls';
const String chatRequestId = 'chats';
const String messageRequestId = 'messages';
const String surveyRequestId = 'surveys';
const String responseRequestId = 'responses';
const String usersRequestId = 'users';
const String notificationRequestId = 'notifications';

class WebsocketBloc extends Bloc<WebsocketEvent, WebsocketState> {
  WebsocketBloc({required this.authRepository})
    : super(const WebsocketInitial()) {
    on<_Connect>((event, emit) async {
      _onConnect(emit);
    });
    on<_ChangeState>((event, emit) => emit(event.state));
    on<_GetForYouPosts>((event, emit) {
      _onGetForYouPosts(emit);
    });
    on<_GetPosts>((event, emit) {
      _onGetPosts(emit, event);
    });
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
    on<_GetFollowingPosts>((event, emit) {
      _onGetFollowingPosts(emit, event);
    });
    on<_GetReplies>((event, emit) {
      _onGetReplies(emit, event);
    });
    on<_UnsubscribeReplies>((event, emit) {
      _onUnsubscribeReplies(emit, event);
    });
    on<_GetUserPosts>((event, emit) {
      _onGetUserPosts(emit, event);
    });
    on<_GetBookmarks>((event, emit) {
      _onGetBookmarks(emit, event);
    });
    on<_GetLikedPosts>((event, emit) {
      _onGetLikedPosts(emit, event);
    });
    on<_GetDraftPosts>((event, emit) {
      _onGetDraftPosts(emit);
    });
    on<_GetUserReplies>((event, emit) {
      _onGetUserReplies(emit, event);
    });
    on<_UnsubscribeUserPosts>((event, emit) {
      _onUnsubscribeUserPosts(emit, event);
    });
    on<_GetChats>((event, emit) {
      _onGetChats(emit, event);
    });
    on<_CreateChat>((event, emit) {
      _onCreateChat(emit, event);
    });
    on<_SubscribeChat>((event, emit) {
      _onSubscribeChat(emit, event);
    });
    on<_GetMessages>((event, emit) {
      _onGetMessages(emit, event);
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
    on<_MarkChatAsRead>((event, emit) {
      _onMarkChatAsRead(emit, event);
    });
    on<_GetUsers>((event, emit) {
      _onGetUsers(emit, event);
    });
    on<_GetFollowers>((event, emit) {
      _onGetFollowers(emit, event);
    });
    on<_GetFollowing>((event, emit) {
      _onGetFollowing(emit, event);
    });
    on<_GetMuted>((event, emit) {
      _onGetMuted(emit, event);
    });
    on<_GetBlocked>((event, emit) {
      _onGetBlocked(emit, event);
    });
    on<_GetUser>((event, emit) {
      _onGetUser(emit, event);
    });
    on<_UpdateUser>((event, emit) {
      _onUpdateUser(emit, event);
    });
    on<_MuteUser>((event, emit) {
      _onMuteUser(emit, event);
    });
    on<_BlockUser>((event, emit) {
      _onBlockUser(emit, event);
    });
    on<_FollowUser>((event, emit) {
      _onFollowUser(emit, event);
    });
    on<_ChangeUserNotificationStatus>((event, emit) {
      _onChangeUserNotificationStatus(emit, event);
    });
    on<_UnsubscribeUsers>((event, emit) {
      _onUnsubscribeUsers(emit, event);
    });
    on<_SendDirectMessage>((event, emit) {
      _onSendDirectMessage(emit, event);
    });
    on<_GetPolls>((event, emit) {
      _onGetPolls(emit, event);
    });
    on<_SubscribePoll>((event, emit) {
      _onSubscribePoll(emit, event);
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
    on<_GetNotifications>((event, emit) {
      _onGetNotifications(emit);
    });
    on<_MarkNotificationAsRead>((event, emit) {
      _onMarkNotificationAsRead(emit, event);
    });
    on<_GetPreferences>((event, emit) {
      _onGetPreferences(emit);
    });
    on<_UpdatePreferences>((event, emit) {
      _onUpdatePreferences(emit, event);
    });
    on<_Disconnect>((event, emit) async {
      await _channel.sink.close();
    });
  }

  Future _onConnect(Emitter<WebsocketState> emit) async {
    emit(WebsocketLoading());
    try {
      String? token = await authRepository.getToken();
      String url = dotenv.env['WEBSOCKET_URL']!;
      _channel = IOWebSocketChannel.connect(
        Uri.parse(url),
        headers: {'Authorization': 'Token $token', 'Origin': url},
      );
      await _channel.ready;
      add(_ChangeState(state: WebsocketConnected()));
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
    } catch (e) {
      add(_ChangeState(state: WebsocketFailure(error: e.toString())));
    }
  }

  Future _onGetForYouPosts(Emitter<WebsocketState> emit) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {"action": 'for_you', 'request_id': postRequestId},
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetPosts(Emitter<WebsocketState> emit, _GetPosts event) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        "action": 'list',
        "request_id": postRequestId,
        'search_term': event.searchTerm,
        'last_post': event.lastPost?.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onCreatePost(Emitter<WebsocketState> emit, _CreatePost event) async {
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
          'tagged_user_ids': event.taggedUserIds,
        },
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onUpdatePost(Emitter<WebsocketState> emit, _UpdatePost event) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'patch',
        'request_id': postRequestId,
        'data': {'pk': event.id, 'body': event.body},
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onLikePost(Emitter<WebsocketState> emit, _LikePost event) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'like',
        'request_id': postRequestId,
        'pk': event.post.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onBookmarkPost(
    Emitter<WebsocketState> emit,
    _BookmarkPost event,
  ) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'bookmark',
        'request_id': postRequestId,
        'pk': event.post.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onDeletePost(Emitter<WebsocketState> emit, _DeletePost event) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'delete',
        'request_id': postRequestId,
        'pk': event.post.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onReportPost(Emitter<WebsocketState> emit, _ReportPost event) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'report',
        'data': {'issue': event.issue, 'post': event.post.id},
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetFollowingPosts(
    Emitter<WebsocketState> emit,
    _GetFollowingPosts event,
  ) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'following',
        'request_id': postRequestId,
        'last_post': event.lastPost?.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetReplies(Emitter<WebsocketState> emit, _GetReplies event) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'replies',
        'request_id': event.post.id,
        'pk': event.post.id,
        'last_post': event.lastPost?.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onUnsubscribeReplies(
    Emitter<WebsocketState> emit,
    _UnsubscribeReplies event,
  ) async {
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

  Future _onGetUserPosts(
    Emitter<WebsocketState> emit,
    _GetUserPosts event,
  ) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'user_posts',
        'request_id': event.user.id,
        'user': event.user.id,
        'last_post': event.lastPost?.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetBookmarks(
    Emitter<WebsocketState> emit,
    _GetBookmarks event,
  ) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {'action': 'bookmarks', 'last_post': event.lastPost?.id},
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetLikedPosts(
    Emitter<WebsocketState> emit,
    _GetLikedPosts event,
  ) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'liked_posts',
        'request_id': event.user.id,
        'user': event.user.id,
        'last_post': event.lastPost?.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetDraftPosts(Emitter<WebsocketState> emit) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {'action': 'draft_posts', 'request_id': postRequestId},
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetUserReplies(
    Emitter<WebsocketState> emit,
    _GetUserReplies event,
  ) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'user_replies',
        'request_id': event.user.id,
        'user': event.user.id,
        'last_post': event.lastPost?.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onUnsubscribeUserPosts(
    Emitter<WebsocketState> emit,
    _UnsubscribeUserPosts event,
  ) async {
    emit(WebsocketLoading());
    List<int> postIds = event.posts.map((post) => post.id).toList();
    Map<String, dynamic> message = {
      'stream': postsStream,
      'payload': {
        'action': 'unsubscribe_user_posts',
        'request_id': event.user.id,
        'pks': postIds,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetChats(Emitter<WebsocketState> emit, _GetChats event) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': chatsStream,
      'payload': {
        'action': 'list',
        'request_id': chatRequestId,
        'search_term': event.searchTerm,
        'last_chat': event.lastChat?.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onCreateChat(Emitter<WebsocketState> emit, _CreateChat event) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': chatsStream,
      'payload': {
        'action': 'create',
        'request_id': event.user.id,
        'data': {'user': event.user.id},
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onSubscribeChat(
    Emitter<WebsocketState> emit,
    _SubscribeChat event,
  ) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': chatsStream,
      'payload': {
        'action': 'join_chat',
        'request_id': chatRequestId,
        'pk': event.chat.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetMessages(
    Emitter<WebsocketState> emit,
    _GetMessages event,
  ) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': chatsStream,
      'payload': {
        'action': 'messages',
        'request_id': messageRequestId,
        'chat': event.chat.id,
        'last_message': event.lastMessage?.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onCreateMessage(
    Emitter<WebsocketState> emit,
    _CreateMessage event,
  ) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': chatsStream,
      'payload': {
        'action': 'create_message',
        'request_id': messageRequestId,
        'data': {
          'chat': event.chat.id,
          'text': event.text,
          'post_id': event.post?.id,
          'poll_id': event.poll?.id,
          'survey_id': event.survey?.id,
        },
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onEditMessage(
    Emitter<WebsocketState> emit,
    _EditMessage event,
  ) async {
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

  Future _onMarkChatAsRead(
    Emitter<WebsocketState> emit,
    _MarkChatAsRead event,
  ) async {
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

  Future _onGetUsers(Emitter<WebsocketState> emit, _GetUsers event) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': usersStream,
      'payload': {
        'action': 'list',
        'request_id': usersRequestId,
        'search_term': event.searchTerm,
        'page': event.page,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetFollowers(
    Emitter<WebsocketState> emit,
    _GetFollowers event,
  ) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': usersStream,
      'payload': {
        'action': 'followers',
        'request_id': usersRequestId,
        'pk': event.user.id,
        'page': event.page,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetFollowing(
    Emitter<WebsocketState> emit,
    _GetFollowing event,
  ) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': usersStream,
      'payload': {
        'action': 'following',
        'request_id': usersRequestId,
        'pk': event.user.id,
        'page': event.page,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetMuted(Emitter<WebsocketState> emit, _GetMuted event) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': usersStream,
      'payload': {
        'action': 'muted',
        'request_id': usersRequestId,
        'page': event.page,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetBlocked(Emitter<WebsocketState> emit, _GetBlocked event) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': usersStream,
      'payload': {
        'action': 'blocked',
        'request_id': usersRequestId,
        'page': event.page,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetUser(Emitter<WebsocketState> emit, _GetUser event) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': usersStream,
      'payload': {
        'action': 'retrieve',
        'request_id': usersRequestId,
        'pk': event.user.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onUpdateUser(Emitter<WebsocketState> emit, _UpdateUser event) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': usersStream,
      'payload': {
        'action': 'patch',
        'request_id': usersRequestId,
        'pk': event.user.id,
        'data': {
          'name': event.name,
          'status': event.status,
          if (event.imagePath != null)
            'image_base64': base64Encode(
              File(event.imagePath!).readAsBytesSync(),
            ),
          if (event.coverPhotoPath != null)
            'cover_photo_base64': base64Encode(
              File(event.coverPhotoPath!).readAsBytesSync(),
            ),
        },
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onMuteUser(Emitter<WebsocketState> emit, _MuteUser event) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': usersStream,
      'payload': {
        'action': 'mute',
        'request_id': usersRequestId,
        'pk': event.user.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onBlockUser(Emitter<WebsocketState> emit, _BlockUser event) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': usersStream,
      'payload': {
        'action': 'block',
        'request_id': usersRequestId,
        'pk': event.user.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onFollowUser(Emitter<WebsocketState> emit, _FollowUser event) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': usersStream,
      'payload': {
        'action': 'follow',
        'request_id': usersRequestId,
        'pk': event.user.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onChangeUserNotificationStatus(
    Emitter<WebsocketState> emit,
    _ChangeUserNotificationStatus event,
  ) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': usersStream,
      'payload': {
        'action': 'notify',
        'request_id': usersRequestId,
        'pk': event.user.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onUnsubscribeUsers(
    Emitter<WebsocketState> emit,
    _UnsubscribeUsers event,
  ) async {
    emit(WebsocketLoading());
    List<int> userIds = event.users.map((user) => user.id).toList();
    Map<String, dynamic> message = {
      'stream': usersStream,
      'payload': {
        'action': 'unsubscribe',
        'request_id': usersRequestId,
        'pks': userIds,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onSendDirectMessage(
    Emitter<WebsocketState> emit,
    _SendDirectMessage event,
  ) async {
    emit(WebsocketLoading());
    List<int> userPks = event.users.map((user) => user.id).toList();
    Map<String, dynamic> message = {
      'stream': chatsStream,
      'payload': {
        'action': 'direct_message',
        'request_id': messageRequestId,
        'user_pks': userPks,
        'data': {
          'text': event.text,
          'post_id': event.post?.id,
          'poll_id': event.poll?.id,
          'survey_id': event.survey?.id,
        },
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetPolls(Emitter<WebsocketState> emit, _GetPolls event) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': pollsStream,
      'payload': {
        'action': 'list',
        'request_id': pollRequestId,
        'search_term': event.searchTerm,
        'last_poll': event.lastPoll?.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onSubscribePoll(
    Emitter<WebsocketState> emit,
    _SubscribePoll event,
  ) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': pollsStream,
      'payload': {
        'action': 'subscribe',
        'request_id': pollRequestId,
        'pk': event.poll.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onVote(Emitter<WebsocketState> emit, _Vote event) async {
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
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': surveysStream,
      'payload': {
        'action': 'list',
        'request_id': surveyRequestId,
        'search_term': event.searchTerm,
        'last_survey': event.lastSurvey?.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onSubmitResponse(
    Emitter<WebsocketState> emit,
    _SubmitResponse event,
  ) async {
    emit(WebsocketLoading());
    List<Map<String, dynamic>> textAnswers = [];
    List<Map<String, dynamic>> choiceAnswers = [];
    for (TextAnswer textAnswer in event.textAnswers) {
      textAnswers.add({
        'question_id': textAnswer.question.id,
        'text': textAnswer.text,
      });
    }
    for (ChoiceAnswer choiceAnswer in event.choiceAnswers) {
      choiceAnswers.add({
        'question_id': choiceAnswer.question.id,
        'choice_id': choiceAnswer.choice.id,
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
          'text_answers': textAnswers,
          'choice_answers': choiceAnswers,
        },
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetNotifications(Emitter<WebsocketState> emit) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': notificationsStream,
      'payload': {'action': 'list', 'request_id': notificationRequestId},
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onMarkNotificationAsRead(
    Emitter<WebsocketState> emit,
    _MarkNotificationAsRead event,
  ) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': notificationsStream,
      'payload': {
        'action': 'mark_as_read',
        'request_id': notificationRequestId,
        'pk': event.notification.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetPreferences(Emitter<WebsocketState> emit) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': notificationsStream,
      'payload': {'action': 'preferences', 'request_id': notificationRequestId},
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onUpdatePreferences(
    Emitter<WebsocketState> emit,
    _UpdatePreferences event,
  ) async {
    emit(WebsocketLoading());
    Map<String, dynamic> message = {
      'stream': notificationsStream,
      'payload': {
        'action': 'update_preferences',
        'request_id': notificationRequestId,
        'data': {
          'allow_notifications': event.allowNotifications,
          'allow_follow_notifications': event.allowFollowNotifications,
          'allow_tag_notifications': event.allowTagNotifications,
          'allow_like_notifications': event.allowLikeNotifications,
          'allow_reply_notifications': event.allowReplyNotifications,
          'allow_repost_notifications': event.allowRepostNotifications,
          'allow_message_notifications': event.allowMessageNotifications,
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
