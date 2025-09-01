// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'petition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Petition {

 int get id; User get author; String get title; String get description; String get image; String? get video; int get supporters;@JsonKey(name: 'recent_supporters') List<User> get recentSupporters;@JsonKey(name: 'is_supported') bool get isSupported;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'is_active') bool get isActive;
/// Create a copy of Petition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetitionCopyWith<Petition> get copyWith => _$PetitionCopyWithImpl<Petition>(this as Petition, _$identity);

  /// Serializes this Petition to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Petition&&(identical(other.id, id) || other.id == id)&&(identical(other.author, author) || other.author == author)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.video, video) || other.video == video)&&(identical(other.supporters, supporters) || other.supporters == supporters)&&const DeepCollectionEquality().equals(other.recentSupporters, recentSupporters)&&(identical(other.isSupported, isSupported) || other.isSupported == isSupported)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,author,title,description,image,video,supporters,const DeepCollectionEquality().hash(recentSupporters),isSupported,createdAt,isActive);

@override
String toString() {
  return 'Petition(id: $id, author: $author, title: $title, description: $description, image: $image, video: $video, supporters: $supporters, recentSupporters: $recentSupporters, isSupported: $isSupported, createdAt: $createdAt, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $PetitionCopyWith<$Res>  {
  factory $PetitionCopyWith(Petition value, $Res Function(Petition) _then) = _$PetitionCopyWithImpl;
@useResult
$Res call({
 int id, User author, String title, String description, String image, String? video, int supporters,@JsonKey(name: 'recent_supporters') List<User> recentSupporters,@JsonKey(name: 'is_supported') bool isSupported,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'is_active') bool isActive
});


$UserCopyWith<$Res> get author;

}
/// @nodoc
class _$PetitionCopyWithImpl<$Res>
    implements $PetitionCopyWith<$Res> {
  _$PetitionCopyWithImpl(this._self, this._then);

  final Petition _self;
  final $Res Function(Petition) _then;

/// Create a copy of Petition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? author = null,Object? title = null,Object? description = null,Object? image = null,Object? video = freezed,Object? supporters = null,Object? recentSupporters = null,Object? isSupported = null,Object? createdAt = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as User,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,video: freezed == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as String?,supporters: null == supporters ? _self.supporters : supporters // ignore: cast_nullable_to_non_nullable
as int,recentSupporters: null == recentSupporters ? _self.recentSupporters : recentSupporters // ignore: cast_nullable_to_non_nullable
as List<User>,isSupported: null == isSupported ? _self.isSupported : isSupported // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of Petition
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get author {
  
  return $UserCopyWith<$Res>(_self.author, (value) {
    return _then(_self.copyWith(author: value));
  });
}
}


/// Adds pattern-matching-related methods to [Petition].
extension PetitionPatterns on Petition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Petition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Petition() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Petition value)  $default,){
final _that = this;
switch (_that) {
case _Petition():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Petition value)?  $default,){
final _that = this;
switch (_that) {
case _Petition() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  User author,  String title,  String description,  String image,  String? video,  int supporters, @JsonKey(name: 'recent_supporters')  List<User> recentSupporters, @JsonKey(name: 'is_supported')  bool isSupported, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'is_active')  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Petition() when $default != null:
return $default(_that.id,_that.author,_that.title,_that.description,_that.image,_that.video,_that.supporters,_that.recentSupporters,_that.isSupported,_that.createdAt,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  User author,  String title,  String description,  String image,  String? video,  int supporters, @JsonKey(name: 'recent_supporters')  List<User> recentSupporters, @JsonKey(name: 'is_supported')  bool isSupported, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'is_active')  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _Petition():
return $default(_that.id,_that.author,_that.title,_that.description,_that.image,_that.video,_that.supporters,_that.recentSupporters,_that.isSupported,_that.createdAt,_that.isActive);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  User author,  String title,  String description,  String image,  String? video,  int supporters, @JsonKey(name: 'recent_supporters')  List<User> recentSupporters, @JsonKey(name: 'is_supported')  bool isSupported, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'is_active')  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _Petition() when $default != null:
return $default(_that.id,_that.author,_that.title,_that.description,_that.image,_that.video,_that.supporters,_that.recentSupporters,_that.isSupported,_that.createdAt,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Petition implements Petition {
  const _Petition({required this.id, required this.author, required this.title, required this.description, required this.image, required this.video, required this.supporters, @JsonKey(name: 'recent_supporters') required final  List<User> recentSupporters, @JsonKey(name: 'is_supported') required this.isSupported, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'is_active') required this.isActive}): _recentSupporters = recentSupporters;
  factory _Petition.fromJson(Map<String, dynamic> json) => _$PetitionFromJson(json);

@override final  int id;
@override final  User author;
@override final  String title;
@override final  String description;
@override final  String image;
@override final  String? video;
@override final  int supporters;
 final  List<User> _recentSupporters;
@override@JsonKey(name: 'recent_supporters') List<User> get recentSupporters {
  if (_recentSupporters is EqualUnmodifiableListView) return _recentSupporters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentSupporters);
}

@override@JsonKey(name: 'is_supported') final  bool isSupported;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'is_active') final  bool isActive;

/// Create a copy of Petition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PetitionCopyWith<_Petition> get copyWith => __$PetitionCopyWithImpl<_Petition>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PetitionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Petition&&(identical(other.id, id) || other.id == id)&&(identical(other.author, author) || other.author == author)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.video, video) || other.video == video)&&(identical(other.supporters, supporters) || other.supporters == supporters)&&const DeepCollectionEquality().equals(other._recentSupporters, _recentSupporters)&&(identical(other.isSupported, isSupported) || other.isSupported == isSupported)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,author,title,description,image,video,supporters,const DeepCollectionEquality().hash(_recentSupporters),isSupported,createdAt,isActive);

@override
String toString() {
  return 'Petition(id: $id, author: $author, title: $title, description: $description, image: $image, video: $video, supporters: $supporters, recentSupporters: $recentSupporters, isSupported: $isSupported, createdAt: $createdAt, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$PetitionCopyWith<$Res> implements $PetitionCopyWith<$Res> {
  factory _$PetitionCopyWith(_Petition value, $Res Function(_Petition) _then) = __$PetitionCopyWithImpl;
@override @useResult
$Res call({
 int id, User author, String title, String description, String image, String? video, int supporters,@JsonKey(name: 'recent_supporters') List<User> recentSupporters,@JsonKey(name: 'is_supported') bool isSupported,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'is_active') bool isActive
});


@override $UserCopyWith<$Res> get author;

}
/// @nodoc
class __$PetitionCopyWithImpl<$Res>
    implements _$PetitionCopyWith<$Res> {
  __$PetitionCopyWithImpl(this._self, this._then);

  final _Petition _self;
  final $Res Function(_Petition) _then;

/// Create a copy of Petition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? author = null,Object? title = null,Object? description = null,Object? image = null,Object? video = freezed,Object? supporters = null,Object? recentSupporters = null,Object? isSupported = null,Object? createdAt = null,Object? isActive = null,}) {
  return _then(_Petition(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as User,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,video: freezed == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as String?,supporters: null == supporters ? _self.supporters : supporters // ignore: cast_nullable_to_non_nullable
as int,recentSupporters: null == recentSupporters ? _self._recentSupporters : recentSupporters // ignore: cast_nullable_to_non_nullable
as List<User>,isSupported: null == isSupported ? _self.isSupported : isSupported // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of Petition
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get author {
  
  return $UserCopyWith<$Res>(_self.author, (value) {
    return _then(_self.copyWith(author: value));
  });
}
}

// dart format on
