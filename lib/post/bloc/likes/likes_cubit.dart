import 'package:bloc/bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'likes_state.dart';
part 'likes_cubit.freezed.dart';

class LikesCubit extends Cubit<LikesState> {
  LikesCubit() : super(const LikesState.initial());

  void websocketFailure({required String error}) {
    if (state is LikesInitial || state is LikesLoading) {
      emit(LikesFailure());
    }
  }

  void retryButtonPressed() {
    emit(LikesInitial());
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(LikesLoading());
    if (payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        payload['data'].map((e) => Post.fromJson(e)),
      );
      emit(LikesLoaded(posts: posts));
    } else {
      emit(LikesFailure());
    }
  }
}
