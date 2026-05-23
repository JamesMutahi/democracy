part of 'global_cubit.dart';

enum GlobalStatus { initial, loading, success, failure }

final class GlobalState extends Equatable {
  const GlobalState({
    this.status = GlobalStatus.initial,
    this.index,
    this.viewedPosts = const {},
    this.cameras = const [],
  });

  final GlobalStatus status;
  final int? index;
  final Set<Map<String, int>> viewedPosts;
  final List<CameraDescription> cameras;

  GlobalState copyWith({
    GlobalStatus? status,
    int? index,
    Set<Map<String, int>>? viewedPosts,
    List<CameraDescription>? cameras,
  }) {
    return GlobalState(
      status: status ?? this.status,
      index: index ?? this.index,
      viewedPosts: viewedPosts ?? this.viewedPosts,
      cameras: cameras ?? this.cameras,
    );
  }

  @override
  String toString() {
    return '''GlobalState { status: $status, index: $index, viewedPosts: $viewedPosts, cameras: ${cameras.length} }''';
  }

  @override
  List<Object?> get props => [status, index, viewedPosts, cameras];
}
