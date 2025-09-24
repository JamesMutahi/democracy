import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/user/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_detail_bloc.freezed.dart';
part 'user_detail_state.dart';
part 'user_detail_event.dart';

const String stream = 'users';
const String requestId = 'users';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  UserDetailBloc({required this.webSocketService}) : super(const _Initial()) {
    webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        switch (message['payload']['action']) {
          case 'retrieve':
            add(_Retrieved(payload: message['payload']));
          case 'update':
          case 'mute':
          case 'block':
            add(_Updated(payload: message['payload']));
        }
      }
    });
    on<_Retrieved>((event, emit) {
      _onRetrieved(event, emit);
    });
    on<_Updated>((event, emit) {
      _onUpdated(event, emit);
    });
    on<_Get>((event, emit) {
      _onGet(event, emit);
    });
    on<_Update>((event, emit) {
      _onUpdate(event, emit);
    });
    on<_Follow>((event, emit) {
      _onFollow(event, emit);
    });
    on<_Mute>((event, emit) {
      _onMute(event, emit);
    });
    on<_Block>((event, emit) {
      _onBlock(event, emit);
    });
  }

  Future _onRetrieved(_Retrieved event, Emitter<UserDetailState> emit) async {
    emit(_Loading());
    if (event.payload['response_status'] == 200) {
      User user = User.fromJson(event.payload['data']);
      emit(UserLoaded(user: user));
    } else {
      emit(UserDetailFailure(error: event.payload['errors'][0]));
    }
  }

  Future _onUpdated(_Updated event, Emitter<UserDetailState> emit) async {
    emit(_Loading());
    if (event.payload['response_status'] == 200) {
      User user = User.fromJson(event.payload['data']);
      emit(UserUpdated(user: user));
    } else {
      emit(UserDetailFailure(error: event.payload['errors'][0]));
    }
  }

  Future _onGet(_Get event, Emitter<UserDetailState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'retrieve',
        'request_id': requestId,
        'pk': event.user.id,
      },
    };
    webSocketService.send(message);
  }

  Future _onUpdate(_Update event, Emitter<UserDetailState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'patch',
        'request_id': requestId,
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
    webSocketService.send(message);
  }

  Future _onFollow(_Follow event, Emitter<UserDetailState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'follow',
        'request_id': requestId,
        'pk': event.user.id,
      },
    };
    webSocketService.send(message);
  }

  Future _onMute(_Mute event, Emitter<UserDetailState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'mute',
        'request_id': requestId,
        'pk': event.user.id,
      },
    };
    webSocketService.send(message);
  }

  Future _onBlock(_Block event, Emitter<UserDetailState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'block',
        'request_id': requestId,
        'pk': event.user.id,
      },
    };
    webSocketService.send(message);
  }

  final WebSocketService webSocketService;
}
