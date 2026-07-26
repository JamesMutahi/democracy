part of 'profile_bloc.dart';

enum ProfileStatus { initial, loading, success, failure }

final class ProfileState extends Equatable {
  const ProfileState({
    this.status = ProfileStatus.initial,
    this.user,
    this.username,
  });

  final ProfileStatus status;
  final User? user;
  final String? username;

  ProfileState copyWith({ProfileStatus? status, User? user, String? username}) {
    return ProfileState(
      status: status ?? this.status,
      user: user ?? this.user,
      username: username ?? this.username,
    );
  }

  @override
  String toString() {
    return '''ProfileState { status: $status, user: $user, username: $username }''';
  }

  @override
  List<Object?> get props => [status, user, username];
}
