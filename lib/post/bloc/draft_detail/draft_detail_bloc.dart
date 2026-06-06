import 'package:bloc/bloc.dart';
import 'package:democracy/app/bloc/repository/database/database_repository.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/models/draft_post.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'draft_detail_event.dart';
part 'draft_detail_state.dart';
part 'draft_detail_bloc.freezed.dart';

class DraftDetailBloc extends Bloc<DraftDetailEvent, DraftDetailState> {
  DraftDetailBloc({required this.databaseRepository})
    : super(const DraftDetailState.initial()) {
    on<_Create>((event, emit) async => await _onCreate(event, emit));
    on<_Update>((event, emit) async => await _onUpdate(event, emit));
    on<_Delete>((event, emit) async => await _onDelete(event, emit));
  }

  Future _onCreate(_Create event, Emitter<DraftDetailState> emit) async {
    emit(_Loading());
    try {
      final drafted = DraftPost()
        ..body = event.body
        ..replyTo = event.replyTo
        ..repostOf = event.repostOf
        ..ballot = event.ballot
        ..survey = event.survey
        ..petition = event.petition
        ..meeting = event.meeting
        ..section = event.section
        ..tags = event.tags
        ..filePaths = event.filePaths
        ..location = event.location
        ..updatedAt = DateTime.now();
      final id = await databaseRepository.createDraft(draft: drafted);
      final draft = await databaseRepository.getDraft(id: id);
      emit(DraftSaved(draft: draft!));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(DraftDetailFailure(error: error.toString()));
    }
  }

  Future _onUpdate(_Update event, Emitter<DraftDetailState> emit) async {
    emit(_Loading());
    try {
      await databaseRepository.updateDraft(draft: event.draft);
      emit(DraftSaved(draft: event.draft));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(DraftDetailFailure(error: error.toString()));
    }
  }

  Future _onDelete(_Delete event, Emitter<DraftDetailState> emit) async {
    emit(_Loading());
    try {
      await databaseRepository.deleteDraft(draft: event.draft);
      emit(DraftDeleted(draft: event.draft));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(DraftDetailFailure(error: error.toString()));
    }
  }

  final DatabaseRepository databaseRepository;
}
