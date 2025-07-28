import 'package:bloc/bloc.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:equatable/equatable.dart';

part 'messages_state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit() : super(MessagesState());

  void websocketFailure({required String error}) {
    if (state.status == MessagesStatus.initial) {
      emit(state.copyWith(status: MessagesStatus.failure));
    }
  }

  void initialize() {
    emit(MessagesState());
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(state.copyWith(status: MessagesStatus.loading));
    if (payload['response_status'] == 200) {
      final List<Message> messages = List.from(
        payload['data']['results'].map((e) => Message.fromJson(e)),
      );
      int? lastMessage = payload['data']['last_message'];
      emit(
        state.copyWith(
          status: MessagesStatus.success,
          messages:
              lastMessage == null ? messages : [...state.messages, ...messages],
          hasNext: payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: MessagesStatus.failure));
    }
  }
}
