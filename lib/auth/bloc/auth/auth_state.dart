part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.unAuthenticated() = Unauthenticated;
  const factory AuthState.authenticating() = Authenticating;
  const factory AuthState.authenticated({required User user}) = Authenticated;
}
