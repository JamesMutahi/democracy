part of 'users_cubit.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState.initial() = UsersInitial;
  const factory UsersState.loading() = UsersLoading;
  const factory UsersState.loaded({required List<User> users}) = UsersLoaded;
  const factory UsersState.failure({required String error}) = UsersFailure;
}
