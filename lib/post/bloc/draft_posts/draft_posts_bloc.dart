import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/repository/database/database_repository.dart';
import 'package:democracy/app/shared/utils/transformers.dart';
import 'package:democracy/post/models/draft_post.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'draft_posts_bloc.freezed.dart';
part 'draft_posts_state.dart';
part 'draft_posts_event.dart';

const String stream = 'posts';
const String requestId = 'posts';
const String action = 'drafts';

class DraftPostsBloc extends Bloc<DraftPostsEvent, DraftPostsState> {
  DraftPostsBloc({required this.databaseRepository})
    : super(DraftPostsState()) {
    on<_Get>(
      (event, emit) async => await _onGet(event, emit),
      transformer: debounce(),
    );
    on<_Add>((event, emit) => _onAdd(event, emit));
    on<_Update>((event, emit) => _onUpdate(event, emit));
    on<_Remove>((event, emit) => _onRemove(event, emit));
  }

  Future _onGet(_Get event, Emitter<DraftPostsState> emit) async {
    emit(state.copyWith(status: DraftPostsStatus.loading));
    try {
      final drafts = await databaseRepository.fetchDrafts();
      emit(state.copyWith(status: DraftPostsStatus.success, drafts: drafts));
    } catch (e) {
      emit(state.copyWith(status: DraftPostsStatus.failure));
    }
  }

  void _onAdd(_Add event, Emitter<DraftPostsState> emit) {
    emit(state.copyWith(status: DraftPostsStatus.loading));
    emit(
      state.copyWith(
        drafts: [event.draft, ...state.drafts],
        status: DraftPostsStatus.success,
      ),
    );
  }

  void _onUpdate(_Update event, Emitter<DraftPostsState> emit) {
    emit(state.copyWith(status: DraftPostsStatus.loading));
    final exists = state.drafts.any((d) => d.id == event.draft.id);
    if (exists) {
      final index = state.drafts.indexWhere((d) => d.id == event.draft.id);
      if (index == -1) return;

      final updatedDrafts = List<DraftPost>.from(state.drafts);
      updatedDrafts[index] = event.draft;

      emit(
        state.copyWith(drafts: updatedDrafts, status: DraftPostsStatus.success),
      );
    } else {
      emit(
        state.copyWith(
          drafts: [event.draft, ...state.drafts],
          status: DraftPostsStatus.success,
        ),
      );
    }
  }

  void _onRemove(_Remove event, Emitter<DraftPostsState> emit) {
    emit(state.copyWith(status: DraftPostsStatus.loading));
    final updatedDrafts = state.drafts
        .where((draft) => draft.id != event.id)
        .toList();
    emit(
      state.copyWith(drafts: updatedDrafts, status: DraftPostsStatus.success),
    );
  }

  final DatabaseRepository databaseRepository;
}
