import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/user/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_bloc.freezed.dart';
part 'users_state.dart';
part 'users_event.dart';

const String stream = 'users';
const String requestId = 'users';
const String action = 'list';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc({required this.webSocketService}) : super(const UsersState()) {
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
    on<_Resubscribe>((event, emit) {
      _onResubscribe(event, emit);
    });
    on<_Unsubscribe>((event, emit) {
      _onUnsubscribe(event, emit);
    });
  }

  Future _onGet(_Get event, Emitter<UsersState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'list',
        'request_id': requestId,
        'search_term': event.searchTerm,
        'last_user': event.lastUser?.id,
      },
    };
    webSocketService.send(message);
  }

  Future _onReceived(_Received event, Emitter<UsersState> emit) async {
    emit(state.copyWith(status: UsersStatus.loading));
    if (event.payload['response_status'] == 200) {
      final List<User> users = List.from(
        event.payload['data']['results'].map((e) => User.fromJson(e)),
      );
      int? lastUser = event.payload['data']['last_user'];
      emit(
        state.copyWith(
          status: UsersStatus.success,
          users: lastUser == null ? users : [...state.users, ...users],
          hasNext: event.payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: UsersStatus.failure));
    }
  }

  Future _onResubscribe(_Resubscribe event, Emitter<UsersState> emit) async {
    List<int> userIds = event.users.map((user) => user.id).toList();
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        "action": 'resubscribe',
        'request_id': requestId,
        'pks': userIds,
      },
    };
    webSocketService.send(message);
  }

  Future _onUnsubscribe(_Unsubscribe event, Emitter<UsersState> emit) async {
    List<int> userIds = event.users.map((user) => user.id).toList();
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'unsubscribe',
        'request_id': requestId,
        'pks': userIds,
      },
    };
    webSocketService.send(message);
  }

  final WebSocketService webSocketService;
}
