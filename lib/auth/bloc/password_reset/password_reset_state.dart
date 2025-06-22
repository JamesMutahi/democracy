part of 'password_reset_cubit.dart';

@freezed
abstract class PasswordResetState with _$PasswordResetState {
  const factory PasswordResetState.initial() = PasswordResetInitial;

  const factory PasswordResetState.loading() = PasswordResetLoading;

  const factory PasswordResetState.emailVerified({required String email}) =
      PasswordResetEmailVerified;

  const factory PasswordResetState.codeVerified() = PasswordResetCodeVerified;

  const factory PasswordResetState.resetComplete() = PasswordResetComplete;

  const factory PasswordResetState.failure({required String error}) =
      PasswordResetFailure;
}
