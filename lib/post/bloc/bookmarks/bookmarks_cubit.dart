import 'package:bloc/bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:equatable/equatable.dart';

part 'bookmarks_state.dart';

class BookmarksCubit extends Cubit<BookmarksState> {
  BookmarksCubit() : super(const BookmarksState());

  void websocketFailure({required String error}) {
    if (state.status == BookmarksStatus.initial ||
        state.status == BookmarksStatus.loading) {
      emit(state.copyWith(status: BookmarksStatus.failure));
    }
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(state.copyWith(status: BookmarksStatus.loading));
    if (payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        payload['data']['results'].map((e) => Post.fromJson(e)),
      );
      int? lastPost = payload['data']['last_post'];
      emit(
        state.copyWith(
          status: BookmarksStatus.success,
          posts: lastPost == null ? posts : [...state.posts, ...posts],
          hasNext: payload['data']['has_next'],
        ),
      );
    } else {
      emit(state.copyWith(status: BookmarksStatus.failure));
    }
  }
}
