part of 'login_cubit.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitial;
  const factory LoginState.loading() = LoginLoading;
  const factory LoginState.loggedIn() = LoggedIn;
  const factory LoginState.loggedOut() = LoggedOut;
  const factory LoginState.failure({required String error}) = LoginFailure;
}
