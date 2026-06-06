import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/repository/database/database_repository.dart';
import 'package:democracy/post/models/draft_post.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'draft_event.dart';
part 'draft_state.dart';
part 'draft_bloc.freezed.dart';

class DraftBloc extends Bloc<DraftEvent, DraftState> {
  DraftBloc({required this.databaseRepository}) : super(const DraftState()) {
    on<_Load>((event, emit) => _onLoad(event, emit));
    on<_Updated>((event, emit) => _onUpdated(event, emit));
  }

  void _onLoad(_Load event, Emitter<DraftState> emit) async {
    emit(state.copyWith(status: DraftStatus.loading, draftId: event.draftId));
    try {
      DraftPost? draft = await databaseRepository.getDraft(id: event.draftId);
      if (draft == null) {
        emit(state.copyWith(status: DraftStatus.notFound));
      } else {
        emit(
          state.copyWith(
            status: DraftStatus.success,
            draft: draft,
            draftId: event.draftId,
          ),
        );
      }
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: DraftStatus.failure));
    }
  }

  void _onUpdated(_Updated event, Emitter<DraftState> emit) async {
    emit(state.copyWith(status: DraftStatus.loading));
    emit(
      state.copyWith(
        status: DraftStatus.success,
        draft: event.draft,
        draftId: event.draft.key,
      ),
    );
  }

  final DatabaseRepository databaseRepository;
}
