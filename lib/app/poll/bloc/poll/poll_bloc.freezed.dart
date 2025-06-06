// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PollEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PollEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PollEvent()';
}


}

/// @nodoc
class $PollEventCopyWith<$Res>  {
$PollEventCopyWith(PollEvent _, $Res Function(PollEvent) __);
}


/// @nodoc


class _Initialize implements PollEvent {
  const _Initialize();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initialize);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PollEvent.initialize()';
}


}




/// @nodoc


class GetPolls implements PollEvent {
  const GetPolls();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetPolls);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PollEvent.getPolls()';
}


}




/// @nodoc


class _Filter implements PollEvent {
  const _Filter({required this.searchTerm, required this.startDate, required this.endDate});
  

 final  String? searchTerm;
 final  DateTime? startDate;
 final  DateTime? endDate;

/// Create a copy of PollEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterCopyWith<_Filter> get copyWith => __$FilterCopyWithImpl<_Filter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Filter&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,searchTerm,startDate,endDate);

@override
String toString() {
  return 'PollEvent.filter(searchTerm: $searchTerm, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$FilterCopyWith<$Res> implements $PollEventCopyWith<$Res> {
  factory _$FilterCopyWith(_Filter value, $Res Function(_Filter) _then) = __$FilterCopyWithImpl;
@useResult
$Res call({
 String? searchTerm, DateTime? startDate, DateTime? endDate
});




}
/// @nodoc
class __$FilterCopyWithImpl<$Res>
    implements _$FilterCopyWith<$Res> {
  __$FilterCopyWithImpl(this._self, this._then);

  final _Filter _self;
  final $Res Function(_Filter) _then;

/// Create a copy of PollEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? searchTerm = freezed,Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(_Filter(
searchTerm: freezed == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class _Reload implements PollEvent {
  const _Reload();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reload);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PollEvent.reload()';
}


}




// dart format on
