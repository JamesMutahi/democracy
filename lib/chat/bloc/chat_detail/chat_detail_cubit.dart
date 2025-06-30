import 'package:bloc/bloc.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_detail_state.dart';
part 'chat_detail_cubit.freezed.dart';

class ChatDetailCubit extends Cubit<ChatDetailState> {
  ChatDetailCubit() : super(const ChatDetailState.initial());

  void websocketFailure({required String error}) {
    if (state is ChatDetailInitial || state is ChatDetailLoading) {
      emit(ChatDetailFailure());
    }
  }

  void chatCreated({required Map<String, dynamic> payload}) {
    emit(ChatDetailLoading());
    if (payload['response_status'] == 201) {
      final Chat chat = Chat.fromJson(payload['data']);
      emit(ChatCreated(chat: chat));
    } else {
      emit(ChatDetailFailure());
    }
  }

  void messageCreated({required Map<String, dynamic> payload}) {
    emit(ChatDetailLoading());
    if (payload['response_status'] == 201) {
      Message message = Message.fromJson(payload['data']);
      emit(MessageCreated(message: message));
    } else {
      emit(ChatDetailFailure());
    }
  }

  void messageUpdated({required Map<String, dynamic> payload}) {
    emit(ChatDetailLoading());
    if (payload['response_status'] == 200) {
      Message message = Message.fromJson(payload['data']);
      emit(MessageUpdated(message: message));
    } else {
      emit(ChatDetailFailure());
    }
  }

  void messageDeleted({required Map<String, dynamic> payload}) {
    emit(ChatDetailLoading());
    if (payload['response_status'] == 204) {
      emit(MessageDeleted(message: Message.fromJson(payload['data'])));
    } else {
      emit(ChatDetailFailure());
    }
  }

  void chatUpdated({required Map<String, dynamic> payload}) {
    emit(ChatDetailLoading());
    if (payload['response_status'] == 200) {
      final Chat chat = Chat.fromJson(payload['data']);
      emit(ChatUpdated(chat: chat));
    } else {
      emit(ChatDetailFailure());
    }
  }
}
