import 'package:bloc/bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:equatable/equatable.dart';

part 'replies_state.dart';

class RepliesCubit extends Cubit<RepliesState> {
  RepliesCubit() : super(const RepliesState());

  void websocketFailure({required String error}) {
    if (state.status == RepliesStatus.initial ||
        state.status == RepliesStatus.loading) {
      emit(state.copyWith(status: RepliesStatus.failure));
    }
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(state.copyWith(status: RepliesStatus.loading));
    if (payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      int? lastPost = payload['data']['last_post'];
      emit(
        state.copyWith(
          status: RepliesStatus.success,
          posts: lastPost == null ? posts : [...state.posts, ...posts],
          postId: payload['request_id'],
          hasNext: payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: RepliesStatus.failure));
    }
  }
}
