import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_filter_state.dart';
part 'chat_filter_cubit.freezed.dart';

class ChatFilterCubit extends Cubit<ChatFilterState> {
  ChatFilterCubit() : super(const ChatFilterState.changed(searchTerm: ''));

  void searchTermChanged({required String searchTerm}) {
    emit(ChatFilterState.changed(searchTerm: searchTerm));
  }
}
