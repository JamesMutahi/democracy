import 'package:bloc/bloc.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_detail_cubit.freezed.dart';
part 'message_detail_state.dart';

class MessageDetailCubit extends Cubit<MessageDetailState> {
  MessageDetailCubit() : super(const MessageDetailState.initial());

  void created({required Map<String, dynamic> payload}) {
    emit(MessageDetailLoading());
    if (payload['response_status'] == 201) {
      Message message = Message.fromJson(payload['data']);
      emit(MessageCreated(message: message));
    } else {
      emit(MessageDetailFailure(error: payload['errors'][0]));
    }
  }

  void updated({required Map<String, dynamic> payload}) {
    emit(MessageDetailLoading());
    if (payload['response_status'] == 200) {
      Message message = Message.fromJson(payload['data']);
      emit(MessageUpdated(message: message));
    } else {
      emit(MessageDetailFailure(error: payload['errors'][0]));
    }
  }

  void deleted({required Map<String, dynamic> payload}) {
    emit(MessageDetailLoading());
    if (payload['response_status'] == 204) {
      emit(MessageDeleted(messageId: payload['pk']));
    } else {
      emit(MessageDetailFailure(error: payload['errors'][0]));
    }
  }
}
