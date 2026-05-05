part of 'profile_bloc.dart';

enum ProfileStatus { initial, loading, success, failure }

final class ProfileState extends Equatable {
  const ProfileState({this.status = ProfileStatus.initial, this.user});

  final ProfileStatus status;
  final User? user;

  ProfileState copyWith({ProfileStatus? status, User? user}) {
    return ProfileState(status: status ?? this.status, user: user ?? this.user);
  }

  @override
  String toString() {
    return '''ProfileState { status: $status, user: $user }''';
  }

  @override
  List<Object> get props => [status, ?user];
}
