import 'package:bloc/bloc.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:equatable/equatable.dart';

part 'message_actions_state.dart';

class MessageActionsCubit extends Cubit<MessageActionsState> {
  MessageActionsCubit() : super(const MessageActionsState());

  void messageHighlighted({required Message message}) {
    emit(state.copyWith(status: MessageActionsStatus.loading));
    if (!state.messages.contains(message)) {
      emit(
        state.copyWith(
          status: MessageActionsStatus.actionButtonsOpened,
          messages: {
            ...state.messages,
            ...{message},
          },
        ),
      );
    } else {
      Set<Message> messages = state.messages;
      messages.remove(message);
      emit(
        state.copyWith(
          status:
              messages.isEmpty
                  ? MessageActionsStatus.actionButtonsClosed
                  : MessageActionsStatus.actionButtonsOpened,
          messages: messages,
        ),
      );
    }
  }

  void closeActionButtons() {
    emit(state.copyWith(status: MessageActionsStatus.loading));
    emit(
      state.copyWith(
        status: MessageActionsStatus.actionButtonsClosed,
        messages: {},
      ),
    );
  }
}
