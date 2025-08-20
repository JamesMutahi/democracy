part of 'petitions_cubit.dart';

enum PetitionsStatus { initial, loading, success, failure }

final class PetitionsState extends Equatable {
  const PetitionsState({
    this.status = PetitionsStatus.initial,
    this.petitions = const [],
    this.hasNext = false,
  });

  final PetitionsStatus status;
  final List<Petition> petitions;
  final bool hasNext;

  PetitionsState copyWith({
    PetitionsStatus? status,
    List<Petition>? petitions,
    bool? hasNext,
  }) {
    return PetitionsState(
      status: status ?? this.status,
      petitions: petitions ?? this.petitions,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''PetitionsState { status: $status, petitions: ${petitions.length}, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, petitions];
}
