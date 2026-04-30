// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draft_post_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DraftPostEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftPostEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DraftPostEvent()';
}


}

/// @nodoc
class $DraftPostEventCopyWith<$Res>  {
$DraftPostEventCopyWith(DraftPostEvent _, $Res Function(DraftPostEvent) __);
}


/// Adds pattern-matching-related methods to [DraftPostEvent].
extension DraftPostEventPatterns on DraftPostEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Save value)?  save,TResult Function( _Delete value)?  delete,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Save() when save != null:
return save(_that);case _Delete() when delete != null:
return delete(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Save value)  save,required TResult Function( _Delete value)  delete,}){
final _that = this;
switch (_that) {
case _Save():
return save(_that);case _Delete():
return delete(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Save value)?  save,TResult? Function( _Delete value)?  delete,}){
final _that = this;
switch (_that) {
case _Save() when save != null:
return save(_that);case _Delete() when delete != null:
return delete(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int? id,  String body,  Post? repostOf,  Post? replyTo,  Post? communityNoteOf,  Ballot? ballot,  Survey? survey,  Petition? petition,  Meeting? meeting,  Section? section,  List<Map<String, String>> tags,  List<String> filePaths,  LatLng? location)?  save,TResult Function( DraftPost draft)?  delete,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Save() when save != null:
return save(_that.id,_that.body,_that.repostOf,_that.replyTo,_that.communityNoteOf,_that.ballot,_that.survey,_that.petition,_that.meeting,_that.section,_that.tags,_that.filePaths,_that.location);case _Delete() when delete != null:
return delete(_that.draft);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int? id,  String body,  Post? repostOf,  Post? replyTo,  Post? communityNoteOf,  Ballot? ballot,  Survey? survey,  Petition? petition,  Meeting? meeting,  Section? section,  List<Map<String, String>> tags,  List<String> filePaths,  LatLng? location)  save,required TResult Function( DraftPost draft)  delete,}) {final _that = this;
switch (_that) {
case _Save():
return save(_that.id,_that.body,_that.repostOf,_that.replyTo,_that.communityNoteOf,_that.ballot,_that.survey,_that.petition,_that.meeting,_that.section,_that.tags,_that.filePaths,_that.location);case _Delete():
return delete(_that.draft);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int? id,  String body,  Post? repostOf,  Post? replyTo,  Post? communityNoteOf,  Ballot? ballot,  Survey? survey,  Petition? petition,  Meeting? meeting,  Section? section,  List<Map<String, String>> tags,  List<String> filePaths,  LatLng? location)?  save,TResult? Function( DraftPost draft)?  delete,}) {final _that = this;
switch (_that) {
case _Save() when save != null:
return save(_that.id,_that.body,_that.repostOf,_that.replyTo,_that.communityNoteOf,_that.ballot,_that.survey,_that.petition,_that.meeting,_that.section,_that.tags,_that.filePaths,_that.location);case _Delete() when delete != null:
return delete(_that.draft);case _:
  return null;

}
}

}

/// @nodoc


class _Save implements DraftPostEvent {
  const _Save({required this.id, required this.body, this.repostOf, this.replyTo, this.communityNoteOf, this.ballot, this.survey, this.petition, this.meeting, this.section, final  List<Map<String, String>> tags = const [], final  List<String> filePaths = const [], this.location}): _tags = tags,_filePaths = filePaths;
  

