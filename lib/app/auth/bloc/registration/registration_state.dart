part of 'registration_cubit.dart';

@freezed
abstract class RegistrationState with _$RegistrationState {
  const factory RegistrationState.initial() = RegistrationInitial;
  const factory RegistrationState.loading() = RegistrationLoading;
  const factory RegistrationState.unverified() = RegistrationUnverified;
  const factory RegistrationState.verified() = RegistrationVerified;
  const factory RegistrationState.failure({required String error}) =
      RegistrationFailure;
}
