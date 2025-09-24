import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/notification/models/notification.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'websocket_event.dart';

part 'websocket_state.dart';

part 'websocket_bloc.freezed.dart';

// Streams
const String usersStream = 'users';
const String notificationsStream = 'notifications';
const String petitionsStream = 'petitions';
const String constitutionStream = 'constitution';

// Request ids
const String usersRequestId = 'users';
const String notificationRequestId = 'notifications';
const String petitionRequestId = 'petitions';
const String constitutionRequestId = 'constitution';

class WebsocketBloc extends Bloc<WebsocketEvent, WebsocketState> {
  WebsocketBloc({required this.authRepository, required this.webSocketService})
    : super(const WebsocketState()) {
    on<_Connect>((event, emit) async {
      _onConnect(emit);
    });
    on<_ChangeState>((event, emit) => emit(event.state));;
    on<_ChangeUserNotificationStatus>((event, emit) {
      _onChangeUserNotificationStatus(emit, event);
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
    on<_GetPetitions>((event, emit) {
      _onGetPetitions(emit, event);
    });
    on<_CreatePetition>((event, emit) {
      _onCreatePetition(emit, event);
    });
    on<_ResubscribePetitions>((event, emit) {
      _onResubscribePetitions(emit, event);
    });
    on<_SupportPetition>((event, emit) {
      _onSupportPetition(emit, event);
    });
    on<_GetUserPetitions>((event, emit) {
      _onGetUserPetitions(emit, event);
    });
    on<_ResubscribeUserPetitions>((event, emit) {
      _onResubscribeUserPetitions(emit, event);
    });
    on<_UnsubscribeUserPetitions>((event, emit) {
      _onUnsubscribeUserPetitions(emit, event);
    });
    on<_GetConstitution>((event, emit) {
      _onGetConstitution(emit);
    });
    on<_GetConstitutionTags>((event, emit) {
      _onGetConstitutionTags(emit, event);
    });
    on<_BookmarkSection>((event, emit) {
      _onBookmarkSection(emit, event);
    });
    on<_Disconnect>((event, emit) async {
      await webSocketService.disconnect();
      emit(WebsocketState());
    });
  }

  Future _onConnect(Emitter<WebsocketState> emit) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    try {
      String? token = await authRepository.getToken();
      String url = dotenv.env['WEBSOCKET_URL']!;
      await webSocketService.connect(url, token!);
      add(
        _ChangeState(
          state: state.copyWith(
            status: WebsocketStatus.connected,
            initialConnectionAchieved: true,
          ),
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: WebsocketStatus.failure));
    }
  }

  Future _onChangeUserNotificationStatus(
    Emitter<WebsocketState> emit,
    _ChangeUserNotificationStatus event,
  ) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
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

  Future _onGetNotifications(Emitter<WebsocketState> emit) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
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
    emit(state.copyWith(status: WebsocketStatus.loading));
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
    emit(state.copyWith(status: WebsocketStatus.loading));
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
    emit(state.copyWith(status: WebsocketStatus.loading));
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

  Future _onGetPetitions(
    Emitter<WebsocketState> emit,
    _GetPetitions event,
  ) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': petitionsStream,
      'payload': {
        "action": 'list',
        "request_id": petitionRequestId,
        'search_term': event.searchTerm,
        'last_petition': event.lastPetition?.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onCreatePetition(
    Emitter<WebsocketState> emit,
    _CreatePetition event,
  ) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': petitionsStream,
      'payload': {
        'action': 'create',
        'request_id': petitionRequestId,
        'data': {
          'title': event.title,
          'image_base64': base64Encode(File(event.imagePath).readAsBytesSync()),
          'description': event.description,
        },
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onResubscribePetitions(
    Emitter<WebsocketState> emit,
    _ResubscribePetitions event,
  ) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    List<int> petitionIds =
        event.petitions.map((petition) => petition.id).toList();
    Map<String, dynamic> message = {
      'stream': petitionsStream,
      'payload': {
        "action": 'resubscribe',
        'request_id': petitionRequestId,
        'pks': petitionIds,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onSupportPetition(
    Emitter<WebsocketState> emit,
    _SupportPetition event,
  ) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': petitionsStream,
      'payload': {
        "action": 'support',
        'request_id': petitionRequestId,
        'pk': event.petition.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetUserPetitions(
    Emitter<WebsocketState> emit,
    _GetUserPetitions event,
  ) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': petitionsStream,
      'payload': {
        'action': 'user_petitions',
        'request_id': event.user.id,
        'user': event.user.id,
        'last_petition': event.lastPetition?.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onResubscribeUserPetitions(
    Emitter<WebsocketState> emit,
    _ResubscribeUserPetitions event,
  ) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    List<int> petitionIds =
        event.petitions.map((petition) => petition.id).toList();
    Map<String, dynamic> message = {
      'stream': petitionsStream,
      'payload': {
        "action": 'resubscribe_user_petitions',
        'request_id': event.user.id,
        'pks': petitionIds,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onUnsubscribeUserPetitions(
    Emitter<WebsocketState> emit,
    _UnsubscribeUserPetitions event,
  ) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    List<int> petitionIds =
        event.petitions.map((petition) => petition.id).toList();
    Map<String, dynamic> message = {
      'stream': petitionsStream,
      'payload': {
        "action": 'resubscribe_user_petitions',
        'request_id': event.user.id,
        'pks': petitionIds,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetConstitution(Emitter<WebsocketState> emit) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': constitutionStream,
      'payload': {'action': 'list', 'request_id': constitutionRequestId},
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetConstitutionTags(
    Emitter<WebsocketState> emit,
    _GetConstitutionTags event,
  ) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': constitutionStream,
      'payload': {
        "action": 'tags',
        "request_id": constitutionRequestId,
        'search_term': event.searchTerm,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onBookmarkSection(
    Emitter<WebsocketState> emit,
    _BookmarkSection event,
  ) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': constitutionStream,
      'payload': {
        'action': 'bookmark',
        'request_id': constitutionRequestId,
        'pk': event.section.id,
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
  final WebSocketService webSocketService;
}
