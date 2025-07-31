import 'package:bloc/bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:equatable/equatable.dart';

part 'following_posts_state.dart';

class FollowingPostsCubit extends Cubit<FollowingPostsState> {
  FollowingPostsCubit() : super(FollowingPostsState());

  void websocketFailure({required String error}) {
    emit(state.copyWith(status: FollowingPostsStatus.failure));
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(state.copyWith(status: FollowingPostsStatus.loading));
    if (payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      int? lastPost = payload['data']['last_post'];
      emit(
        state.copyWith(
          status: FollowingPostsStatus.success,
          posts: lastPost == null ? posts : [...state.posts, ...posts],
          hasNext: payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: FollowingPostsStatus.failure));
    }
  }
}
