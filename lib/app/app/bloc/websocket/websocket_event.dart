part of 'websocket_bloc.dart';

@freezed
class WebsocketEvent with _$WebsocketEvent {
  const factory WebsocketEvent.connect() = _Connect;
  const factory WebsocketEvent.changeState({required WebsocketState state}) =
      _ChangeState;
  const factory WebsocketEvent.sendMessage({
    required Map<String, dynamic> message,
  }) = _SendMessage;
}

/*
{
  "stream": "posts",
  "payload": {"errors": [], data: [], action: 'list', response_status: 200, request_id: 42}
}
*/


enum Stream { posts, polls }

Map<Stream, String> streams = {Stream.posts: 'posts', Stream.polls: 'polls'};

enum Act { list, create }

Map<Act, String> actions = {Act.list: 'list', Act.create: 'create'};

enum Request { posts, polls }

Map<Request, int> requests = {Request.posts: 1, Request.polls: 2};
