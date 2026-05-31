part of 'section_bloc.dart';

enum SectionStatus { initial, loading, success, failure }

final class SectionState extends Equatable {
  const SectionState({
    this.status = SectionStatus.initial,
    this.section,
    this.sectionId,
  });

  final SectionStatus status;
  final Section? section;
  final int? sectionId;

  SectionState copyWith({
    SectionStatus? status,
    Section? section,
    int? sectionId,
  }) {
    return SectionState(
      status: status ?? this.status,
      section: section ?? this.section,
      sectionId: sectionId ?? this.sectionId,
    );
  }

  @override
  String toString() {
    return '''SectionState { status: $status, section: $section, sectionId: $sectionId }''';
  }

  @override
  List<Object?> get props => [status, section, sectionId];
}
