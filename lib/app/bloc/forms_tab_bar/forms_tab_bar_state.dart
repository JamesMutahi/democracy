part of 'forms_tab_bar_cubit.dart';

enum FormsTabBarStatus { onSurveys, onPetitions }

final class FormsTabBarState extends Equatable {
  const FormsTabBarState({this.status = FormsTabBarStatus.onSurveys});

  final FormsTabBarStatus status;

  FormsTabBarState copyWith({FormsTabBarStatus? status}) {
    return FormsTabBarState(status: status ?? this.status);
  }

  @override
  String toString() {
    return '''FormsTabBarState { status: $status }''';
  }

  @override
  List<Object> get props => [status];
}
