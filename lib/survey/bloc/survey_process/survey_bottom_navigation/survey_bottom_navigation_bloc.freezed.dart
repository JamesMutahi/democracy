// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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


/// Adds pattern-matching-related methods to [SurveyBottomNavigationEvent].
extension SurveyBottomNavigationEventPatterns on SurveyBottomNavigationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _LoadNextPage value)?  loadNextPage,TResult Function( _LoadPrevPage value)?  loadPrevPage,TResult Function( _ReturnToSurvey value)?  returnToSurvey,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _LoadNextPage() when loadNextPage != null:
return loadNextPage(_that);case _LoadPrevPage() when loadPrevPage != null:
return loadPrevPage(_that);case _ReturnToSurvey() when returnToSurvey != null:
return returnToSurvey(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _LoadNextPage value)  loadNextPage,required TResult Function( _LoadPrevPage value)  loadPrevPage,required TResult Function( _ReturnToSurvey value)  returnToSurvey,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _LoadNextPage():
return loadNextPage(_that);case _LoadPrevPage():
return loadPrevPage(_that);case _ReturnToSurvey():
return returnToSurvey(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _LoadNextPage value)?  loadNextPage,TResult? Function( _LoadPrevPage value)?  loadPrevPage,TResult? Function( _ReturnToSurvey value)?  returnToSurvey,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _LoadNextPage() when loadNextPage != null:
return loadNextPage(_that);case _LoadPrevPage() when loadPrevPage != null:
return loadPrevPage(_that);case _ReturnToSurvey() when returnToSurvey != null:
return returnToSurvey(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Survey survey)?  started,TResult Function( Survey survey)?  loadNextPage,TResult Function( Survey survey)?  loadPrevPage,TResult Function()?  returnToSurvey,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.survey);case _LoadNextPage() when loadNextPage != null:
return loadNextPage(_that.survey);case _LoadPrevPage() when loadPrevPage != null:
return loadPrevPage(_that.survey);case _ReturnToSurvey() when returnToSurvey != null:
return returnToSurvey();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Survey survey)  started,required TResult Function( Survey survey)  loadNextPage,required TResult Function( Survey survey)  loadPrevPage,required TResult Function()  returnToSurvey,}) {final _that = this;
switch (_that) {
case _Started():
return started(_that.survey);case _LoadNextPage():
return loadNextPage(_that.survey);case _LoadPrevPage():
return loadPrevPage(_that.survey);case _ReturnToSurvey():
return returnToSurvey();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Survey survey)?  started,TResult? Function( Survey survey)?  loadNextPage,TResult? Function( Survey survey)?  loadPrevPage,TResult? Function()?  returnToSurvey,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that.survey);case _LoadNextPage() when loadNextPage != null:
return loadNextPage(_that.survey);case _LoadPrevPage() when loadPrevPage != null:
return loadPrevPage(_that.survey);case _ReturnToSurvey() when returnToSurvey != null:
return returnToSurvey();case _:
  return null;

}
}

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
