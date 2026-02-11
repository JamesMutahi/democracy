// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey_filter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SurveyFilterState {

 String get searchTerm; String get status; bool get filterByRegion; String get sortBy; DateTime? get startDate; DateTime? get endDate;
/// Create a copy of SurveyFilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SurveyFilterStateCopyWith<SurveyFilterState> get copyWith => _$SurveyFilterStateCopyWithImpl<SurveyFilterState>(this as SurveyFilterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SurveyFilterState&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm)&&(identical(other.status, status) || other.status == status)&&(identical(other.filterByRegion, filterByRegion) || other.filterByRegion == filterByRegion)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,searchTerm,status,filterByRegion,sortBy,startDate,endDate);

@override
String toString() {
  return 'SurveyFilterState(searchTerm: $searchTerm, status: $status, filterByRegion: $filterByRegion, sortBy: $sortBy, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $SurveyFilterStateCopyWith<$Res>  {
  factory $SurveyFilterStateCopyWith(SurveyFilterState value, $Res Function(SurveyFilterState) _then) = _$SurveyFilterStateCopyWithImpl;
@useResult
$Res call({
 String searchTerm, String status, bool filterByRegion, String sortBy, DateTime? startDate, DateTime? endDate
});




}
/// @nodoc
class _$SurveyFilterStateCopyWithImpl<$Res>
    implements $SurveyFilterStateCopyWith<$Res> {
  _$SurveyFilterStateCopyWithImpl(this._self, this._then);

  final SurveyFilterState _self;
  final $Res Function(SurveyFilterState) _then;

/// Create a copy of SurveyFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchTerm = null,Object? status = null,Object? filterByRegion = null,Object? sortBy = null,Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(_self.copyWith(
searchTerm: null == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,filterByRegion: null == filterByRegion ? _self.filterByRegion : filterByRegion // ignore: cast_nullable_to_non_nullable
as bool,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SurveyFilterState].
extension SurveyFilterStatePatterns on SurveyFilterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Changed value)?  changed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Changed() when changed != null:
return changed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Changed value)  changed,}){
final _that = this;
switch (_that) {
case _Changed():
return changed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Changed value)?  changed,}){
final _that = this;
switch (_that) {
case _Changed() when changed != null:
return changed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String searchTerm,  String status,  bool filterByRegion,  String sortBy,  DateTime? startDate,  DateTime? endDate)?  changed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Changed() when changed != null:
return changed(_that.searchTerm,_that.status,_that.filterByRegion,_that.sortBy,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String searchTerm,  String status,  bool filterByRegion,  String sortBy,  DateTime? startDate,  DateTime? endDate)  changed,}) {final _that = this;
switch (_that) {
case _Changed():
return changed(_that.searchTerm,_that.status,_that.filterByRegion,_that.sortBy,_that.startDate,_that.endDate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String searchTerm,  String status,  bool filterByRegion,  String sortBy,  DateTime? startDate,  DateTime? endDate)?  changed,}) {final _that = this;
switch (_that) {
case _Changed() when changed != null:
return changed(_that.searchTerm,_that.status,_that.filterByRegion,_that.sortBy,_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc


class _Changed implements SurveyFilterState {
  const _Changed({required this.searchTerm, required this.status, required this.filterByRegion, required this.sortBy, required this.startDate, required this.endDate});
  

@override final  String searchTerm;
@override final  String status;
@override final  bool filterByRegion;
@override final  String sortBy;
@override final  DateTime? startDate;
@override final  DateTime? endDate;

/// Create a copy of SurveyFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangedCopyWith<_Changed> get copyWith => __$ChangedCopyWithImpl<_Changed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Changed&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm)&&(identical(other.status, status) || other.status == status)&&(identical(other.filterByRegion, filterByRegion) || other.filterByRegion == filterByRegion)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,searchTerm,status,filterByRegion,sortBy,startDate,endDate);

@override
String toString() {
  return 'SurveyFilterState.changed(searchTerm: $searchTerm, status: $status, filterByRegion: $filterByRegion, sortBy: $sortBy, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$ChangedCopyWith<$Res> implements $SurveyFilterStateCopyWith<$Res> {
  factory _$ChangedCopyWith(_Changed value, $Res Function(_Changed) _then) = __$ChangedCopyWithImpl;
@override @useResult
$Res call({
 String searchTerm, String status, bool filterByRegion, String sortBy, DateTime? startDate, DateTime? endDate
});




}
/// @nodoc
class __$ChangedCopyWithImpl<$Res>
    implements _$ChangedCopyWith<$Res> {
  __$ChangedCopyWithImpl(this._self, this._then);

  final _Changed _self;
  final $Res Function(_Changed) _then;

/// Create a copy of SurveyFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchTerm = null,Object? status = null,Object? filterByRegion = null,Object? sortBy = null,Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(_Changed(
searchTerm: null == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,filterByRegion: null == filterByRegion ? _self.filterByRegion : filterByRegion // ignore: cast_nullable_to_non_nullable
as bool,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
