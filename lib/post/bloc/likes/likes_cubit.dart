import 'package:bloc/bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'likes_state.dart';
part 'likes_cubit.freezed.dart';

class LikesCubit extends Cubit<LikesState> {
  LikesCubit() : super(const LikesState.initial());

  void loaded({required Map<String, dynamic> payload}) {
    emit(LikesLoading());
    if (payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        payload['data'].map((e) => Post.fromJson(e)),
      );
      emit(LikesLoaded(userId: payload['request_id'], posts: posts));
    } else {
      emit(LikesFailure(userId: payload['request_id']));
    }
  }
}
