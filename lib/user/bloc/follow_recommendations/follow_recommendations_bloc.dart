import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/user/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow_recommendations_event.dart';
part 'follow_recommendations_state.dart';
part 'follow_recommendations_bloc.freezed.dart';

const String stream = 'users';
const String requestId = 'users';
const String action = 'recommendations';

class FollowRecommendationsBloc
    extends Bloc<FollowRecommendationsEvent, FollowRecommendationsState> {
  FollowRecommendationsBloc({required this.webSocketService})
    : super(const FollowRecommendationsState()) {
    _subscription = webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Get>((event, emit) => _onGet(event, emit));
    on<_Received>((event, emit) => _onReceived(event, emit));
    on<_Update>((event, emit) => _onUpdate(event, emit));
  }

  void _onGet(_Get event, Emitter<FollowRecommendationsState> emit) async {
    emit(state.copyWith(status: FollowRecommendationsStatus.loading));
    if (!webSocketService.isConnected) {
      emit(state.copyWith(status: FollowRecommendationsStatus.failure));
      return;
    }

    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {'action': action},
    };
    webSocketService.send(message);
  }

  void _onReceived(
    _Received event,
    Emitter<FollowRecommendationsState> emit,
  ) async {
    emit(state.copyWith(status: FollowRecommendationsStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<User> users = List.from(
        event.payload['data']['results'].map((e) => User.fromJson(e)),
      );
      emit(
        state.copyWith(
          status: FollowRecommendationsStatus.success,
          users: users,
        ),
      );
    } else {
      emit(state.copyWith(status: FollowRecommendationsStatus.failure));
    }
  }

  void _onUpdate(_Update event, Emitter<FollowRecommendationsState> emit) {
    emit(state.copyWith(status: FollowRecommendationsStatus.loading));
    emit(
      state.copyWith(
        users: event.users,
        status: FollowRecommendationsStatus.success,
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
