import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/repository/api/api_repository.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/user/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_detail_bloc.freezed.dart';
part 'user_detail_state.dart';
part 'user_detail_event.dart';

const String stream = 'users';
const String requestId = 'users';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  UserDetailBloc({
    required this.webSocketService,
    required this.apiRepository,
  }) : super(const _Initial()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        switch (message['payload']['action']) {
          case 'retrieve':
            add(_Retrieved(payload: message['payload']));
          case 'update':
          case 'follow':
          case 'mute':
          case 'block':
          case 'toggle_notifications':
            add(_Updated(payload: message['payload']));
          case 'add_visit':
            add(_VisitAdded(payload: message['payload']));
        }
      }
    });
    on<_Retrieved>((event, emit) => _onRetrieved(event, emit));
    on<_Updated>((event, emit) => _onUpdated(event, emit));
    on<_Get>((event, emit) => _onGet(event, emit));
    on<_Patch>((event, emit) async => await _onPatch(event, emit));
    on<_Follow>((event, emit) => _onFollow(event, emit));
    on<_Mute>((event, emit) => _onMute(event, emit));
    on<_Block>((event, emit) => _onBlock(event, emit));
    on<_AddVisit>((event, emit) => _onAddVisit(event, emit));
    on<_VisitAdded>((event, emit) => _onVisitAdded(event, emit));
    on<_ToggleNotifications>(
      (event, emit) => _onToggleNotifications(event, emit),
    );
    on<_Unsubscribe>((event, emit) => _onUnsubscribe(event, emit));
  }

  void _onRetrieved(_Retrieved event, Emitter<UserDetailState> emit) async {
    emit(_Loading());
    if (event.payload['response_status'] == 200) {
      User user = User.fromJson(event.payload['data']);
      emit(UserLoaded(user: user));
    } else {
      emit(UserDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onUpdated(_Updated event, Emitter<UserDetailState> emit) async {
    emit(_Loading());
    if (event.payload['response_status'] == 200) {
      User user = User.fromJson(event.payload['data']);
      emit(UserUpdated(user: user));
    } else {
      emit(UserDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onGet(_Get event, Emitter<UserDetailState> emit) async {
    emit(_Loading());
    if (!webSocketService.isConnected) {
      emit(UserDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'retrieve',
        'request_id': requestId,
        'pk': event.userId,
      },
    };
    webSocketService.send(message);
  }

  Future _onPatch(_Patch event, Emitter<UserDetailState> emit) async {
    emit(_Loading());
    try {
      final data = await apiRepository.patchUser(
        user: event.user,
        name: event.name,
        bio: event.bio,
        imagePath: event.imagePath,
        coverPhotoPath: event.coverPhotoPath,
      );
      User user = event.user;
      user = user.copyWith(
        name: data['name'],
        bio: data['bio'],
        image: data['image'],
        coverPhoto: data['cover_photo'],
      );
      emit(UserPatched(user: user));
    } catch (e) {
      emit(UserDetailFailure(error: e.toString()));
    }
  }

  void _onFollow(_Follow event, Emitter<UserDetailState> emit) async {
    emit(_Loading());
    if (!webSocketService.isConnected) {
      emit(UserDetailFailure(error: serverError));
      return;
    }

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

  void _onMute(_Mute event, Emitter<UserDetailState> emit) async {
    emit(_Loading());
    if (!webSocketService.isConnected) {
      emit(UserDetailFailure(error: serverError));
      return;
    }

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

  void _onBlock(_Block event, Emitter<UserDetailState> emit) async {
    emit(_Loading());
    if (!webSocketService.isConnected) {
      emit(UserDetailFailure(error: serverError));
      return;
    }

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

  void _onAddVisit(_AddVisit event, Emitter<UserDetailState> emit) {
    emit(_Loading());
    if (!webSocketService.isConnected) {
      emit(UserDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'add_visit',
        "request_id": requestId,
        'pk': event.user.id,
      },
    };
    webSocketService.send(message);
  }

  void _onVisitAdded(_VisitAdded event, Emitter<UserDetailState> emit) {
    if (event.payload['response_status'] == 200) {
      emit(UserVisited(userId: event.payload['data']['pk']));
    } else {
      emit(UserDetailFailure(error: event.payload['errors'].toString()));
    }
  }

  void _onToggleNotifications(
    _ToggleNotifications event,
    Emitter<UserDetailState> emit,
  ) {
    emit(_Loading());
    if (!webSocketService.isConnected) {
      emit(UserDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'toggle_notifications',
        'request_id': requestId,
        'pk': event.user.id,
      },
    };
    webSocketService.send(message);
  }

  void _onUnsubscribe(_Unsubscribe event, Emitter<UserDetailState> emit) async {
    emit(_Loading());
    if (!webSocketService.isConnected) {
      emit(UserDetailFailure(error: serverError));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'unsubscribe',
        'request_id': requestId,
        'pk': event.user.id,
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
  final APIRepository apiRepository;
}
