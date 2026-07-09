// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'simple_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SimpleUser {

 int get id; String get username; String get name; String get image;
/// Create a copy of SimpleUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SimpleUserCopyWith<SimpleUser> get copyWith => _$SimpleUserCopyWithImpl<SimpleUser>(this as SimpleUser, _$identity);

  /// Serializes this SimpleUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SimpleUser&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,name,image);

@override
String toString() {
  return 'SimpleUser(id: $id, username: $username, name: $name, image: $image)';
}


}

/// @nodoc
abstract mixin class $SimpleUserCopyWith<$Res>  {
  factory $SimpleUserCopyWith(SimpleUser value, $Res Function(SimpleUser) _then) = _$SimpleUserCopyWithImpl;
@useResult
$Res call({
 int id, String username, String name, String image
});




}
/// @nodoc
class _$SimpleUserCopyWithImpl<$Res>
    implements $SimpleUserCopyWith<$Res> {
  _$SimpleUserCopyWithImpl(this._self, this._then);

  final SimpleUser _self;
  final $Res Function(SimpleUser) _then;

/// Create a copy of SimpleUser
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


/// Adds pattern-matching-related methods to [SimpleUser].
extension SimpleUserPatterns on SimpleUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SimpleUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SimpleUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SimpleUser value)  $default,){
final _that = this;
switch (_that) {
case _SimpleUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SimpleUser value)?  $default,){
final _that = this;
switch (_that) {
case _SimpleUser() when $default != null:
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
case _SimpleUser() when $default != null:
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
case _SimpleUser():
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
case _SimpleUser() when $default != null:
return $default(_that.id,_that.username,_that.name,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SimpleUser implements SimpleUser {
  const _SimpleUser({required this.id, required this.username, required this.name, required this.image});
  factory _SimpleUser.fromJson(Map<String, dynamic> json) => _$SimpleUserFromJson(json);

@override final  int id;
@override final  String username;
@override final  String name;
@override final  String image;

/// Create a copy of SimpleUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SimpleUserCopyWith<_SimpleUser> get copyWith => __$SimpleUserCopyWithImpl<_SimpleUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SimpleUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SimpleUser&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,name,image);

@override
String toString() {
  return 'SimpleUser(id: $id, username: $username, name: $name, image: $image)';
}


}

/// @nodoc
abstract mixin class _$SimpleUserCopyWith<$Res> implements $SimpleUserCopyWith<$Res> {
  factory _$SimpleUserCopyWith(_SimpleUser value, $Res Function(_SimpleUser) _then) = __$SimpleUserCopyWithImpl;
@override @useResult
$Res call({
 int id, String username, String name, String image
});




}
/// @nodoc
class __$SimpleUserCopyWithImpl<$Res>
    implements _$SimpleUserCopyWith<$Res> {
  __$SimpleUserCopyWithImpl(this._self, this._then);

  final _SimpleUser _self;
  final $Res Function(_SimpleUser) _then;

/// Create a copy of SimpleUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? name = null,Object? image = null,}) {
  return _then(_SimpleUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
