part of 'petitions_bloc.dart';

enum PetitionsStatus { initial, loading, success, failure }

final class PetitionsState extends Equatable {
  const PetitionsState({
    this.status = PetitionsStatus.initial,
    this.searchTerm = '',
    this.petitions = const [],
    this.hasNext = false,
  });

  final PetitionsStatus status;
  final String searchTerm;
  final List<Petition> petitions;
  final bool hasNext;

  PetitionsState copyWith({
    PetitionsStatus? status,
    String? searchTerm,
    List<Petition>? petitions,
    bool? hasNext,
  }) {
    return PetitionsState(
      status: status ?? this.status,
      searchTerm: searchTerm ?? this.searchTerm,
      petitions: petitions ?? this.petitions,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''PetitionsState { status: $status, searchTerm: $searchTerm, petitions: ${petitions.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, petitions];
}
