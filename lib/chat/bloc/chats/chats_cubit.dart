import 'package:bloc/bloc.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chats_state.dart';
part 'chats_cubit.freezed.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit() : super(const ChatsState.initial());

  void websocketFailure({required String error}) {
    if (state is ChatsInitial || state is ChatsLoading) {
      emit(ChatsFailure(error: error));
    }
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(ChatsLoading());
    if (payload['response_status'] == 200) {
      final List<Chat> chats = List.from(
        payload['data'].map((e) => Chat.fromJson(e)),
      );
      emit(ChatsLoaded(chats: chats));
    } else {
      emit(ChatsFailure(error: payload['errors'].toString()));
    }
  }
}