 final  int? id;
 final  String body;
 final  Post? repostOf;
 final  Post? replyTo;
 final  Post? communityNoteOf;
 final  Ballot? ballot;
 final  Survey? survey;
 final  Petition? petition;
 final  Meeting? meeting;
 final  Section? section;
 final  List<Map<String, String>> _tags;
@JsonKey() List<Map<String, String>> get tags {
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

/// Create a copy of DraftPostEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveCopyWith<_Save> get copyWith => __$SaveCopyWithImpl<_Save>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Save&&(identical(other.id, id) || other.id == id)&&(identical(other.body, body) || other.body == body)&&(identical(other.repostOf, repostOf) || other.repostOf == repostOf)&&(identical(other.replyTo, replyTo) || other.replyTo == replyTo)&&(identical(other.communityNoteOf, communityNoteOf) || other.communityNoteOf == communityNoteOf)&&(identical(other.ballot, ballot) || other.ballot == ballot)&&(identical(other.survey, survey) || other.survey == survey)&&(identical(other.petition, petition) || other.petition == petition)&&(identical(other.meeting, meeting) || other.meeting == meeting)&&(identical(other.section, section) || other.section == section)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._filePaths, _filePaths)&&(identical(other.location, location) || other.location == location));
}


@override
int get hashCode => Object.hash(runtimeType,id,body,repostOf,replyTo,communityNoteOf,ballot,survey,petition,meeting,section,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_filePaths),location);

@override
String toString() {
  return 'DraftPostEvent.save(id: $id, body: $body, repostOf: $repostOf, replyTo: $replyTo, communityNoteOf: $communityNoteOf, ballot: $ballot, survey: $survey, petition: $petition, meeting: $meeting, section: $section, tags: $tags, filePaths: $filePaths, location: $location)';
}


}

/// @nodoc
abstract mixin class _$SaveCopyWith<$Res> implements $DraftPostEventCopyWith<$Res> {
  factory _$SaveCopyWith(_Save value, $Res Function(_Save) _then) = __$SaveCopyWithImpl;
@useResult
$Res call({
 int? id, String body, Post? repostOf, Post? replyTo, Post? communityNoteOf, Ballot? ballot, Survey? survey, Petition? petition, Meeting? meeting, Section? section, List<Map<String, String>> tags, List<String> filePaths, LatLng? location
});


$PostCopyWith<$Res>? get repostOf;$PostCopyWith<$Res>? get replyTo;$PostCopyWith<$Res>? get communityNoteOf;$BallotCopyWith<$Res>? get ballot;$SurveyCopyWith<$Res>? get survey;$PetitionCopyWith<$Res>? get petition;$MeetingCopyWith<$Res>? get meeting;$SectionCopyWith<$Res>? get section;

}
/// @nodoc
class __$SaveCopyWithImpl<$Res>
    implements _$SaveCopyWith<$Res> {
  __$SaveCopyWithImpl(this._self, this._then);

  final _Save _self;
  final $Res Function(_Save) _then;

/// Create a copy of DraftPostEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? body = null,Object? repostOf = freezed,Object? replyTo = freezed,Object? communityNoteOf = freezed,Object? ballot = freezed,Object? survey = freezed,Object? petition = freezed,Object? meeting = freezed,Object? section = freezed,Object? tags = null,Object? filePaths = null,Object? location = freezed,}) {
  return _then(_Save(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,repostOf: freezed == repostOf ? _self.repostOf : repostOf // ignore: cast_nullable_to_non_nullable
as Post?,replyTo: freezed == replyTo ? _self.replyTo : replyTo // ignore: cast_nullable_to_non_nullable
as Post?,communityNoteOf: freezed == communityNoteOf ? _self.communityNoteOf : communityNoteOf // ignore: cast_nullable_to_non_nullable
as Post?,ballot: freezed == ballot ? _self.ballot : ballot // ignore: cast_nullable_to_non_nullable
as Ballot?,survey: freezed == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as Survey?,petition: freezed == petition ? _self.petition : petition // ignore: cast_nullable_to_non_nullable
as Petition?,meeting: freezed == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting?,section: freezed == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,filePaths: null == filePaths ? _self._filePaths : filePaths // ignore: cast_nullable_to_non_nullable
as List<String>,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LatLng?,
  ));
}

/// Create a copy of DraftPostEvent
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
}/// Create a copy of DraftPostEvent
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
}/// Create a copy of DraftPostEvent
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
}/// Create a copy of DraftPostEvent
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
}/// Create a copy of DraftPostEvent
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
}/// Create a copy of DraftPostEvent
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
}/// Create a copy of DraftPostEvent
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
}/// Create a copy of DraftPostEvent
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


