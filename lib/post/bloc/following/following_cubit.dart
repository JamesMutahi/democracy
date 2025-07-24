import 'package:bloc/bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:equatable/equatable.dart';

part 'following_state.dart';

class FollowingCubit extends Cubit<FollowingState> {
  FollowingCubit() : super(FollowingState());

  void websocketFailure({required String error}) {
    if (state.status == FollowingStatus.initial) {
      emit(state.copyWith(status: FollowingStatus.failure));
    }
  }

  void loadPosts({required Map<String, dynamic> payload}) {
    if (state.hasReachedMax) return;

    if (payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        payload['data'].map((e) => Post.fromJson(e)),
      );

      if (posts.isEmpty) {
        return emit(
          state.copyWith(status: FollowingStatus.success, hasReachedMax: true),
        );
      }

      emit(
        state.copyWith(
          status: FollowingStatus.success,
          posts: [...state.posts, ...posts],
        ),
      );
    } else {
      emit(state.copyWith(status: FollowingStatus.failure));
    }
  }
}
