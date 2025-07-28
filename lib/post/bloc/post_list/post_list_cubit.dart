import 'package:bloc/bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:equatable/equatable.dart';

part 'post_list_state.dart';

class PostListCubit extends Cubit<PostListState> {
  PostListCubit() : super(const PostListState());

  void websocketFailure({required String error}) {
    if (state.status == PostListStatus.initial ||
        state.status == PostListStatus.loading) {
      emit(state.copyWith(status: PostListStatus.failure));
    }
  }

  void loaded({required Map<String, dynamic> payload}) {
    if (payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      emit(
        state.copyWith(
          status: PostListStatus.success,
          posts: [...state.posts, ...posts],
          currentPage: payload['data']['current_page'],
          hasNext: payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: PostListStatus.failure));
    }
  }
}
