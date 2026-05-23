part of 'profile_bloc.dart';

enum ProfileStatus { initial, loading, success, failure }

final class ProfileState extends Equatable {
  const ProfileState({
    this.status = ProfileStatus.initial,
    this.user,
    this.userId,
  });

  final ProfileStatus status;
  final User? user;
  final int? userId;

  ProfileState copyWith({ProfileStatus? status, User? user, int? userId}) {
    return ProfileState(
      status: status ?? this.status,
      user: user ?? this.user,
      userId: userId ?? this.userId,
    );
  }

  @override
  String toString() {
    return '''ProfileState { status: $status, user: $user, userId: $userId }''';
  }

  @override
  List<Object?> get props => [status, user, userId];
}
