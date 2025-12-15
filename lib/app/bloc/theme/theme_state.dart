part of 'theme_cubit.dart';

enum ThemeStatus { initial, loading, success, failure }

final class ThemeState extends Equatable {
  const ThemeState({this.status = ThemeStatus.initial, this.index});

  final ThemeStatus status;
  final int? index;

  ThemeState copyWith({ThemeStatus? status, int? index, bool? hasNext}) {
    return ThemeState(
      status: status ?? this.status,
      index: index ?? this.index,
    );
  }

  @override
  String toString() {
    return '''ThemeState { status: $status, index: $index }''';
  }

  @override
  List<Object> get props => [status, ?index];
}
