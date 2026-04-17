part of 'auth_bloc.dart';

enum AuthStatus { unAuthenticated, authenticating, authenticated, failure }

final class AuthState extends Equatable {
  const AuthState({
    this.status = AuthStatus.unAuthenticated,
    this.user,
    this.error = '',
  });

  final AuthStatus status;
  final User? user;
  final String error;

  AuthState copyWith({AuthStatus? status, User? user, String? error}) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return '''AuthState { status: $status, user: $user, error: $error }''';
  }

  @override
  List<Object> get props => [status, ?user];
}
