// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PageEvent()';
}


}

/// @nodoc
class $PageEventCopyWith<$Res>  {
$PageEventCopyWith(PageEvent _, $Res Function(PageEvent) __);
}


/// Adds pattern-matching-related methods to [PageEvent].
extension PageEventPatterns on PageEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PageLoaded value)?  pageLoaded,TResult Function( _PageCompleted value)?  completed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PageLoaded() when pageLoaded != null:
return pageLoaded(_that);case _PageCompleted() when completed != null:
return completed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PageLoaded value)  pageLoaded,required TResult Function( _PageCompleted value)  completed,}){
final _that = this;
switch (_that) {
case _PageLoaded():
return pageLoaded(_that);case _PageCompleted():
return completed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PageLoaded value)?  pageLoaded,TResult? Function( _PageCompleted value)?  completed,}){
final _that = this;
switch (_that) {
case _PageLoaded() when pageLoaded != null:
return pageLoaded(_that);case _PageCompleted() when completed != null:
return completed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Survey survey,  int page)?  pageLoaded,TResult Function()?  completed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PageLoaded() when pageLoaded != null:
return pageLoaded(_that.survey,_that.page);case _PageCompleted() when completed != null:
return completed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Survey survey,  int page)  pageLoaded,required TResult Function()  completed,}) {final _that = this;
switch (_that) {
case _PageLoaded():
return pageLoaded(_that.survey,_that.page);case _PageCompleted():
return completed();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Survey survey,  int page)?  pageLoaded,TResult? Function()?  completed,}) {final _that = this;
switch (_that) {
case _PageLoaded() when pageLoaded != null:
return pageLoaded(_that.survey,_that.page);case _PageCompleted() when completed != null:
return completed();case _:
  return null;

}
}

}

/// @nodoc


class _PageLoaded implements PageEvent {
  const _PageLoaded({required this.survey, required this.page});
  

 final  Survey survey;
 final  int page;

/// Create a copy of PageEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageLoadedCopyWith<_PageLoaded> get copyWith => __$PageLoadedCopyWithImpl<_PageLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageLoaded&&(identical(other.survey, survey) || other.survey == survey)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,survey,page);

@override
String toString() {
  return 'PageEvent.pageLoaded(survey: $survey, page: $page)';
}


}

/// @nodoc
abstract mixin class _$PageLoadedCopyWith<$Res> implements $PageEventCopyWith<$Res> {
  factory _$PageLoadedCopyWith(_PageLoaded value, $Res Function(_PageLoaded) _then) = __$PageLoadedCopyWithImpl;
@useResult
$Res call({
 Survey survey, int page
});


$SurveyCopyWith<$Res> get survey;

}
/// @nodoc
class __$PageLoadedCopyWithImpl<$Res>
    implements _$PageLoadedCopyWith<$Res> {
  __$PageLoadedCopyWithImpl(this._self, this._then);

  final _PageLoaded _self;
  final $Res Function(_PageLoaded) _then;

/// Create a copy of PageEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? survey = null,Object? page = null,}) {
  return _then(_PageLoaded(
survey: null == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as Survey,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
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


class _PageCompleted implements PageEvent {
  const _PageCompleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageCompleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PageEvent.completed()';
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


/// Adds pattern-matching-related methods to [PageState].
extension PageStatePatterns on PageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PageInitial value)?  initial,TResult Function( PageLoading value)?  loading,TResult Function( PageLoaded value)?  loaded,TResult Function( PageComplete value)?  complete,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PageInitial() when initial != null:
return initial(_that);case PageLoading() when loading != null:
return loading(_that);case PageLoaded() when loaded != null:
return loaded(_that);case PageComplete() when complete != null:
return complete(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PageInitial value)  initial,required TResult Function( PageLoading value)  loading,required TResult Function( PageLoaded value)  loaded,required TResult Function( PageComplete value)  complete,}){
final _that = this;
switch (_that) {
case PageInitial():
return initial(_that);case PageLoading():
return loading(_that);case PageLoaded():
return loaded(_that);case PageComplete():
return complete(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PageInitial value)?  initial,TResult? Function( PageLoading value)?  loading,TResult? Function( PageLoaded value)?  loaded,TResult? Function( PageComplete value)?  complete,}){
final _that = this;
switch (_that) {
case PageInitial() when initial != null:
return initial(_that);case PageLoading() when loading != null:
return loading(_that);case PageLoaded() when loaded != null:
return loaded(_that);case PageComplete() when complete != null:
return complete(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Question> questions)?  loaded,TResult Function()?  complete,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PageInitial() when initial != null:
return initial();case PageLoading() when loading != null:
return loading();case PageLoaded() when loaded != null:
return loaded(_that.questions);case PageComplete() when complete != null:
return complete();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Question> questions)  loaded,required TResult Function()  complete,}) {final _that = this;
switch (_that) {
case PageInitial():
return initial();case PageLoading():
return loading();case PageLoaded():
return loaded(_that.questions);case PageComplete():
return complete();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Question> questions)?  loaded,TResult? Function()?  complete,}) {final _that = this;
switch (_that) {
case PageInitial() when initial != null:
return initial();case PageLoading() when loading != null:
return loading();case PageLoaded() when loaded != null:
return loaded(_that.questions);case PageComplete() when complete != null:
return complete();case _:
  return null;

}
}

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

/// @nodoc


class PageComplete implements PageState {
  const PageComplete();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageComplete);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PageState.complete()';
}


}




// dart format on
