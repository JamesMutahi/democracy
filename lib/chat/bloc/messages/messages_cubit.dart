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
    if (state.hasReachedMax) return;

    if (payload['response_status'] == 200) {
      final List<Message> messages = List.from(
        payload['data'].map((e) => Message.fromJson(e)),
      );

      if (messages.isEmpty) {
        return emit(
          state.copyWith(status: MessagesStatus.success, hasReachedMax: true),
        );
      }

      emit(
        state.copyWith(
          status: MessagesStatus.success,
          messages: [...state.messages, ...messages],
        ),
      );
    } else {
      emit(state.copyWith(status: MessagesStatus.failure));
    }
  }
}

