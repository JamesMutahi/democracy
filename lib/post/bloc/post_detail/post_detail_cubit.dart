import 'package:bloc/bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_detail_state.dart';
part 'post_detail_cubit.freezed.dart';

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

  void updated({required Map<String, dynamic> payload}) {
    emit(PostDetailLoading());
    if (payload['response_status'] == 200) {
      final Post post = Post.fromJson(payload['data']);
      emit(PostUpdated(post: post));
    } else {
      emit(PostDetailFailure(error: payload['errors'][0].toString()));
    }
  }

  void deleted({required Map<String, dynamic> payload}) {
    emit(PostDetailLoading());
    if (payload['response_status'] == 204) {
      final Post post = Post.fromJson(payload['data']);
      emit(PostDeleted(post: post));
    } else {
      emit(PostDetailFailure(error: payload['errors'][0].toString()));
    }
  }

  void reported({required Map<String, dynamic> payload}) {
    emit(PostDetailLoading());
    if (payload['response_status'] == 204) {
      emit(PostReported());
    } else {
      emit(PostDetailFailure(error: payload['errors'][0].toString()));
    }
  }
}
