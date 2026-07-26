import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/user/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

const String stream = 'users';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required this.webSocketService}) : super(const ProfileState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        switch (message['payload']['action']) {
          case 'retrieve':
            add(_Loaded(payload: message['payload']));
        }
      }
    });
    on<_Load>((event, emit) => _onLoad(event, emit));
    on<_Loaded>((event, emit) => _onLoaded(event, emit));
    on<_Updated>((event, emit) => _onUpdated(event, emit));
  }

  void _onLoad(_Load event, Emitter<ProfileState> emit) async {
    emit(
      state.copyWith(status: ProfileStatus.loading, username: event.username),
    );
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: ProfileStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'retrieve',
        'request_id': event.username,
        'username': event.username,
      },
    };
    webSocketService.send(message);
  }

  void _onLoaded(_Loaded event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(status: ProfileStatus.loading));
    if (event.payload['response_status'] == 200) {
      final user = User.fromJson(event.payload['data']);
      emit(
        state.copyWith(
          status: ProfileStatus.success,
          user: user,
          username: event.payload['request_id'],
        ),
      );
    } else if (event.payload['response_status'] == 404) {
      emit(
        state.copyWith(
          status: ProfileStatus.notFound,
          username: event.payload['request_id'],
        ),
      );
    } else {
      emit(state.copyWith(status: ProfileStatus.failure));
    }
  }

  void _onUpdated(_Updated event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(status: ProfileStatus.loading));
    emit(
      state.copyWith(
        status: ProfileStatus.success,
        user: event.user,
        username: event.user.username,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }

  late StreamSubscription _subscription;
  final WebSocketService webSocketService;
}
