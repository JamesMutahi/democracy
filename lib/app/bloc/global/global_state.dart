part of 'global_cubit.dart';

enum GlobalStatus { initial, loading, success, failure }

final class GlobalState extends Equatable {
  const GlobalState({
    this.status = GlobalStatus.initial,
    this.index,
    this.openChatId,
    this.viewedPosts = const {},
    this.cameras = const [],
  });

  final GlobalStatus status;
  final int? index;
  final int? openChatId;
  final Set<Map<String, int>> viewedPosts;
  final List<CameraDescription> cameras;

  GlobalState copyWith({
    GlobalStatus? status,
    int? index,
    int? openChatId,
    Set<Map<String, int>>? viewedPosts,
    List<CameraDescription>? cameras,
  }) {
    return GlobalState(
      status: status ?? this.status,
      index: index ?? this.index,
      openChatId: openChatId ?? this.index,
      viewedPosts: viewedPosts ?? this.viewedPosts,
      cameras: cameras ?? this.cameras,
    );
  }

  @override
  String toString() {
    return '''GlobalState { status: $status, index: $index, openChatId: $openChatId, viewedPosts: $viewedPosts, cameras: ${cameras.length} }''';
  }

  @override
  List<Object> get props => [status, ?index, ?openChatId, viewedPosts, cameras];
}
