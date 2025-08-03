import 'package:bloc/bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:equatable/equatable.dart';

part 'draft_posts_state.dart';

class DraftPostsCubit extends Cubit<DraftPostsState> {
  DraftPostsCubit() : super(DraftPostsState());

  void websocketFailure({required String error}) {
    emit(state.copyWith(status: DraftPostsStatus.failure));
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(state.copyWith(status: DraftPostsStatus.loading));
    if (payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      int? lastPost = payload['data']['last_post'];
      emit(
        state.copyWith(
          status: DraftPostsStatus.success,
          posts: lastPost == null ? posts : [...state.posts, ...posts],
          hasNext: payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: DraftPostsStatus.failure));
    }
  }
}
