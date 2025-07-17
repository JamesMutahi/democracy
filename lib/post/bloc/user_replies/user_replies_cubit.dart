import 'package:bloc/bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_replies_state.dart';
part 'user_replies_cubit.freezed.dart';

class UserRepliesCubit extends Cubit<UserRepliesState> {
  UserRepliesCubit() : super(const UserRepliesState.initial());

  void loaded({required Map<String, dynamic> payload}) {
    emit(UserRepliesLoading());
    if (payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        payload['data'].map((e) => Post.fromJson(e)),
      );
      emit(UserRepliesLoaded(userId: payload['request_id'],posts: posts));
    } else {
      emit(UserRepliesFailure(userId: payload['request_id']));
    }
  }
}
