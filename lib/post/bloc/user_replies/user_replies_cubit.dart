import 'package:bloc/bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:equatable/equatable.dart';

part 'user_replies_state.dart';

class UserRepliesCubit extends Cubit<UserRepliesState> {
  UserRepliesCubit() : super(const UserRepliesState());

  void websocketFailure({required String error}) {
    if (state.status == UserRepliesStatus.initial ||
        state.status == UserRepliesStatus.loading) {
      emit(state.copyWith(status: UserRepliesStatus.failure));
    }
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(state.copyWith(status: UserRepliesStatus.loading));
    if (payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      int? lastPost = payload['data']['last_post'];
      emit(
        state.copyWith(
          status: UserRepliesStatus.success,
          posts: lastPost == null ? posts : [...state.posts, ...posts],
          userId: payload['request_id'],
          hasNext: payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: UserRepliesStatus.failure));
    }
  }
}
