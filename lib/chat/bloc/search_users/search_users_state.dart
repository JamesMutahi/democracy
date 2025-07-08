part of 'search_users_cubit.dart';

@freezed
class SearchUsersState with _$SearchUsersState {
  const factory SearchUsersState.initial() = SearchUsersInitial;
  const factory SearchUsersState.loading() = SearchUsersLoading;
  const factory SearchUsersState.loaded({required List<User> users}) =
      SearchUsersLoaded;
  const factory SearchUsersState.failure({required String error}) =
      SearchUsersFailure;
}
