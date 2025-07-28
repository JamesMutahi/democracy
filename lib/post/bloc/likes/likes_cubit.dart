import 'package:bloc/bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:equatable/equatable.dart';

part 'likes_state.dart';

class LikesCubit extends Cubit<LikesState> {
  LikesCubit() : super(const LikesState());

  void websocketFailure({required String error}) {
    if (state.status == LikesStatus.initial ||
        state.status == LikesStatus.loading) {
      emit(state.copyWith(status: LikesStatus.failure));
    }
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(state.copyWith(status: LikesStatus.loading));
    if (payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      int? lastPost = payload['data']['last_post'];
      emit(
        state.copyWith(
          status: LikesStatus.success,
          posts: lastPost == null ? posts : [...state.posts, ...posts],
          userId: payload['request_id'],
          hasNext: payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: LikesStatus.failure));
    }
  }
}
