// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey_bottom_navigation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SurveyBottomNavigationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SurveyBottomNavigationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SurveyBottomNavigationEvent()';
}


}

/// @nodoc
class $SurveyBottomNavigationEventCopyWith<$Res>  {
$SurveyBottomNavigationEventCopyWith(SurveyBottomNavigationEvent _, $Res Function(SurveyBottomNavigationEvent) __);
}


/// @nodoc


class _Started implements SurveyBottomNavigationEvent {
  const _Started({required this.survey});
  

 final  Survey survey;

/// Create a copy of SurveyBottomNavigationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
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
  return 'SurveyBottomNavigationEvent.started(survey: $survey)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $SurveyBottomNavigationEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 Survey survey
});


$SurveyCopyWith<$Res> get survey;

}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of SurveyBottomNavigationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? survey = null,}) {
  return _then(_Started(
survey: null == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as Survey,
  ));
}

/// Create a copy of SurveyBottomNavigationEvent
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


class _LoadNextPage implements SurveyBottomNavigationEvent {
  const _LoadNextPage({required this.survey});
  

 final  Survey survey;

/// Create a copy of SurveyBottomNavigationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadNextPageCopyWith<_LoadNextPage> get copyWith => __$LoadNextPageCopyWithImpl<_LoadNextPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadNextPage&&(identical(other.survey, survey) || other.survey == survey));
}


@override
int get hashCode => Object.hash(runtimeType,survey);

@override
String toString() {
  return 'SurveyBottomNavigationEvent.loadNextPage(survey: $survey)';
}


}

/// @nodoc
abstract mixin class _$LoadNextPageCopyWith<$Res> implements $SurveyBottomNavigationEventCopyWith<$Res> {
  factory _$LoadNextPageCopyWith(_LoadNextPage value, $Res Function(_LoadNextPage) _then) = __$LoadNextPageCopyWithImpl;
@useResult
$Res call({
 Survey survey
});


$SurveyCopyWith<$Res> get survey;

}
/// @nodoc
class __$LoadNextPageCopyWithImpl<$Res>
    implements _$LoadNextPageCopyWith<$Res> {
  __$LoadNextPageCopyWithImpl(this._self, this._then);

  final _LoadNextPage _self;
  final $Res Function(_LoadNextPage) _then;

/// Create a copy of SurveyBottomNavigationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? survey = null,}) {
  return _then(_LoadNextPage(
survey: null == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as Survey,
  ));
}

/// Create a copy of SurveyBottomNavigationEvent
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


class _LoadPrevPage implements SurveyBottomNavigationEvent {
  const _LoadPrevPage({required this.survey});
  

 final  Survey survey;

/// Create a copy of SurveyBottomNavigationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadPrevPageCopyWith<_LoadPrevPage> get copyWith => __$LoadPrevPageCopyWithImpl<_LoadPrevPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadPrevPage&&(identical(other.survey, survey) || other.survey == survey));
}


@override
int get hashCode => Object.hash(runtimeType,survey);

@override
String toString() {
  return 'SurveyBottomNavigationEvent.loadPrevPage(survey: $survey)';
}


}

/// @nodoc
abstract mixin class _$LoadPrevPageCopyWith<$Res> implements $SurveyBottomNavigationEventCopyWith<$Res> {
  factory _$LoadPrevPageCopyWith(_LoadPrevPage value, $Res Function(_LoadPrevPage) _then) = __$LoadPrevPageCopyWithImpl;
@useResult
$Res call({
 Survey survey
});


$SurveyCopyWith<$Res> get survey;

}
/// @nodoc
class __$LoadPrevPageCopyWithImpl<$Res>
    implements _$LoadPrevPageCopyWith<$Res> {
  __$LoadPrevPageCopyWithImpl(this._self, this._then);

  final _LoadPrevPage _self;
  final $Res Function(_LoadPrevPage) _then;

/// Create a copy of SurveyBottomNavigationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? survey = null,}) {
  return _then(_LoadPrevPage(
survey: null == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as Survey,
  ));
}

/// Create a copy of SurveyBottomNavigationEvent
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


class _ReturnToSurvey implements SurveyBottomNavigationEvent {
  const _ReturnToSurvey();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReturnToSurvey);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SurveyBottomNavigationEvent.returnToSurvey()';
}


}




// dart format on
