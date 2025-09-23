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
import 'package:democracy/survey/models/choice_answer.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/models/text_answer.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'websocket_event.dart';

part 'websocket_state.dart';

part 'websocket_bloc.freezed.dart';

// Streams
const String chatsStream = 'chats';
const String surveysStream = 'surveys';
const String usersStream = 'users';
const String notificationsStream = 'notifications';
const String petitionsStream = 'petitions';
const String constitutionStream = 'constitution';

// Request ids
const String chatRequestId = 'chats';
const String messageRequestId = 'messages';
const String surveyRequestId = 'surveys';
const String responseRequestId = 'responses';
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
    on<_ChangeState>((event, emit) => emit(event.state));
    on<_GetUsers>((event, emit) {
      _onGetUsers(emit, event);
    });
    on<_ResubscribeUsers>((event, emit) {
      _onResubscribeUsers(emit, event);
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
    on<_GetPetitionSupporters>((event, emit) {
      _onGetPetitionSupporters(emit, event);
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

  Future _onGetUsers(Emitter<WebsocketState> emit, _GetUsers event) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': usersStream,
      'payload': {
        'action': 'list',
        'request_id': usersRequestId,
        'search_term': event.searchTerm,
        'last_user': event.lastUser?.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onResubscribeUsers(
    Emitter<WebsocketState> emit,
    _ResubscribeUsers event,
  ) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    List<int> userIds = event.users.map((user) => user.id).toList();
    Map<String, dynamic> message = {
      'stream': usersStream,
      'payload': {
        "action": 'resubscribe',
        'request_id': usersRequestId,
        'pks': userIds,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetFollowers(
    Emitter<WebsocketState> emit,
    _GetFollowers event,
  ) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': usersStream,
      'payload': {
        'action': 'followers',
        'request_id': usersRequestId,
        'pk': event.user.id,
        'last_user': event.lastUser?.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetFollowing(
    Emitter<WebsocketState> emit,
    _GetFollowing event,
  ) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': usersStream,
      'payload': {
        'action': 'following',
        'request_id': usersRequestId,
        'pk': event.user.id,
        'last_user': event.lastUser?.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetMuted(Emitter<WebsocketState> emit, _GetMuted event) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': usersStream,
      'payload': {
        'action': 'muted',
        'request_id': usersRequestId,
        'last_user': event.lastUser?.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetBlocked(Emitter<WebsocketState> emit, _GetBlocked event) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': usersStream,
      'payload': {
        'action': 'blocked',
        'request_id': usersRequestId,
        'last_user': event.lastUser?.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onGetUser(Emitter<WebsocketState> emit, _GetUser event) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
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
    emit(state.copyWith(status: WebsocketStatus.loading));
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
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': usersStream,
      'payload': {
        'action': 'mute',
        'request_id': usersRequestId,
        'pk': event.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onBlockUser(Emitter<WebsocketState> emit, _BlockUser event) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': usersStream,
      'payload': {
        'action': 'block',
        'request_id': usersRequestId,
        'pk': event.id,
      },
    };
    _channel.sink.add(jsonEncode(message));
  }

  Future _onFollowUser(Emitter<WebsocketState> emit, _FollowUser event) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
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

  Future _onUnsubscribeUsers(
    Emitter<WebsocketState> emit,
    _UnsubscribeUsers event,
  ) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
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

  Future _onGetSurveys(Emitter<WebsocketState> emit, _GetSurveys event) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
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
    emit(state.copyWith(status: WebsocketStatus.loading));
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

  Future _onGetPetitionSupporters(
    Emitter<WebsocketState> emit,
    _GetPetitionSupporters event,
  ) async {
    emit(state.copyWith(status: WebsocketStatus.loading));
    Map<String, dynamic> message = {
      'stream': usersStream,
      'payload': {
        "action": 'petition_supporters',
        'request_id': usersRequestId,
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
