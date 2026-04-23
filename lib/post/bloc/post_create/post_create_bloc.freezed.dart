// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_create_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostCreateEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostCreateEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostCreateEvent()';
}


}

/// @nodoc
class $PostCreateEventCopyWith<$Res>  {
$PostCreateEventCopyWith(PostCreateEvent _, $Res Function(PostCreateEvent) __);
}


/// Adds pattern-matching-related methods to [PostCreateEvent].
extension PostCreateEventPatterns on PostCreateEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Create value)?  create,TResult Function( _UploadAssets value)?  uploadAssets,TResult Function( _Retry value)?  retry,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that);case _UploadAssets() when uploadAssets != null:
return uploadAssets(_that);case _Retry() when retry != null:
return retry(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Create value)  create,required TResult Function( _UploadAssets value)  uploadAssets,required TResult Function( _Retry value)  retry,}){
final _that = this;
switch (_that) {
case _Create():
return create(_that);case _UploadAssets():
return uploadAssets(_that);case _Retry():
return retry(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Create value)?  create,TResult? Function( _UploadAssets value)?  uploadAssets,TResult? Function( _Retry value)?  retry,}){
final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that);case _UploadAssets() when uploadAssets != null:
return uploadAssets(_that);case _Retry() when retry != null:
return retry(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String body,  PostStatus status,  Post? repostOf,  Post? replyTo,  Post? communityNoteOf,  Ballot? ballot,  Survey? survey,  Petition? petition,  Meeting? meeting,  Section? section,  List<Map<String, dynamic>> tags,  List<String> filePaths,  LatLng? location)?  create,TResult Function( List<dynamic> uploads)?  uploadAssets,TResult Function()?  retry,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that.body,_that.status,_that.repostOf,_that.replyTo,_that.communityNoteOf,_that.ballot,_that.survey,_that.petition,_that.meeting,_that.section,_that.tags,_that.filePaths,_that.location);case _UploadAssets() when uploadAssets != null:
return uploadAssets(_that.uploads);case _Retry() when retry != null:
return retry();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String body,  PostStatus status,  Post? repostOf,  Post? replyTo,  Post? communityNoteOf,  Ballot? ballot,  Survey? survey,  Petition? petition,  Meeting? meeting,  Section? section,  List<Map<String, dynamic>> tags,  List<String> filePaths,  LatLng? location)  create,required TResult Function( List<dynamic> uploads)  uploadAssets,required TResult Function()  retry,}) {final _that = this;
switch (_that) {
case _Create():
return create(_that.body,_that.status,_that.repostOf,_that.replyTo,_that.communityNoteOf,_that.ballot,_that.survey,_that.petition,_that.meeting,_that.section,_that.tags,_that.filePaths,_that.location);case _UploadAssets():
return uploadAssets(_that.uploads);case _Retry():
return retry();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String body,  PostStatus status,  Post? repostOf,  Post? replyTo,  Post? communityNoteOf,  Ballot? ballot,  Survey? survey,  Petition? petition,  Meeting? meeting,  Section? section,  List<Map<String, dynamic>> tags,  List<String> filePaths,  LatLng? location)?  create,TResult? Function( List<dynamic> uploads)?  uploadAssets,TResult? Function()?  retry,}) {final _that = this;
switch (_that) {
case _Create() when create != null:
return create(_that.body,_that.status,_that.repostOf,_that.replyTo,_that.communityNoteOf,_that.ballot,_that.survey,_that.petition,_that.meeting,_that.section,_that.tags,_that.filePaths,_that.location);case _UploadAssets() when uploadAssets != null:
return uploadAssets(_that.uploads);case _Retry() when retry != null:
return retry();case _:
  return null;

}
}

}

/// @nodoc


class _Create implements PostCreateEvent {
  const _Create({required this.body, required this.status, this.repostOf, this.replyTo, this.communityNoteOf, this.ballot, this.survey, this.petition, this.meeting, this.section, final  List<Map<String, dynamic>> tags = const [], final  List<String> filePaths = const [], this.location}): _tags = tags,_filePaths = filePaths;
  

