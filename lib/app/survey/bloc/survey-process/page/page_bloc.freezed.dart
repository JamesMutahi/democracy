// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PageEvent {

 Survey get survey;
/// Create a copy of PageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageEventCopyWith<PageEvent> get copyWith => _$PageEventCopyWithImpl<PageEvent>(this as PageEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageEvent&&(identical(other.survey, survey) || other.survey == survey));
}


@override
int get hashCode => Object.hash(runtimeType,survey);

@override
String toString() {
  return 'PageEvent(survey: $survey)';
}


}

/// @nodoc
abstract mixin class $PageEventCopyWith<$Res>  {
  factory $PageEventCopyWith(PageEvent value, $Res Function(PageEvent) _then) = _$PageEventCopyWithImpl;
@useResult
$Res call({
 Survey survey
});


$SurveyCopyWith<$Res> get survey;

}
/// @nodoc
class _$PageEventCopyWithImpl<$Res>
    implements $PageEventCopyWith<$Res> {
  _$PageEventCopyWithImpl(this._self, this._then);

  final PageEvent _self;
  final $Res Function(PageEvent) _then;

/// Create a copy of PageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? survey = null,}) {
  return _then(_self.copyWith(
survey: null == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as Survey,
  ));
}
/// Create a copy of PageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SurveyCopyWith<$Res> get survey {
  
  return $SurveyCopyWith<$Res>(_self.survey, (value) {
    return _then(_self.copyWith(survey: value));
  });
}
}


/// @nodoc


class _Started implements PageEvent {
  const _Started({required this.survey});
  

@override final  Survey survey;

/// Create a copy of PageEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.survey, survey) || other.survey == survey));
}


@override
int get hashCode => Object.hash(runtimeType,survey);

@override
String toString() {
  return 'PageEvent.started(survey: $survey)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $PageEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@override @useResult
$Res call({
 Survey survey
});


@override $SurveyCopyWith<$Res> get survey;

}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of PageEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? survey = null,}) {
  return _then(_Started(
survey: null == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as Survey,
  ));
}

/// Create a copy of PageEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SurveyCopyWith<$Res> get survey {
  
  return $SurveyCopyWith<$Res>(_self.survey, (value) {
    return _then(_self.copyWith(survey: value));
  });
}
}

/// @nodoc
mixin _$PageState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PageState()';
}


}

/// @nodoc
class $PageStateCopyWith<$Res>  {
$PageStateCopyWith(PageState _, $Res Function(PageState) __);
}


/// @nodoc


class PageInitial implements PageState {
  const PageInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PageState.initial()';
}


}




/// @nodoc


class PageLoading implements PageState {
  const PageLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PageState.loading()';
}


}




/// @nodoc


class PageLoaded implements PageState {
  const PageLoaded({required final  List<Question> questions}): _questions = questions;
  

 final  List<Question> _questions;
 List<Question> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}


/// Create a copy of PageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageLoadedCopyWith<PageLoaded> get copyWith => _$PageLoadedCopyWithImpl<PageLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageLoaded&&const DeepCollectionEquality().equals(other._questions, _questions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_questions));

@override
String toString() {
  return 'PageState.loaded(questions: $questions)';
}


}

/// @nodoc
abstract mixin class $PageLoadedCopyWith<$Res> implements $PageStateCopyWith<$Res> {
  factory $PageLoadedCopyWith(PageLoaded value, $Res Function(PageLoaded) _then) = _$PageLoadedCopyWithImpl;
@useResult
$Res call({
 List<Question> questions
});




}
/// @nodoc
class _$PageLoadedCopyWithImpl<$Res>
    implements $PageLoadedCopyWith<$Res> {
  _$PageLoadedCopyWithImpl(this._self, this._then);

  final PageLoaded _self;
  final $Res Function(PageLoaded) _then;

/// Create a copy of PageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? questions = null,}) {
  return _then(PageLoaded(
questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<Question>,
  ));
}


}

// dart format on
