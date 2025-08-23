part of 'user_detail_cubit.dart';

@freezed
class UserDetailState with _$UserDetailState {
  const factory UserDetailState.initial() = _Initial;

  const factory UserDetailState.loading() = _Loading;

  const factory UserDetailState.loaded({required User user}) = UserLoaded;

  const factory UserDetailState.updated({required User user}) = UserUpdated;

  const factory UserDetailState.failure({required String error}) =
      UserDetailFailure;
}