 final  String body;
 final  PostStatus status;
 final  Post? repostOf;
 final  Post? replyTo;
 final  Post? communityNoteOf;
 final  Ballot? ballot;
 final  Survey? survey;
 final  Petition? petition;
 final  Meeting? meeting;
 final  Section? section;
 final  List<Map<String, dynamic>> _tags;
@JsonKey() List<Map<String, dynamic>> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<String> _filePaths;
@JsonKey() List<String> get filePaths {
  if (_filePaths is EqualUnmodifiableListView) return _filePaths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filePaths);
}

 final  LatLng? location;

/// Create a copy of PostCreateEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCopyWith<_Create> get copyWith => __$CreateCopyWithImpl<_Create>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Create&&(identical(other.body, body) || other.body == body)&&(identical(other.status, status) || other.status == status)&&(identical(other.repostOf, repostOf) || other.repostOf == repostOf)&&(identical(other.replyTo, replyTo) || other.replyTo == replyTo)&&(identical(other.communityNoteOf, communityNoteOf) || other.communityNoteOf == communityNoteOf)&&(identical(other.ballot, ballot) || other.ballot == ballot)&&(identical(other.survey, survey) || other.survey == survey)&&(identical(other.petition, petition) || other.petition == petition)&&(identical(other.meeting, meeting) || other.meeting == meeting)&&(identical(other.section, section) || other.section == section)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._filePaths, _filePaths)&&(identical(other.location, location) || other.location == location));
}


@override
int get hashCode => Object.hash(runtimeType,body,status,repostOf,replyTo,communityNoteOf,ballot,survey,petition,meeting,section,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_filePaths),location);

@override
String toString() {
  return 'PostCreateEvent.create(body: $body, status: $status, repostOf: $repostOf, replyTo: $replyTo, communityNoteOf: $communityNoteOf, ballot: $ballot, survey: $survey, petition: $petition, meeting: $meeting, section: $section, tags: $tags, filePaths: $filePaths, location: $location)';
}


}

/// @nodoc
abstract mixin class _$CreateCopyWith<$Res> implements $PostCreateEventCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) _then) = __$CreateCopyWithImpl;
@useResult
$Res call({
 String body, PostStatus status, Post? repostOf, Post? replyTo, Post? communityNoteOf, Ballot? ballot, Survey? survey, Petition? petition, Meeting? meeting, Section? section, List<Map<String, dynamic>> tags, List<String> filePaths, LatLng? location
});


$PostCopyWith<$Res>? get repostOf;$PostCopyWith<$Res>? get replyTo;$PostCopyWith<$Res>? get communityNoteOf;$BallotCopyWith<$Res>? get ballot;$SurveyCopyWith<$Res>? get survey;$PetitionCopyWith<$Res>? get petition;$MeetingCopyWith<$Res>? get meeting;$SectionCopyWith<$Res>? get section;

}
/// @nodoc
class __$CreateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(this._self, this._then);

  final _Create _self;
  final $Res Function(_Create) _then;

/// Create a copy of PostCreateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? body = null,Object? status = null,Object? repostOf = freezed,Object? replyTo = freezed,Object? communityNoteOf = freezed,Object? ballot = freezed,Object? survey = freezed,Object? petition = freezed,Object? meeting = freezed,Object? section = freezed,Object? tags = null,Object? filePaths = null,Object? location = freezed,}) {
  return _then(_Create(
body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PostStatus,repostOf: freezed == repostOf ? _self.repostOf : repostOf // ignore: cast_nullable_to_non_nullable
as Post?,replyTo: freezed == replyTo ? _self.replyTo : replyTo // ignore: cast_nullable_to_non_nullable
as Post?,communityNoteOf: freezed == communityNoteOf ? _self.communityNoteOf : communityNoteOf // ignore: cast_nullable_to_non_nullable
as Post?,ballot: freezed == ballot ? _self.ballot : ballot // ignore: cast_nullable_to_non_nullable
as Ballot?,survey: freezed == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as Survey?,petition: freezed == petition ? _self.petition : petition // ignore: cast_nullable_to_non_nullable
as Petition?,meeting: freezed == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting?,section: freezed == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,filePaths: null == filePaths ? _self._filePaths : filePaths // ignore: cast_nullable_to_non_nullable
as List<String>,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LatLng?,
  ));
}

