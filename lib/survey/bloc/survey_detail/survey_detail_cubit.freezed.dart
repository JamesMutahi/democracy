// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SurveyDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SurveyDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SurveyDetailState()';
}


}

/// @nodoc
class $SurveyDetailStateCopyWith<$Res>  {
$SurveyDetailStateCopyWith(SurveyDetailState _, $Res Function(SurveyDetailState) __);
}


/// @nodoc


class SurveyDetailInitial implements SurveyDetailState {
  const SurveyDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SurveyDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SurveyDetailState.initial()';
}


}




/// @nodoc


class SurveyDetailLoading implements SurveyDetailState {
  const SurveyDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SurveyDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SurveyDetailState.loading()';
}


}




/// @nodoc


class SurveyCreated implements SurveyDetailState {
  const SurveyCreated({required this.survey});
  

 final  Survey survey;

/// Create a copy of SurveyDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SurveyCreatedCopyWith<SurveyCreated> get copyWith => _$SurveyCreatedCopyWithImpl<SurveyCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SurveyCreated&&(identical(other.survey, survey) || other.survey == survey));
}


@override
int get hashCode => Object.hash(runtimeType,survey);

@override
String toString() {
  return 'SurveyDetailState.created(survey: $survey)';
}


}

/// @nodoc
abstract mixin class $SurveyCreatedCopyWith<$Res> implements $SurveyDetailStateCopyWith<$Res> {
  factory $SurveyCreatedCopyWith(SurveyCreated value, $Res Function(SurveyCreated) _then) = _$SurveyCreatedCopyWithImpl;
@useResult
$Res call({
 Survey survey
});


$SurveyCopyWith<$Res> get survey;

}
/// @nodoc
class _$SurveyCreatedCopyWithImpl<$Res>
    implements $SurveyCreatedCopyWith<$Res> {
  _$SurveyCreatedCopyWithImpl(this._self, this._then);

  final SurveyCreated _self;
  final $Res Function(SurveyCreated) _then;

/// Create a copy of SurveyDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? survey = null,}) {
  return _then(SurveyCreated(
survey: null == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as Survey,
  ));
}

/// Create a copy of SurveyDetailState
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


class SurveyUpdated implements SurveyDetailState {
  const SurveyUpdated({required this.survey});
  

 final  Survey survey;

/// Create a copy of SurveyDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SurveyUpdatedCopyWith<SurveyUpdated> get copyWith => _$SurveyUpdatedCopyWithImpl<SurveyUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SurveyUpdated&&(identical(other.survey, survey) || other.survey == survey));
}


@override
int get hashCode => Object.hash(runtimeType,survey);

@override
String toString() {
  return 'SurveyDetailState.updated(survey: $survey)';
}


}

/// @nodoc
abstract mixin class $SurveyUpdatedCopyWith<$Res> implements $SurveyDetailStateCopyWith<$Res> {
  factory $SurveyUpdatedCopyWith(SurveyUpdated value, $Res Function(SurveyUpdated) _then) = _$SurveyUpdatedCopyWithImpl;
@useResult
$Res call({
 Survey survey
});


$SurveyCopyWith<$Res> get survey;

}
/// @nodoc
class _$SurveyUpdatedCopyWithImpl<$Res>
    implements $SurveyUpdatedCopyWith<$Res> {
  _$SurveyUpdatedCopyWithImpl(this._self, this._then);

  final SurveyUpdated _self;
  final $Res Function(SurveyUpdated) _then;

/// Create a copy of SurveyDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? survey = null,}) {
  return _then(SurveyUpdated(
survey: null == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as Survey,
  ));
}

/// Create a copy of SurveyDetailState
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


class SurveyDetailFailure implements SurveyDetailState {
  const SurveyDetailFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SurveyDetailFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SurveyDetailState.failure()';
}


}




// dart format on
