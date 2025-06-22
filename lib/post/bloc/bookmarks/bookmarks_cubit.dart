import 'package:bloc/bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmarks_state.dart';
part 'bookmarks_cubit.freezed.dart';

class BookmarksCubit extends Cubit<BookmarksState> {
  BookmarksCubit() : super(const BookmarksState.initial());

  void websocketFailure({required String error}) {
    if (state is BookmarksInitial || state is BookmarksLoading) {
      emit(BookmarksFailure());
    }
  }

  void retryButtonPressed() {
    emit(BookmarksInitial());
  }

  void loaded({required Map<String, dynamic> payload}) {
    emit(BookmarksLoading());
    if (payload['response_status'] == 200) {
      final List<Post> posts = List.from(
        payload['data'].map((e) => Post.fromJson(e)),
      );
      emit(BookmarksLoaded(posts: posts));
    } else {
      emit(BookmarksFailure());
    }
  }
}
