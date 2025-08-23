// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottom_navbar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BottomNavBarState {

  int get page;

  /// Create a copy of BottomNavBarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BottomNavBarStateCopyWith<BottomNavBarState> get copyWith =>
      _$BottomNavBarStateCopyWithImpl<BottomNavBarState>(
          this as BottomNavBarState, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BottomNavBarState &&
            (identical(other.page, page) || other.page == page));
  }


  @override
  int get hashCode => Object.hash(runtimeType, page);

  @override
  String toString() {
    return 'BottomNavBarState(page: $page)';
  }


}

/// @nodoc
abstract mixin class $BottomNavBarStateCopyWith<$Res> {
  factory $BottomNavBarStateCopyWith(BottomNavBarState value,
      $Res Function(BottomNavBarState) _then) = _$BottomNavBarStateCopyWithImpl;

  @useResult
  $Res call({
    int page
  });


}

/// @nodoc
class _$BottomNavBarStateCopyWithImpl<$Res>
    implements $BottomNavBarStateCopyWith<$Res> {
  _$BottomNavBarStateCopyWithImpl(this._self, this._then);

  final BottomNavBarState _self;
  final $Res Function(BottomNavBarState) _then;

  /// Create a copy of BottomNavBarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? page = null,}) {
    return _then(_self.copyWith(
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
      as int,
    ));
  }

}


/// Adds pattern-matching-related methods to [BottomNavBarState].
extension BottomNavBarStatePatterns on BottomNavBarState {
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

  @optionalTypeArgs TResult maybeMap

  <

  TResult

  extends

  Object?

  >

  (

  {

  TResult

  Function

  (

  BottomNavBarPageChanged

  value

  )

  ?

  pageChanged

  ,

  required

  TResult

  orElse

  (

  )

  ,
}){
final _that = this;
switch (_that) {
case BottomNavBarPageChanged() when pageChanged != null:
return pageChanged(_that);case _:
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

@optionalTypeArgs
TResult map<TResult extends Object?>(
    {required TResult Function( BottomNavBarPageChanged value) pageChanged,}) {
  final _that = this;
  switch (_that) {
    case BottomNavBarPageChanged():
      return pageChanged(_that);
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

@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>(
    {TResult? Function( BottomNavBarPageChanged value)? pageChanged,}) {
  final _that = this;
  switch (_that) {
    case BottomNavBarPageChanged() when pageChanged != null:
      return pageChanged(_that);
    case _:
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

@optionalTypeArgs TResult maybeWhen
<
TResult extends Object?>(
{
TResult
Function
(
int
page
)
?
pageChanged
,
required
TResult
orElse(),}) {final _that = this;
switch (_that) {
case BottomNavBarPageChanged() when pageChanged != null:
return pageChanged(_that.page);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int page) pageChanged,}) {final _that = this;
switch (_that) {
case BottomNavBarPageChanged():
return pageChanged(_that.page);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int page)? pageChanged,}) {final _that = this;
switch (_that) {
case BottomNavBarPageChanged() when pageChanged != null:
return pageChanged(_that.page);case _:
return null;

}
}

}

/// @nodoc


class BottomNavBarPageChanged implements BottomNavBarState {
const BottomNavBarPageChanged(this.page);


@override final int page;

/// Create a copy of BottomNavBarState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BottomNavBarPageChangedCopyWith<BottomNavBarPageChanged> get copyWith => _$BottomNavBarPageChangedCopyWithImpl<BottomNavBarPageChanged>(this, _$identity);


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is BottomNavBarPageChanged&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString() {
return 'BottomNavBarState.pageChanged(page: $page)';
}


}

/// @nodoc
abstract mixin class $BottomNavBarPageChangedCopyWith<$Res> implements $BottomNavBarStateCopyWith<$Res> {
factory $BottomNavBarPageChangedCopyWith(BottomNavBarPageChanged value, $Res Function(BottomNavBarPageChanged) _then) = _$BottomNavBarPageChangedCopyWithImpl;
@override @useResult
$Res call({
int page
});


}
/// @nodoc
class _$BottomNavBarPageChangedCopyWithImpl<$Res>
implements $BottomNavBarPageChangedCopyWith<$Res> {
_$BottomNavBarPageChangedCopyWithImpl(this._self, this._then);

final BottomNavBarPageChanged _self;
final $Res Function(BottomNavBarPageChanged) _then;

/// Create a copy of BottomNavBarState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,}) {
return _then(BottomNavBarPageChanged(
null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
));
}


}

// dart format on
