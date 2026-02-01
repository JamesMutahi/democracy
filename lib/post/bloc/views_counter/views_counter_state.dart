part of 'views_counter_bloc.dart';

enum ViewsCounterStatus { initial, loading, success, failure }

final class ViewsCounterState extends Equatable {
  const ViewsCounterState({
    this.status = ViewsCounterStatus.initial,
    this.postIds = const [],
  });

  final ViewsCounterStatus status;
  final List<int> postIds;

  ViewsCounterState copyWith({ViewsCounterStatus? status, List<int>? postIds}) {
    return ViewsCounterState(
      status: status ?? this.status,
      postIds: postIds ?? this.postIds,
    );
  }

  @override
  String toString() {
    return '''ViewsCounterState { status: $status, postIds: ${postIds.length} }''';
  }

  @override
  List<Object> get props => [status, postIds];
}
