part of 'user_petitions_bloc.dart';

enum UserPetitionsStatus { initial, loading, success, failure }

final class UserPetitionsState extends Equatable {
  const UserPetitionsState({
    this.status = UserPetitionsStatus.initial,
    this.petitions = const [],
    this.userId,
    this.hasNext = false,
  });

  final UserPetitionsStatus status;
  final List<Petition> petitions;
  final int? userId;
  final bool hasNext;

  UserPetitionsState copyWith({
    UserPetitionsStatus? status,
    List<Petition>? petitions,
    int? userId,
    bool? hasNext,
  }) {
    return UserPetitionsState(
      status: status ?? this.status,
      petitions: petitions ?? this.petitions,
      userId: userId ?? this.userId,
      hasNext: hasNext ?? this.hasNext,
    );
  }

  @override
  String toString() {
    return '''UserPetitionsState { status: $status, petitions: ${petitions.length}, userId: $userId, hasNext: $hasNext }''';
  }

  @override
  List<Object> get props => [status, petitions];
}
