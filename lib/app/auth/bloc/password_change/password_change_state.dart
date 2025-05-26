part of 'password_change_cubit.dart';

@freezed
abstract class PasswordChangeState with _$PasswordChangeState {
  const factory PasswordChangeState.initial() = PasswordChangeInitial;

  const factory PasswordChangeState.loading() = PasswordChangeLoading;

  const factory PasswordChangeState.changed() = PasswordChangeComplete;

  const factory PasswordChangeState.failure({required String error}) =
      PasswordChangeFailure;
}
