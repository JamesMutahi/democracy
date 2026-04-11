part of 'theme_cubit.dart';

enum ThemeStatus { initial, loading, success, failure }

final class ThemeState extends Equatable {
  const ThemeState({
    this.status = ThemeStatus.initial,
    this.index,
    this.openChatId,
  });

  final ThemeStatus status;
  final int? index;
  final int? openChatId;

  ThemeState copyWith({ThemeStatus? status, int? index, int? openChatId}) {
    return ThemeState(
      status: status ?? this.status,
      index: index ?? this.index,
      openChatId: openChatId ?? this.index,
    );
  }

  @override
  String toString() {
    return '''ThemeState { status: $status, index: $index, openChatId: $openChatId }''';
  }

  @override
  List<Object> get props => [status, ?index, ?openChatId];
}