/// Create a copy of PostCreateEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res>? get repostOf {
    if (_self.repostOf == null) {
    return null;
  }

  return $PostCopyWith<$Res>(_self.repostOf!, (value) {
    return _then(_self.copyWith(repostOf: value));
  });
}/// Create a copy of PostCreateEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res>? get replyTo {
    if (_self.replyTo == null) {
    return null;
  }

  return $PostCopyWith<$Res>(_self.replyTo!, (value) {
    return _then(_self.copyWith(replyTo: value));
  });
}/// Create a copy of PostCreateEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res>? get communityNoteOf {
    if (_self.communityNoteOf == null) {
    return null;
  }

  return $PostCopyWith<$Res>(_self.communityNoteOf!, (value) {
    return _then(_self.copyWith(communityNoteOf: value));
  });
}/// Create a copy of PostCreateEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BallotCopyWith<$Res>? get ballot {
    if (_self.ballot == null) {
    return null;
  }

  return $BallotCopyWith<$Res>(_self.ballot!, (value) {
    return _then(_self.copyWith(ballot: value));
  });
}/// Create a copy of PostCreateEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SurveyCopyWith<$Res>? get survey {
    if (_self.survey == null) {
    return null;
  }

  return $SurveyCopyWith<$Res>(_self.survey!, (value) {
    return _then(_self.copyWith(survey: value));
  });
}/// Create a copy of PostCreateEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetitionCopyWith<$Res>? get petition {
    if (_self.petition == null) {
    return null;
  }

  return $PetitionCopyWith<$Res>(_self.petition!, (value) {
    return _then(_self.copyWith(petition: value));
  });
}/// Create a copy of PostCreateEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeetingCopyWith<$Res>? get meeting {
    if (_self.meeting == null) {
    return null;
  }

  return $MeetingCopyWith<$Res>(_self.meeting!, (value) {
    return _then(_self.copyWith(meeting: value));
  });
}/// Create a copy of PostCreateEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionCopyWith<$Res>? get section {
    if (_self.section == null) {
    return null;
  }

  return $SectionCopyWith<$Res>(_self.section!, (value) {
    return _then(_self.copyWith(section: value));
  });
}
}

/// @nodoc


class _UploadAssets implements PostCreateEvent {
  const _UploadAssets({required final  List<dynamic> uploads}): _uploads = uploads;
  

 final  List<dynamic> _uploads;
 List<dynamic> get uploads {
  if (_uploads is EqualUnmodifiableListView) return _uploads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_uploads);
}


/// Create a copy of PostCreateEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadAssetsCopyWith<_UploadAssets> get copyWith => __$UploadAssetsCopyWithImpl<_UploadAssets>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadAssets&&const DeepCollectionEquality().equals(other._uploads, _uploads));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_uploads));

@override
String toString() {
  return 'PostCreateEvent.uploadAssets(uploads: $uploads)';
}


}

/// @nodoc
abstract mixin class _$UploadAssetsCopyWith<$Res> implements $PostCreateEventCopyWith<$Res> {
  factory _$UploadAssetsCopyWith(_UploadAssets value, $Res Function(_UploadAssets) _then) = __$UploadAssetsCopyWithImpl;
@useResult
$Res call({
 List<dynamic> uploads
});




}
/// @nodoc
class __$UploadAssetsCopyWithImpl<$Res>
    implements _$UploadAssetsCopyWith<$Res> {
  __$UploadAssetsCopyWithImpl(this._self, this._then);

  final _UploadAssets _self;
  final $Res Function(_UploadAssets) _then;

/// Create a copy of PostCreateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uploads = null,}) {
  return _then(_UploadAssets(
uploads: null == uploads ? _self._uploads : uploads // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}


}

/// @nodoc


class _Retry implements PostCreateEvent {
  const _Retry();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Retry);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostCreateEvent.retry()';
}


}




// dart format on
