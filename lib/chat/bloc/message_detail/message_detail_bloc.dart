import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/meet/models/meeting.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_detail_bloc.freezed.dart';
part 'message_detail_state.dart';
part 'message_detail_event.dart';

const String stream = 'chats';
const String requestId = 'messages';

class MessageDetailBloc extends Bloc<MessageDetailEvent, MessageDetailState> {
  MessageDetailBloc({required this.webSocketService})
    : super(const MessageDetailState.initial()) {
    webSocketService.messages.listen((message) {
      if (message['stream'] == stream) {
        switch (message['payload']['action']) {
          case 'create':
            add(_Created(payload: message['payload']));
          case 'update':
            add(_Updated(payload: message['payload']));
          case 'delete':
            add(_Deleted(payload: message['payload']));
        }
      }
    });
    on<_Created>((event, emit) {
      _onCreated(event, emit);
    });
    on<_Updated>((event, emit) {
      _onUpdated(event, emit);
    });
    on<_Deleted>((event, emit) {
      _onDeleted(event, emit);
    });
    on<_Create>((event, emit) {
      _onCreate(event, emit);
    });
    on<_Edit>((event, emit) {
      _onEdit(event, emit);
    });
    on<_Delete>((event, emit) {
      _onDelete(event, emit);
    });
  }

  Future _onCreated(_Created event, Emitter<MessageDetailState> emit) async {
    emit(MessageDetailLoading());
    if (event.payload['response_status'] == 201) {
      Message message = Message.fromJson(event.payload['data']);
      emit(MessageCreated(message: message));
    } else {
      emit(MessageDetailFailure(error: event.payload['errors'][0]));
    }
  }

  Future _onUpdated(_Updated event, Emitter<MessageDetailState> emit) async {
    emit(MessageDetailLoading());
    if (event.payload['response_status'] == 200) {
      Message message = Message.fromJson(event.payload['data']);
      emit(MessageUpdated(message: message));
    } else {
      emit(MessageDetailFailure(error: event.payload['errors'][0]));
    }
  }

  Future _onDeleted(_Deleted event, Emitter<MessageDetailState> emit) async {
    emit(MessageDetailLoading());
    if (event.payload['response_status'] == 204) {
      emit(MessageDeleted(messageId: event.payload['pk']));
    } else {
      emit(MessageDetailFailure(error: event.payload['errors'][0]));
    }
  }

  Future _onCreate(_Create event, Emitter<MessageDetailState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'create_message',
        'request_id': requestId,
        'data': {
          'chat': event.chat.id,
          'text': event.text,
          'post_id': event.post?.id,
          'ballot_id': event.ballot?.id,
          'survey_id': event.survey?.id,
          'petition_id': event.petition?.id,
          'meeting_id': event.meeting?.id,
        },
      },
    };
    webSocketService.send(message);
  }

  Future _onEdit(_Edit event, Emitter<MessageDetailState> emit) async {
    Map<String, dynamic> message = {
      'stream': stream,
      'payload': {
        'action': 'edit_message',
        'request_id': requestId,
        'pk': event.messageId,
        'data': {'text': event.text},
      },
    };
    webSocketService.send(message);
  }

  Future _onDelete(_Delete event, Emitter<MessageDetailState> emit) async {
    for (Message msg in event.messages) {
      Map<String, dynamic> message = {
        'stream': stream,
        'payload': {
          'action': 'delete_message',
          'request_id': requestId,
          'pk': msg.id,
        },
      };
      webSocketService.send(message);
    }
  }

  final WebSocketService webSocketService;
}
