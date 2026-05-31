part of 'petition_bloc.dart';

enum PetitionStatus { initial, loading, success, failure }

final class PetitionState extends Equatable {
  const PetitionState({
    this.status = PetitionStatus.initial,
    this.petition,
    this.petitionId,
  });

  final PetitionStatus status;
  final Petition? petition;
  final int? petitionId;

  PetitionState copyWith({
    PetitionStatus? status,
    Petition? petition,
    int? petitionId,
  }) {
    return PetitionState(
      status: status ?? this.status,
      petition: petition ?? this.petition,
      petitionId: petitionId ?? this.petitionId,
    );
  }

  @override
  String toString() {
    return '''PetitionState { status: $status, petition: $petition, petitionId: $petitionId }''';
  }

  @override
  List<Object?> get props => [status, petition, petitionId];
}
