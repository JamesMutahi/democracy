import 'package:bloc/bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:equatable/equatable.dart';

part 'for_you_state.dart';

class ForYouCubit extends Cubit<ForYouState> {
  ForYouCubit() : super(const ForYouState());

  void websocketFailure({required String error}) {
    if (state.status == ForYouStatus.initial ||
        state.status == ForYouStatus.loading) {
      emit(state.copyWith(status: ForYouStatus.failure));
    }
  }

  void loaded({required Map<String, dynamic> payload}) {
    if (payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      emit(
        state.copyWith(
          status: ForYouStatus.success,
          posts: [...state.posts, ...posts],
          currentPage: payload['data']['current_page'],
          hasNext: payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: ForYouStatus.failure));
    }
  }
}
