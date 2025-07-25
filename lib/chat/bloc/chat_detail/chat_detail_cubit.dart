import 'package:bloc/bloc.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_detail_state.dart';
part 'chat_detail_cubit.freezed.dart';

class ChatDetailCubit extends Cubit<ChatDetailState> {
  ChatDetailCubit() : super(const ChatDetailState.initial());

  void created({required Map<String, dynamic> payload}) {
    emit(ChatDetailLoading());
    if (payload['response_status'] == 201) {
      final Chat chat = Chat.fromJson(payload['data']);
      emit(ChatCreated(chat: chat));
    } else {
      emit(ChatDetailFailure(error: payload['errors'][0]));
    }
  }

  void updated({required Map<String, dynamic> payload}) {
    emit(ChatDetailLoading());
    if (payload['response_status'] == 200) {
      final Chat chat = Chat.fromJson(payload['data']);
      emit(ChatUpdated(chat: chat));
    } else {
      emit(ChatDetailFailure(error: payload['errors'][0]));
    }
  }

  void deleted({required Map<String, dynamic> payload}) {
    emit(ChatDetailLoading());
    if (payload['response_status'] == 204) {
      emit(ChatDeleted(chatId: payload['pk']));
    } else {
      emit(ChatDetailFailure(error: payload['errors'][0]));
    }
  }

  void directMessageSent({required Map<String, dynamic> payload}) {
    emit(ChatDetailLoading());
    if (payload['response_status'] == 200) {
      emit(DirectMessageSent());
    } else {
      emit(ChatDetailFailure(error: payload['errors'][0]));
    }
  }
}
