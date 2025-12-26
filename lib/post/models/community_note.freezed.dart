// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommunityNote {

 int get id; User get author; String get text;@JsonKey(name: 'is_helpful_votes') int get isHelpfulVotes;@JsonKey(name: 'is_not_helpful_votes') int get isNotHelpfulVotes;@JsonKey(name: 'helpful_score') int get helpfulScore;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of CommunityNote
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommunityNoteCopyWith<CommunityNote> get copyWith => _$CommunityNoteCopyWithImpl<CommunityNote>(this as CommunityNote, _$identity);

  /// Serializes this CommunityNote to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommunityNote&&(identical(other.id, id) || other.id == id)&&(identical(other.author, author) || other.author == author)&&(identical(other.text, text) || other.text == text)&&(identical(other.isHelpfulVotes, isHelpfulVotes) || other.isHelpfulVotes == isHelpfulVotes)&&(identical(other.isNotHelpfulVotes, isNotHelpfulVotes) || other.isNotHelpfulVotes == isNotHelpfulVotes)&&(identical(other.helpfulScore, helpfulScore) || other.helpfulScore == helpfulScore)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,author,text,isHelpfulVotes,isNotHelpfulVotes,helpfulScore,createdAt);

@override
String toString() {
  return 'CommunityNote(id: $id, author: $author, text: $text, isHelpfulVotes: $isHelpfulVotes, isNotHelpfulVotes: $isNotHelpfulVotes, helpfulScore: $helpfulScore, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CommunityNoteCopyWith<$Res>  {
  factory $CommunityNoteCopyWith(CommunityNote value, $Res Function(CommunityNote) _then) = _$CommunityNoteCopyWithImpl;
@useResult
$Res call({
 int id, User author, String text,@JsonKey(name: 'is_helpful_votes') int isHelpfulVotes,@JsonKey(name: 'is_not_helpful_votes') int isNotHelpfulVotes,@JsonKey(name: 'helpful_score') int helpfulScore,@JsonKey(name: 'created_at') DateTime createdAt
});


$UserCopyWith<$Res> get author;

}
/// @nodoc
class _$CommunityNoteCopyWithImpl<$Res>
    implements $CommunityNoteCopyWith<$Res> {
  _$CommunityNoteCopyWithImpl(this._self, this._then);

  final CommunityNote _self;
  final $Res Function(CommunityNote) _then;

/// Create a copy of CommunityNote
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? author = null,Object? text = null,Object? isHelpfulVotes = null,Object? isNotHelpfulVotes = null,Object? helpfulScore = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as User,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isHelpfulVotes: null == isHelpfulVotes ? _self.isHelpfulVotes : isHelpfulVotes // ignore: cast_nullable_to_non_nullable
as int,isNotHelpfulVotes: null == isNotHelpfulVotes ? _self.isNotHelpfulVotes : isNotHelpfulVotes // ignore: cast_nullable_to_non_nullable
as int,helpfulScore: null == helpfulScore ? _self.helpfulScore : helpfulScore // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of CommunityNote
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get author {
  
  return $UserCopyWith<$Res>(_self.author, (value) {
    return _then(_self.copyWith(author: value));
  });
}
}


