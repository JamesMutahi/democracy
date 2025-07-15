// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_users_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchUsersState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchUsersState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchUsersState()';
}


}

/// @nodoc
class $SearchUsersStateCopyWith<$Res>  {
$SearchUsersStateCopyWith(SearchUsersState _, $Res Function(SearchUsersState) __);
}


/// Adds pattern-matching-related methods to [SearchUsersState].
extension SearchUsersStatePatterns on SearchUsersState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SearchUsersInitial value)?  initial,TResult Function( SearchUsersLoading value)?  loading,TResult Function( SearchUsersLoaded value)?  loaded,TResult Function( SearchUsersFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SearchUsersInitial() when initial != null:
return initial(_that);case SearchUsersLoading() when loading != null:
return loading(_that);case SearchUsersLoaded() when loaded != null:
return loaded(_that);case SearchUsersFailure() when failure != null:
return failure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SearchUsersInitial value)  initial,required TResult Function( SearchUsersLoading value)  loading,required TResult Function( SearchUsersLoaded value)  loaded,required TResult Function( SearchUsersFailure value)  failure,}){
final _that = this;
switch (_that) {
case SearchUsersInitial():
return initial(_that);case SearchUsersLoading():
return loading(_that);case SearchUsersLoaded():
return loaded(_that);case SearchUsersFailure():
return failure(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SearchUsersInitial value)?  initial,TResult? Function( SearchUsersLoading value)?  loading,TResult? Function( SearchUsersLoaded value)?  loaded,TResult? Function( SearchUsersFailure value)?  failure,}){
final _that = this;
switch (_that) {
case SearchUsersInitial() when initial != null:
return initial(_that);case SearchUsersLoading() when loading != null:
return loading(_that);case SearchUsersLoaded() when loaded != null:
return loaded(_that);case SearchUsersFailure() when failure != null:
return failure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<User> users)?  loaded,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SearchUsersInitial() when initial != null:
return initial();case SearchUsersLoading() when loading != null:
return loading();case SearchUsersLoaded() when loaded != null:
return loaded(_that.users);case SearchUsersFailure() when failure != null:
return failure(_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<User> users)  loaded,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case SearchUsersInitial():
return initial();case SearchUsersLoading():
return loading();case SearchUsersLoaded():
return loaded(_that.users);case SearchUsersFailure():
return failure(_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<User> users)?  loaded,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case SearchUsersInitial() when initial != null:
return initial();case SearchUsersLoading() when loading != null:
return loading();case SearchUsersLoaded() when loaded != null:
return loaded(_that.users);case SearchUsersFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class SearchUsersInitial implements SearchUsersState {
  const SearchUsersInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchUsersInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchUsersState.initial()';
}


}




/// @nodoc


class SearchUsersLoading implements SearchUsersState {
  const SearchUsersLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchUsersLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchUsersState.loading()';
}


}




/// @nodoc


class SearchUsersLoaded implements SearchUsersState {
  const SearchUsersLoaded({required final  List<User> users}): _users = users;
  

 final  List<User> _users;
 List<User> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}


/// Create a copy of SearchUsersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchUsersLoadedCopyWith<SearchUsersLoaded> get copyWith => _$SearchUsersLoadedCopyWithImpl<SearchUsersLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchUsersLoaded&&const DeepCollectionEquality().equals(other._users, _users));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users));

@override
String toString() {
  return 'SearchUsersState.loaded(users: $users)';
}


}

/// @nodoc
abstract mixin class $SearchUsersLoadedCopyWith<$Res> implements $SearchUsersStateCopyWith<$Res> {
  factory $SearchUsersLoadedCopyWith(SearchUsersLoaded value, $Res Function(SearchUsersLoaded) _then) = _$SearchUsersLoadedCopyWithImpl;
@useResult
$Res call({
 List<User> users
});




}
/// @nodoc
class _$SearchUsersLoadedCopyWithImpl<$Res>
    implements $SearchUsersLoadedCopyWith<$Res> {
  _$SearchUsersLoadedCopyWithImpl(this._self, this._then);

  final SearchUsersLoaded _self;
  final $Res Function(SearchUsersLoaded) _then;

/// Create a copy of SearchUsersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? users = null,}) {
  return _then(SearchUsersLoaded(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<User>,
  ));
}


}

/// @nodoc


class SearchUsersFailure implements SearchUsersState {
  const SearchUsersFailure({required this.error});
  

 final  String error;

/// Create a copy of SearchUsersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchUsersFailureCopyWith<SearchUsersFailure> get copyWith => _$SearchUsersFailureCopyWithImpl<SearchUsersFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchUsersFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SearchUsersState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $SearchUsersFailureCopyWith<$Res> implements $SearchUsersStateCopyWith<$Res> {
  factory $SearchUsersFailureCopyWith(SearchUsersFailure value, $Res Function(SearchUsersFailure) _then) = _$SearchUsersFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$SearchUsersFailureCopyWithImpl<$Res>
    implements $SearchUsersFailureCopyWith<$Res> {
  _$SearchUsersFailureCopyWithImpl(this._self, this._then);

  final SearchUsersFailure _self;
  final $Res Function(SearchUsersFailure) _then;

/// Create a copy of SearchUsersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(SearchUsersFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
