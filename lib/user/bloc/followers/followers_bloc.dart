import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/user/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'followers_bloc.freezed.dart';
part 'followers_state.dart';
part 'followers_event.dart';

const String stream = 'users';
const String requestId = 'users';
const String action = 'followers';

class FollowersBloc extends Bloc<FollowersEvent, FollowersState> {
  FollowersBloc({required this.webSocketService}) : super(FollowersState()) {
    webSocketService.messages.listen((message) {
      if (message['stream'] == stream &&
          message['payload']['action'] == action) {
        add(_Received(payload: message['payload']));
      }
    });
    on<_Get>((event, emit) {
      _onGet(event, emit);
    });
    on<_Received>((event, emit) {
      _onReceived(event, emit);
    });
  }

  Future _onGet(_Get event, Emitter<FollowersState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'followers',
        'request_id': requestId,
        'pk': event.user.id,
        'last_user': event.lastUser?.id,
      },
    };
    webSocketService.send(message);
  }

  Future _onReceived(_Received event, Emitter<FollowersState> emit) async {
    emit(state.copyWith(status: FollowersStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<User> users = List.from(
        event.payload['data']['results'].map((e) => User.fromJson(e)),
      );
      int? lastUser = event.payload['data']['last_user'];
      emit(
        state.copyWith(
          status: FollowersStatus.success,
          users: lastUser == null ? users : [...state.users, ...users],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: FollowersStatus.failure));
    }
  }

  final WebSocketService webSocketService;
}
