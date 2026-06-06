part of 'draft_bloc.dart';

enum DraftStatus { initial, loading, success, notFound, failure }

final class DraftState extends Equatable {
  const DraftState({
    this.status = DraftStatus.initial,
    this.draft,
    this.draftId,
  });

  final DraftStatus status;
  final DraftPost? draft;
  final int? draftId;

  DraftState copyWith({DraftStatus? status, DraftPost? draft, int? draftId}) {
    return DraftState(
      status: status ?? this.status,
      draft: draft ?? this.draft,
      draftId: draftId ?? this.draftId,
    );
  }

  @override
  String toString() {
    return '''DraftState { status: $status, draft: $draft, draftId: $draftId }''';
  }

  @override
  List<Object?> get props => [status, draft, draftId];
}
