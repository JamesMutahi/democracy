import 'package:bloc/bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:equatable/equatable.dart';

part 'user_posts_state.dart';

class UserPostsCubit extends Cubit<UserPostsState> {
  UserPostsCubit() : super(const UserPostsState());

  void websocketFailure({required String error}) {
    if (state.status == UserPostsStatus.initial ||
        state.status == UserPostsStatus.loading) {
      emit(state.copyWith(status: UserPostsStatus.failure));
    }
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(state.copyWith(status: UserPostsStatus.loading));
    if (payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      int? lastPost = payload['data']['last_post'];
      emit(
        state.copyWith(
          status: UserPostsStatus.success,
          posts: lastPost == null ? posts : [...state.posts, ...posts],
          userId: payload['request_id'],
          hasNext: payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: UserPostsStatus.failure));
    }
  }
}
