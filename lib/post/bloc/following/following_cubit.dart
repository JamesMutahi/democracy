import 'package:bloc/bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:equatable/equatable.dart';

part 'following_state.dart';

class FollowingCubit extends Cubit<FollowingState> {
  FollowingCubit() : super(FollowingState());

  void websocketFailure({required String error}) {
    if (state.status == FollowingStatus.initial ||
        state.status == FollowingStatus.loading) {
      emit(state.copyWith(status: FollowingStatus.failure));
    }
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(state.copyWith(status: FollowingStatus.loading));
    if (payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      int? lastPost = payload['data']['last_post'];
      emit(
        state.copyWith(
          status: FollowingStatus.success,
          posts: lastPost == null ? posts : [...state.posts, ...posts],
          hasNext: payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: FollowingStatus.failure));
    }
  }
}
