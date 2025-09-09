part of 'forms_search_and_filter_cubit.dart';

enum FormsSearchAndFilterStatus { onSurveys, onPetitions }

final class FormsSearchAndFilterState extends Equatable {
  const FormsSearchAndFilterState({
    this.status = FormsSearchAndFilterStatus.onSurveys,
    this.surveysSearchTerm = '',
    this.petitionsSearchTerm = '',
  });

  final FormsSearchAndFilterStatus status;
  final String surveysSearchTerm;
  final String petitionsSearchTerm;

  FormsSearchAndFilterState copyWith({
    FormsSearchAndFilterStatus? status,
    String? surveysSearchTerm,
    String? petitionsSearchTerm,
  }) {
    return FormsSearchAndFilterState(
      status: status ?? this.status,
      surveysSearchTerm: surveysSearchTerm ?? this.surveysSearchTerm,
      petitionsSearchTerm: petitionsSearchTerm ?? this.petitionsSearchTerm,
    );
  }

  @override
  String toString() {
    return '''FormsSearchAndFilterState { status: $status, surveysSearchTerm: $surveysSearchTerm, petitionsSearchTerm: $petitionsSearchTerm }''';
  }

  @override
  List<Object> get props => [status, surveysSearchTerm, petitionsSearchTerm];
}
