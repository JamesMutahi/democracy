import 'package:bloc/bloc.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:equatable/equatable.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit() : super(const ChatsState());

  void websocketFailure({required String error}) {
    if (state.status == ChatsStatus.initial ||
        state.status == ChatsStatus.loading) {
      emit(state.copyWith(status: ChatsStatus.failure));
    }
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(state.copyWith(status: ChatsStatus.loading));
    if (payload['response_status'] == 200) {
      final List<Chat> chats = List.from(
        payload['data']['results'].map((e) => Chat.fromJson(e)),
      );
      int? since = payload['data']['since'];
      emit(
        state.copyWith(
          status: ChatsStatus.success,
          chats: since == null ? chats : [...state.chats, ...chats],
          since: since,
          hasNext: payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: ChatsStatus.failure));
    }
  }
}