/// Adds pattern-matching-related methods to [CommunityNote].
extension CommunityNotePatterns on CommunityNote {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommunityNote value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommunityNote() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommunityNote value)  $default,){
final _that = this;
switch (_that) {
case _CommunityNote():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommunityNote value)?  $default,){
final _that = this;
switch (_that) {
case _CommunityNote() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  User author,  String text, @JsonKey(name: 'is_helpful_votes')  int isHelpfulVotes, @JsonKey(name: 'is_not_helpful_votes')  int isNotHelpfulVotes, @JsonKey(name: 'helpful_score')  int helpfulScore, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommunityNote() when $default != null:
return $default(_that.id,_that.author,_that.text,_that.isHelpfulVotes,_that.isNotHelpfulVotes,_that.helpfulScore,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  User author,  String text, @JsonKey(name: 'is_helpful_votes')  int isHelpfulVotes, @JsonKey(name: 'is_not_helpful_votes')  int isNotHelpfulVotes, @JsonKey(name: 'helpful_score')  int helpfulScore, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _CommunityNote():
return $default(_that.id,_that.author,_that.text,_that.isHelpfulVotes,_that.isNotHelpfulVotes,_that.helpfulScore,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  User author,  String text, @JsonKey(name: 'is_helpful_votes')  int isHelpfulVotes, @JsonKey(name: 'is_not_helpful_votes')  int isNotHelpfulVotes, @JsonKey(name: 'helpful_score')  int helpfulScore, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CommunityNote() when $default != null:
return $default(_that.id,_that.author,_that.text,_that.isHelpfulVotes,_that.isNotHelpfulVotes,_that.helpfulScore,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommunityNote implements CommunityNote {
  const _CommunityNote({required this.id, required this.author, required this.text, @JsonKey(name: 'is_helpful_votes') required this.isHelpfulVotes, @JsonKey(name: 'is_not_helpful_votes') required this.isNotHelpfulVotes, @JsonKey(name: 'helpful_score') required this.helpfulScore, @JsonKey(name: 'created_at') required this.createdAt});
  factory _CommunityNote.fromJson(Map<String, dynamic> json) => _$CommunityNoteFromJson(json);

@override final  int id;
@override final  User author;
@override final  String text;
@override@JsonKey(name: 'is_helpful_votes') final  int isHelpfulVotes;
@override@JsonKey(name: 'is_not_helpful_votes') final  int isNotHelpfulVotes;
@override@JsonKey(name: 'helpful_score') final  int helpfulScore;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of CommunityNote
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommunityNoteCopyWith<_CommunityNote> get copyWith => __$CommunityNoteCopyWithImpl<_CommunityNote>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommunityNoteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommunityNote&&(identical(other.id, id) || other.id == id)&&(identical(other.author, author) || other.author == author)&&(identical(other.text, text) || other.text == text)&&(identical(other.isHelpfulVotes, isHelpfulVotes) || other.isHelpfulVotes == isHelpfulVotes)&&(identical(other.isNotHelpfulVotes, isNotHelpfulVotes) || other.isNotHelpfulVotes == isNotHelpfulVotes)&&(identical(other.helpfulScore, helpfulScore) || other.helpfulScore == helpfulScore)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,author,text,isHelpfulVotes,isNotHelpfulVotes,helpfulScore,createdAt);

@override
String toString() {
  return 'CommunityNote(id: $id, author: $author, text: $text, isHelpfulVotes: $isHelpfulVotes, isNotHelpfulVotes: $isNotHelpfulVotes, helpfulScore: $helpfulScore, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CommunityNoteCopyWith<$Res> implements $CommunityNoteCopyWith<$Res> {
  factory _$CommunityNoteCopyWith(_CommunityNote value, $Res Function(_CommunityNote) _then) = __$CommunityNoteCopyWithImpl;
@override @useResult
$Res call({
 int id, User author, String text,@JsonKey(name: 'is_helpful_votes') int isHelpfulVotes,@JsonKey(name: 'is_not_helpful_votes') int isNotHelpfulVotes,@JsonKey(name: 'helpful_score') int helpfulScore,@JsonKey(name: 'created_at') DateTime createdAt
});


@override $UserCopyWith<$Res> get author;

}
/// @nodoc
class __$CommunityNoteCopyWithImpl<$Res>
    implements _$CommunityNoteCopyWith<$Res> {
  __$CommunityNoteCopyWithImpl(this._self, this._then);

  final _CommunityNote _self;
  final $Res Function(_CommunityNote) _then;

/// Create a copy of CommunityNote
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? author = null,Object? text = null,Object? isHelpfulVotes = null,Object? isNotHelpfulVotes = null,Object? helpfulScore = null,Object? createdAt = null,}) {
  return _then(_CommunityNote(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as User,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isHelpfulVotes: null == isHelpfulVotes ? _self.isHelpfulVotes : isHelpfulVotes // ignore: cast_nullable_to_non_nullable
as int,isNotHelpfulVotes: null == isNotHelpfulVotes ? _self.isNotHelpfulVotes : isNotHelpfulVotes // ignore: cast_nullable_to_non_nullable
as int,helpfulScore: null == helpfulScore ? _self.helpfulScore : helpfulScore // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of CommunityNote
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
