import 'package:bloc/bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_detail_cubit.freezed.dart';
part 'post_detail_state.dart';

class PostDetailCubit extends Cubit<PostDetailState> {
  PostDetailCubit() : super(const PostDetailState.initial());

  void created({required Map<String, dynamic> payload}) {
    emit(PostDetailLoading());
    if (payload['response_status'] == 201) {
      final Post post = Post.fromJson(payload['data']);
      emit(PostCreated(post: post));
    } else {
      emit(PostDetailFailure(error: payload['errors'][0].toString()));
    }
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(PostDetailLoading());
    if (payload['response_status'] == 200) {
      final Post post = Post.fromJson(payload['data']);
      emit(PostLoaded(post: post));
    } else {
      emit(PostDetailFailure(error: payload['errors'][0].toString()));
    }
  }

  void updated({required Map<String, dynamic> payload}) {
    emit(PostDetailLoading());
    if (payload['response_status'] == 200) {
      emit(
        PostUpdated(
          postId: payload['pk'],
          body: payload['data']['body'],
          likes: payload['data']['likes'],
          isLiked: payload['data']['is_liked'],
          bookmarks: payload['data']['bookmarks'],
          isBookmarked: payload['data']['is_bookmarked'],
          views: payload['data']['views'],
          replies: payload['data']['replies'],
          reposts: payload['data']['reposts'],
          isReposted: payload['data']['is_reposted'],
          isQuoted: payload['data']['is_quoted'],
          isDeleted: payload['data']['is_deleted'],
          isActive: payload['data']['is_active'],
        ),
      );
    } else {
      emit(PostDetailFailure(error: payload['errors'][0].toString()));
    }
  }

  void deleted({required Map<String, dynamic> payload}) {
    emit(PostDetailLoading());
    if (payload['response_status'] == 204) {
      emit(PostDeleted(postId: payload['pk']));
    } else {
      emit(PostDetailFailure(error: payload['errors'][0].toString()));
    }
  }

  void reported({required Map<String, dynamic> payload}) {
    emit(PostDetailLoading());
    if (payload['response_status'] == 200) {
      emit(PostReported());
    } else {
      emit(PostDetailFailure(error: payload['errors'][0].toString()));
    }
  }
}
