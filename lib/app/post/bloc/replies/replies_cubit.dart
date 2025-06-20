import 'package:bloc/bloc.dart';
import 'package:democracy/app/post/models/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'replies_state.dart';
part 'replies_cubit.freezed.dart';

class RepliesCubit extends Cubit<RepliesState> {
  RepliesCubit() : super(const RepliesState.initial());

  void websocketFailure({required String error}) {
    if (state is RepliesInitial || state is RepliesLoading) {
      emit(RepliesFailure());
    }
  }

  void retryButtonPressed() {
    emit(RepliesInitial());
  }

  void loadReplies({required Map<String, dynamic> payload}) {
    if (payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        payload['data'].map((e) => Post.fromJson(e)),
      );
      emit(RepliesLoaded(posts: posts));
    } else {
      emit(RepliesFailure());
    }
  }
}
