import 'package:bloc/bloc.dart';
import 'package:democracy/app/social/models/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_list_state.dart';
part 'post_list_cubit.freezed.dart';

class PostListCubit extends Cubit<PostListState> {
  PostListCubit() : super(const PostListState.initial());

  void loadPosts({required Map<String, dynamic> message}) {
    if (message['response_status'] == 200) {
      final List<Post> posts = List.from(
        message['data'].map((e) => Post.fromJson(e)),
      );
      emit(PostListLoaded(posts: posts));
    } else {
      emit(PostListFailure(error: message['errors']));
    }
  }
}
