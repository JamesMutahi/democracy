import 'package:bloc/bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_posts_state.dart';
part 'user_posts_cubit.freezed.dart';

class UserPostsCubit extends Cubit<UserPostsState> {
  UserPostsCubit() : super(const UserPostsState.initial());

  void loaded({required Map<String, dynamic> payload}) {
    emit(UserPostsLoading());
    if (payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        payload['data'].map((e) => Post.fromJson(e)),
      );
      emit(UserPostsLoaded(userId: payload['request_id'], posts: posts));
    } else {
      emit(UserPostsFailure(userId: payload['request_id']));
    }
  }
}
