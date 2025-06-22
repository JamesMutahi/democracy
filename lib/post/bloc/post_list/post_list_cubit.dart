import 'package:bloc/bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_list_state.dart';
part 'post_list_cubit.freezed.dart';

class PostListCubit extends Cubit<PostListState> {
  PostListCubit() : super(const PostListState.initial());

  void websocketFailure({required String error}) {
    if (state is PostListInitial || state is PostListLoading) {
      emit(PostListFailure(error: error));
    }
  }

  void retryButtonPressed() {
    emit(PostListInitial());
  }

  void loadPosts({required Map<String, dynamic> payload}) {
    if (payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        payload['data'].map((e) => Post.fromJson(e)),
      );
      emit(PostListLoaded(posts: posts));
    } else {
      emit(PostListFailure(error: payload['errors'].toString()));
    }
  }
}
