part of 'chat_filter_cubit.dart';

@freezed
sealed class ChatFilterState with _$ChatFilterState {
  const factory ChatFilterState.changed({required String searchTerm}) =
      _Changed;
}
