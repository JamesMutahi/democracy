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

part 'draft_post_event.dart';
part 'draft_post_state.dart';
part 'draft_post_bloc.freezed.dart';

class DraftPostBloc extends Bloc<DraftPostEvent, DraftPostState> {
  DraftPostBloc({required this.databaseRepository})
    : super(const DraftPostState.initial()) {
    on<_Save>((event, emit) async => await _onSave(event, emit));
    on<_Delete>((event, emit) async => await _onDelete(event, emit));
  }

  Future _onSave(_Save event, Emitter<DraftPostState> emit) async {
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
      final id = await databaseRepository.saveDraft(draft: drafted);
      final draft = await databaseRepository.getDraft(id: id);
      emit(DraftPostSaved(draft: draft));
    } catch (e) {
      emit(DraftPostFailure(error: e.toString()));
    }
  }

  Future _onDelete(_Delete event, Emitter<DraftPostState> emit) async {
    emit(_Loading());
    try {
      await databaseRepository.deleteDraft(draft: event.draft);
      emit(DraftPostDeleted(draft: event.draft));
    } catch (e) {
      emit(DraftPostFailure(error: e.toString()));
    }
  }

  final DatabaseRepository databaseRepository;
}
