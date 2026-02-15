// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_filter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatFilterState {

 String get searchTerm;
/// Create a copy of ChatFilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatFilterStateCopyWith<ChatFilterState> get copyWith => _$ChatFilterStateCopyWithImpl<ChatFilterState>(this as ChatFilterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatFilterState&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm));
}


@override
int get hashCode => Object.hash(runtimeType,searchTerm);

@override
String toString() {
  return 'ChatFilterState(searchTerm: $searchTerm)';
}


}

/// @nodoc
abstract mixin class $ChatFilterStateCopyWith<$Res>  {
  factory $ChatFilterStateCopyWith(ChatFilterState value, $Res Function(ChatFilterState) _then) = _$ChatFilterStateCopyWithImpl;
@useResult
$Res call({
 String searchTerm
});




}
/// @nodoc
class _$ChatFilterStateCopyWithImpl<$Res>
    implements $ChatFilterStateCopyWith<$Res> {
  _$ChatFilterStateCopyWithImpl(this._self, this._then);

  final ChatFilterState _self;
  final $Res Function(ChatFilterState) _then;

/// Create a copy of ChatFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchTerm = null,}) {
  return _then(_self.copyWith(
searchTerm: null == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatFilterState].
extension ChatFilterStatePatterns on ChatFilterState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String searchTerm)?  changed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Changed() when changed != null:
return changed(_that.searchTerm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String searchTerm)  changed,}) {final _that = this;
switch (_that) {
case _Changed():
return changed(_that.searchTerm);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String searchTerm)?  changed,}) {final _that = this;
switch (_that) {
case _Changed() when changed != null:
return changed(_that.searchTerm);case _:
  return null;

}
}

}

/// @nodoc


class _Changed implements ChatFilterState {
  const _Changed({required this.searchTerm});
  

@override final  String searchTerm;

/// Create a copy of ChatFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangedCopyWith<_Changed> get copyWith => __$ChangedCopyWithImpl<_Changed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Changed&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm));
}


@override
int get hashCode => Object.hash(runtimeType,searchTerm);

@override
String toString() {
  return 'ChatFilterState.changed(searchTerm: $searchTerm)';
}


}

/// @nodoc
abstract mixin class _$ChangedCopyWith<$Res> implements $ChatFilterStateCopyWith<$Res> {
  factory _$ChangedCopyWith(_Changed value, $Res Function(_Changed) _then) = __$ChangedCopyWithImpl;
@override @useResult
$Res call({
 String searchTerm
});




}
/// @nodoc
class __$ChangedCopyWithImpl<$Res>
    implements _$ChangedCopyWith<$Res> {
  __$ChangedCopyWithImpl(this._self, this._then);

  final _Changed _self;
  final $Res Function(_Changed) _then;

/// Create a copy of ChatFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchTerm = null,}) {
  return _then(_Changed(
searchTerm: null == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