class _Delete implements DraftPostEvent {
  const _Delete({required this.draft});
  

 final  DraftPost draft;

/// Create a copy of DraftPostEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteCopyWith<_Delete> get copyWith => __$DeleteCopyWithImpl<_Delete>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Delete&&(identical(other.draft, draft) || other.draft == draft));
}


@override
int get hashCode => Object.hash(runtimeType,draft);

@override
String toString() {
  return 'DraftPostEvent.delete(draft: $draft)';
}


}

/// @nodoc
abstract mixin class _$DeleteCopyWith<$Res> implements $DraftPostEventCopyWith<$Res> {
  factory _$DeleteCopyWith(_Delete value, $Res Function(_Delete) _then) = __$DeleteCopyWithImpl;
@useResult
$Res call({
 DraftPost draft
});




}
/// @nodoc
class __$DeleteCopyWithImpl<$Res>
    implements _$DeleteCopyWith<$Res> {
  __$DeleteCopyWithImpl(this._self, this._then);

  final _Delete _self;
  final $Res Function(_Delete) _then;

/// Create a copy of DraftPostEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? draft = null,}) {
  return _then(_Delete(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as DraftPost,
  ));
}


}

/// @nodoc
mixin _$DraftPostState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftPostState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DraftPostState()';
}


}

/// @nodoc
class $DraftPostStateCopyWith<$Res>  {
$DraftPostStateCopyWith(DraftPostState _, $Res Function(DraftPostState) __);
}


/// Adds pattern-matching-related methods to [DraftPostState].
extension DraftPostStatePatterns on DraftPostState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( DraftPostSaved value)?  saved,TResult Function( DraftPostDeleted value)?  deleted,TResult Function( DraftPostsCleared value)?  cleared,TResult Function( DraftPostFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case DraftPostSaved() when saved != null:
return saved(_that);case DraftPostDeleted() when deleted != null:
return deleted(_that);case DraftPostsCleared() when cleared != null:
return cleared(_that);case DraftPostFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( DraftPostSaved value)  saved,required TResult Function( DraftPostDeleted value)  deleted,required TResult Function( DraftPostsCleared value)  cleared,required TResult Function( DraftPostFailure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case DraftPostSaved():
return saved(_that);case DraftPostDeleted():
return deleted(_that);case DraftPostsCleared():
return cleared(_that);case DraftPostFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( DraftPostSaved value)?  saved,TResult? Function( DraftPostDeleted value)?  deleted,TResult? Function( DraftPostsCleared value)?  cleared,TResult? Function( DraftPostFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case DraftPostSaved() when saved != null:
return saved(_that);case DraftPostDeleted() when deleted != null:
return deleted(_that);case DraftPostsCleared() when cleared != null:
return cleared(_that);case DraftPostFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( DraftPost draft)?  saved,TResult Function( DraftPost draft)?  deleted,TResult Function()?  cleared,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case DraftPostSaved() when saved != null:
return saved(_that.draft);case DraftPostDeleted() when deleted != null:
return deleted(_that.draft);case DraftPostsCleared() when cleared != null:
return cleared();case DraftPostFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( DraftPost draft)  saved,required TResult Function( DraftPost draft)  deleted,required TResult Function()  cleared,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case DraftPostSaved():
return saved(_that.draft);case DraftPostDeleted():
return deleted(_that.draft);case DraftPostsCleared():
return cleared();case DraftPostFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( DraftPost draft)?  saved,TResult? Function( DraftPost draft)?  deleted,TResult? Function()?  cleared,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case DraftPostSaved() when saved != null:
return saved(_that.draft);case DraftPostDeleted() when deleted != null:
return deleted(_that.draft);case DraftPostsCleared() when cleared != null:
return cleared();case DraftPostFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements DraftPostState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DraftPostState.initial()';
}


}




/// @nodoc


class _Loading implements DraftPostState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DraftPostState.loading()';
}


}




