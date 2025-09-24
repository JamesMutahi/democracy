import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/notification/models/preferences.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferences_bloc.freezed.dart';
part 'preferences_state.dart';
part 'preferences_event.dart';

const String stream = 'notifications';
const String requestId = 'notifications';
const String action = 'preferences';

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  PreferencesBloc({required this.webSocketService})
    : super(const PreferencesState.initial()) {
    webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        switch (message['payload']['action']) {
          case 'preferences':
          case 'update_preferences':
            add(_Received(payload: message['payload']));
        }
      }
    });
    on<_Get>((event, emit) {
      _onGet(event, emit);
    });
    on<_Received>((event, emit) {
      _onReceived(event, emit);
    });
    on<_Update>((event, emit) {
      _onUpdate(event, emit);
    });
  }

  Future _onGet(_Get event, Emitter<PreferencesState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {'action': 'preferences', 'request_id': requestId},
    };
    webSocketService.send(message);
  }

  Future _onReceived(_Received event, Emitter<PreferencesState> emit) async {
    emit(PreferencesLoading());
    if (event.payload['response_status'] == 200) {
      Preferences preferences = Preferences.fromJson(event.payload['data']);
      emit(PreferencesLoaded(preferences: preferences));
    } else {
      emit(PreferencesFailure(error: event.payload['errors'][0]));
    }
  }

  Future _onUpdate(_Update event, Emitter<PreferencesState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'update_preferences',
        'request_id': requestId,
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
    webSocketService.send(message);
  }

  final WebSocketService webSocketService;
}
