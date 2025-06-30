import 'package:bloc/bloc.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:equatable/equatable.dart';

part 'chat_actions_state.dart';

class ChatActionsCubit extends Cubit<ChatActionsState> {
  ChatActionsCubit() : super(const ChatActionsState());

  void chatHighlighted({required Chat chat}) {
    emit(state.copyWith(status: ChatActionsStatus.loading));
    if (!state.chats.contains(chat)) {
      emit(
        state.copyWith(
          status: ChatActionsStatus.actionButtonsOpened,
          chats: {
            ...state.chats,
            ...{chat},
          },
        ),
      );
    } else {
      Set<Chat> chats = state.chats;
      chats.remove(chat);
      emit(
        state.copyWith(
          status:
              chats.isEmpty
                  ? ChatActionsStatus.actionButtonsClosed
                  : ChatActionsStatus.actionButtonsOpened,
          chats: chats,
        ),
      );
    }
  }

  void closeActionButtons() {
    emit(state.copyWith(status: ChatActionsStatus.loading));
    emit(
      state.copyWith(status: ChatActionsStatus.actionButtonsClosed, chats: {}),
    );
  }
}
