part of 'theme_cubit.dart';

enum ThemeStatus { initial, loading, success, failure }

final class ThemeState extends Equatable {
  const ThemeState({
    this.status = ThemeStatus.initial,
    this.index,
    this.openChatId,
    this.viewedPosts = const {},
  });

  final ThemeStatus status;
  final int? index;
  final int? openChatId;
  final Set<Map<String, int>> viewedPosts;

  ThemeState copyWith({
    ThemeStatus? status,
    int? index,
    int? openChatId,
    Set<Map<String, int>>? viewedPosts,
  }) {
    return ThemeState(
      status: status ?? this.status,
      index: index ?? this.index,
      openChatId: openChatId ?? this.index,
      viewedPosts: viewedPosts ?? this.viewedPosts,
    );
  }

  @override
  String toString() {
    return '''ThemeState { status: $status, index: $index, openChatId: $openChatId, viewedPosts: $viewedPosts }''';
  }

  @override
  List<Object> get props => [status, ?index, ?openChatId, viewedPosts];
}
