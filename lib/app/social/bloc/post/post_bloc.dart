import 'package:bloc/bloc.dart';
import 'package:democracy/app/social/models/post.dart';
import 'package:democracy/app/utils/bloc/transformers.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_bloc.freezed.dart';
part 'post_event.dart';
part 'post_provider.dart';
part 'post_repository.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required this.postRepository}) : super(const PostState()) {
    on<_Initialize>((event, emit) async {
      emit(PostState());
      add(GetPosts());
    });
    on<GetPosts>(
      (event, emit) async {
        await _getPosts(emit);
      },
      transformer: throttleDroppable(
        duration: const Duration(milliseconds: 100),
      ),
    );
    on<_Filter>((event, emit) async {
      await _onFilterPosts(emit, event);
    });
    on<_Reload>((event, emit) async {
      if (_previousEvent != null) {
        add(_previousEvent!);
      }
    });
  }

  PostEvent? _previousEvent;

  @override
  void onEvent(PostEvent event) {
    if (event is! _Reload) {
      _previousEvent = event;
    }
    super.onEvent(event);
  }

  Future _getPosts(Emitter<PostState> emit) async {
    if (state.next == null) return;
    // try {
      final data = await postRepository.getPosts(next: state.next);
      final List<Post> posts = List.from(
        data['results'].map((e) => Post.fromJson(e)),
      );
      emit(
        state.copyWith(
          status: PostStatus.success,
          posts: [...state.posts, ...posts],
          next: data['next'],
        ),
      );
    // } catch (e) {
    //   emit(state.copyWith(status: PostStatus.failure));
    // }
  }

  Future _onFilterPosts(Emitter<PostState> emit, _Filter event) async {
    emit(state.copyWith(status: PostStatus.loading));
    try {
      final data = await postRepository.getPosts(
        next: null,
        searchTerm: event.searchTerm,
      );
      final List<Post> posts = List.from(
        data['results'].map((e) => Post.fromJson(e)),
      );
      emit(
        state.copyWith(
          status: PostStatus.success,
          posts: posts,
          next: data['next'],
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }

  final PostRepository postRepository;
}
