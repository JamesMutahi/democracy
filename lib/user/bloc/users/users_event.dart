part of 'users_bloc.dart';

@freezed
sealed class UsersEvent with _$UsersEvent {
  const factory UsersEvent.get({String? searchTerm, User? lastUser}) = _Get;
  const factory UsersEvent.received({required Map<String, dynamic> payload}) =
      _Received;
  const factory UsersEvent.resubscribe({required List<User> users}) =
      _Resubscribe;
  const factory UsersEvent.unsubscribe({required List<User> users}) =
      _Unsubscribe;
}
