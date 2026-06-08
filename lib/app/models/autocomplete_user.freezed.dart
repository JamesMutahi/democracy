// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'autocomplete_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AutocompleteUser {

 int get id; String get username; String get name; String get image;
/// Create a copy of AutocompleteUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AutocompleteUserCopyWith<AutocompleteUser> get copyWith => _$AutocompleteUserCopyWithImpl<AutocompleteUser>(this as AutocompleteUser, _$identity);

  /// Serializes this AutocompleteUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AutocompleteUser&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,name,image);

@override
String toString() {
  return 'AutocompleteUser(id: $id, username: $username, name: $name, image: $image)';
}


}

/// @nodoc
abstract mixin class $AutocompleteUserCopyWith<$Res>  {
  factory $AutocompleteUserCopyWith(AutocompleteUser value, $Res Function(AutocompleteUser) _then) = _$AutocompleteUserCopyWithImpl;
@useResult
$Res call({
 int id, String username, String name, String image
});




}
/// @nodoc
class _$AutocompleteUserCopyWithImpl<$Res>
    implements $AutocompleteUserCopyWith<$Res> {
  _$AutocompleteUserCopyWithImpl(this._self, this._then);

  final AutocompleteUser _self;
  final $Res Function(AutocompleteUser) _then;

/// Create a copy of AutocompleteUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? name = null,Object? image = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AutocompleteUser].
extension AutocompleteUserPatterns on AutocompleteUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AutocompleteUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AutocompleteUser() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AutocompleteUser value)  $default,){
final _that = this;
switch (_that) {
case _AutocompleteUser():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AutocompleteUser value)?  $default,){
final _that = this;
switch (_that) {
case _AutocompleteUser() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String username,  String name,  String image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AutocompleteUser() when $default != null:
return $default(_that.id,_that.username,_that.name,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String username,  String name,  String image)  $default,) {final _that = this;
switch (_that) {
case _AutocompleteUser():
return $default(_that.id,_that.username,_that.name,_that.image);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String username,  String name,  String image)?  $default,) {final _that = this;
switch (_that) {
case _AutocompleteUser() when $default != null:
return $default(_that.id,_that.username,_that.name,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AutocompleteUser implements AutocompleteUser {
  const _AutocompleteUser({required this.id, required this.username, required this.name, required this.image});
  factory _AutocompleteUser.fromJson(Map<String, dynamic> json) => _$AutocompleteUserFromJson(json);

@override final  int id;
@override final  String username;
@override final  String name;
@override final  String image;

/// Create a copy of AutocompleteUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AutocompleteUserCopyWith<_AutocompleteUser> get copyWith => __$AutocompleteUserCopyWithImpl<_AutocompleteUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AutocompleteUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AutocompleteUser&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,name,image);

@override
String toString() {
  return 'AutocompleteUser(id: $id, username: $username, name: $name, image: $image)';
}


}

/// @nodoc
abstract mixin class _$AutocompleteUserCopyWith<$Res> implements $AutocompleteUserCopyWith<$Res> {
  factory _$AutocompleteUserCopyWith(_AutocompleteUser value, $Res Function(_AutocompleteUser) _then) = __$AutocompleteUserCopyWithImpl;
@override @useResult
$Res call({
 int id, String username, String name, String image
});




}
/// @nodoc
class __$AutocompleteUserCopyWithImpl<$Res>
    implements _$AutocompleteUserCopyWith<$Res> {
  __$AutocompleteUserCopyWithImpl(this._self, this._then);

  final _AutocompleteUser _self;
  final $Res Function(_AutocompleteUser) _then;

/// Create a copy of AutocompleteUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? name = null,Object? image = null,}) {
  return _then(_AutocompleteUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
