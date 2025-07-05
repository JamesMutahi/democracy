import 'package:bloc/bloc.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_detail_state.dart';
part 'chat_detail_cubit.freezed.dart';

class ChatDetailCubit extends Cubit<ChatDetailState> {
  ChatDetailCubit() : super(const ChatDetailState.initial());

  void chatCreated({required Map<String, dynamic> payload}) {
    emit(ChatDetailLoading());
    if (payload['response_status'] == 201) {
      final Chat chat = Chat.fromJson(payload['data']);
      emit(ChatCreated(chat: chat));
    } else {
      emit(ChatDetailFailure(error: payload['errors'][0]));
    }
  }

  void chatUpdated({required Map<String, dynamic> payload}) {
    emit(ChatDetailLoading());
    if (payload['response_status'] == 200) {
      final Chat chat = Chat.fromJson(payload['data']);
      emit(ChatUpdated(chat: chat));
    } else {
      emit(ChatDetailFailure(error: payload['errors'][0]));
    }
  }

  void messageCreated({required Map<String, dynamic> payload}) {
    emit(ChatDetailLoading());
    if (payload['response_status'] == 201) {
      Message message = Message.fromJson(payload['data']);
      emit(MessageCreated(message: message));
    } else {
      emit(ChatDetailFailure(error: payload['errors'][0]));
    }
  }

  void messageUpdated({required Map<String, dynamic> payload}) {
    emit(ChatDetailLoading());
    if (payload['response_status'] == 200) {
      Message message = Message.fromJson(payload['data']);
      emit(MessageUpdated(message: message));
    } else {
      emit(ChatDetailFailure(error: payload['errors'][0]));
    }
  }

  void messageDeleted({required Map<String, dynamic> payload}) {
    emit(ChatDetailLoading());
    if (payload['response_status'] == 204) {
      Message message = Message.fromJson(payload['data']);
      emit(MessageDeleted(message: message));
    } else {
      emit(ChatDetailFailure(error: payload['errors'][0]));
    }
  }
}