/// @nodoc


class DraftPostSaved implements DraftPostState {
  const DraftPostSaved({required this.draft});
  

 final  DraftPost draft;

/// Create a copy of DraftPostState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DraftPostSavedCopyWith<DraftPostSaved> get copyWith => _$DraftPostSavedCopyWithImpl<DraftPostSaved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftPostSaved&&(identical(other.draft, draft) || other.draft == draft));
}


@override
int get hashCode => Object.hash(runtimeType,draft);

@override
String toString() {
  return 'DraftPostState.saved(draft: $draft)';
}


}

/// @nodoc
abstract mixin class $DraftPostSavedCopyWith<$Res> implements $DraftPostStateCopyWith<$Res> {
  factory $DraftPostSavedCopyWith(DraftPostSaved value, $Res Function(DraftPostSaved) _then) = _$DraftPostSavedCopyWithImpl;
@useResult
$Res call({
 DraftPost draft
});




}
/// @nodoc
class _$DraftPostSavedCopyWithImpl<$Res>
    implements $DraftPostSavedCopyWith<$Res> {
  _$DraftPostSavedCopyWithImpl(this._self, this._then);

  final DraftPostSaved _self;
  final $Res Function(DraftPostSaved) _then;

/// Create a copy of DraftPostState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? draft = null,}) {
  return _then(DraftPostSaved(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as DraftPost,
  ));
}


}

/// @nodoc


class DraftPostDeleted implements DraftPostState {
  const DraftPostDeleted({required this.draft});
  

 final  DraftPost draft;

/// Create a copy of DraftPostState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DraftPostDeletedCopyWith<DraftPostDeleted> get copyWith => _$DraftPostDeletedCopyWithImpl<DraftPostDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftPostDeleted&&(identical(other.draft, draft) || other.draft == draft));
}


@override
int get hashCode => Object.hash(runtimeType,draft);

@override
String toString() {
  return 'DraftPostState.deleted(draft: $draft)';
}


}

/// @nodoc
abstract mixin class $DraftPostDeletedCopyWith<$Res> implements $DraftPostStateCopyWith<$Res> {
  factory $DraftPostDeletedCopyWith(DraftPostDeleted value, $Res Function(DraftPostDeleted) _then) = _$DraftPostDeletedCopyWithImpl;
@useResult
$Res call({
 DraftPost draft
});




}
/// @nodoc
class _$DraftPostDeletedCopyWithImpl<$Res>
    implements $DraftPostDeletedCopyWith<$Res> {
  _$DraftPostDeletedCopyWithImpl(this._self, this._then);

  final DraftPostDeleted _self;
  final $Res Function(DraftPostDeleted) _then;

/// Create a copy of DraftPostState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? draft = null,}) {
  return _then(DraftPostDeleted(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as DraftPost,
  ));
}


}

/// @nodoc


class DraftPostsCleared implements DraftPostState {
  const DraftPostsCleared();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftPostsCleared);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DraftPostState.cleared()';
}


}




/// @nodoc


class DraftPostFailure implements DraftPostState {
  const DraftPostFailure({required this.error});
  

 final  String error;

/// Create a copy of DraftPostState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DraftPostFailureCopyWith<DraftPostFailure> get copyWith => _$DraftPostFailureCopyWithImpl<DraftPostFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftPostFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'DraftPostState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $DraftPostFailureCopyWith<$Res> implements $DraftPostStateCopyWith<$Res> {
  factory $DraftPostFailureCopyWith(DraftPostFailure value, $Res Function(DraftPostFailure) _then) = _$DraftPostFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$DraftPostFailureCopyWithImpl<$Res>
    implements $DraftPostFailureCopyWith<$Res> {
  _$DraftPostFailureCopyWithImpl(this._self, this._then);

  final DraftPostFailure _self;
  final $Res Function(DraftPostFailure) _then;

/// Create a copy of DraftPostState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(DraftPostFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
