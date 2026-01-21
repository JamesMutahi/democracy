// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'section_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SectionDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SectionDetailState()';
}


}

/// @nodoc
class $SectionDetailStateCopyWith<$Res>  {
$SectionDetailStateCopyWith(SectionDetailState _, $Res Function(SectionDetailState) __);
}


/// Adds pattern-matching-related methods to [SectionDetailState].
extension SectionDetailStatePatterns on SectionDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( SectionLoaded value)?  loaded,TResult Function( SectionBookmarked value)?  bookmarked,TResult Function( SectionDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case SectionLoaded() when loaded != null:
return loaded(_that);case SectionBookmarked() when bookmarked != null:
return bookmarked(_that);case SectionDetailFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( SectionLoaded value)  loaded,required TResult Function( SectionBookmarked value)  bookmarked,required TResult Function( SectionDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case SectionLoaded():
return loaded(_that);case SectionBookmarked():
return bookmarked(_that);case SectionDetailFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( SectionLoaded value)?  loaded,TResult? Function( SectionBookmarked value)?  bookmarked,TResult? Function( SectionDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case SectionLoaded() when loaded != null:
return loaded(_that);case SectionBookmarked() when bookmarked != null:
return bookmarked(_that);case SectionDetailFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Section section)?  loaded,TResult Function( Section section)?  bookmarked,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case SectionLoaded() when loaded != null:
return loaded(_that.section);case SectionBookmarked() when bookmarked != null:
return bookmarked(_that.section);case SectionDetailFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Section section)  loaded,required TResult Function( Section section)  bookmarked,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case SectionLoaded():
return loaded(_that.section);case SectionBookmarked():
return bookmarked(_that.section);case SectionDetailFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Section section)?  loaded,TResult? Function( Section section)?  bookmarked,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case SectionLoaded() when loaded != null:
return loaded(_that.section);case SectionBookmarked() when bookmarked != null:
return bookmarked(_that.section);case SectionDetailFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SectionDetailState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SectionDetailState.initial()';
}


}




/// @nodoc


class _Loading implements SectionDetailState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SectionDetailState.loading()';
}


}




/// @nodoc


class SectionLoaded implements SectionDetailState {
  const SectionLoaded({required this.section});
  

 final  Section section;

/// Create a copy of SectionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionLoadedCopyWith<SectionLoaded> get copyWith => _$SectionLoadedCopyWithImpl<SectionLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionLoaded&&(identical(other.section, section) || other.section == section));
}


@override
int get hashCode => Object.hash(runtimeType,section);

@override
String toString() {
  return 'SectionDetailState.loaded(section: $section)';
}


}

/// @nodoc
abstract mixin class $SectionLoadedCopyWith<$Res> implements $SectionDetailStateCopyWith<$Res> {
  factory $SectionLoadedCopyWith(SectionLoaded value, $Res Function(SectionLoaded) _then) = _$SectionLoadedCopyWithImpl;
@useResult
$Res call({
 Section section
});


$SectionCopyWith<$Res> get section;

}
/// @nodoc
class _$SectionLoadedCopyWithImpl<$Res>
    implements $SectionLoadedCopyWith<$Res> {
  _$SectionLoadedCopyWithImpl(this._self, this._then);

  final SectionLoaded _self;
  final $Res Function(SectionLoaded) _then;

/// Create a copy of SectionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? section = null,}) {
  return _then(SectionLoaded(
section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section,
  ));
}

/// Create a copy of SectionDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionCopyWith<$Res> get section {
  
  return $SectionCopyWith<$Res>(_self.section, (value) {
    return _then(_self.copyWith(section: value));
  });
}
}

/// @nodoc


class SectionBookmarked implements SectionDetailState {
  const SectionBookmarked({required this.section});
  

 final  Section section;

/// Create a copy of SectionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionBookmarkedCopyWith<SectionBookmarked> get copyWith => _$SectionBookmarkedCopyWithImpl<SectionBookmarked>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionBookmarked&&(identical(other.section, section) || other.section == section));
}


@override
int get hashCode => Object.hash(runtimeType,section);

@override
String toString() {
  return 'SectionDetailState.bookmarked(section: $section)';
}


}

/// @nodoc
abstract mixin class $SectionBookmarkedCopyWith<$Res> implements $SectionDetailStateCopyWith<$Res> {
  factory $SectionBookmarkedCopyWith(SectionBookmarked value, $Res Function(SectionBookmarked) _then) = _$SectionBookmarkedCopyWithImpl;
@useResult
$Res call({
 Section section
});


$SectionCopyWith<$Res> get section;

}
/// @nodoc
class _$SectionBookmarkedCopyWithImpl<$Res>
    implements $SectionBookmarkedCopyWith<$Res> {
  _$SectionBookmarkedCopyWithImpl(this._self, this._then);

  final SectionBookmarked _self;
  final $Res Function(SectionBookmarked) _then;

/// Create a copy of SectionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? section = null,}) {
  return _then(SectionBookmarked(
section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section,
  ));
}

/// Create a copy of SectionDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionCopyWith<$Res> get section {
  
  return $SectionCopyWith<$Res>(_self.section, (value) {
    return _then(_self.copyWith(section: value));
  });
}
}

/// @nodoc


class SectionDetailFailure implements SectionDetailState {
  const SectionDetailFailure({required this.error});
  

 final  String error;

/// Create a copy of SectionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionDetailFailureCopyWith<SectionDetailFailure> get copyWith => _$SectionDetailFailureCopyWithImpl<SectionDetailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionDetailFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SectionDetailState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $SectionDetailFailureCopyWith<$Res> implements $SectionDetailStateCopyWith<$Res> {
  factory $SectionDetailFailureCopyWith(SectionDetailFailure value, $Res Function(SectionDetailFailure) _then) = _$SectionDetailFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$SectionDetailFailureCopyWithImpl<$Res>
    implements $SectionDetailFailureCopyWith<$Res> {
  _$SectionDetailFailureCopyWithImpl(this._self, this._then);

  final SectionDetailFailure _self;
  final $Res Function(SectionDetailFailure) _then;

/// Create a copy of SectionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(SectionDetailFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$SectionDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SectionDetailEvent()';
}


}

/// @nodoc
class $SectionDetailEventCopyWith<$Res>  {
$SectionDetailEventCopyWith(SectionDetailEvent _, $Res Function(SectionDetailEvent) __);
}


/// Adds pattern-matching-related methods to [SectionDetailEvent].
extension SectionDetailEventPatterns on SectionDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Load value)?  load,TResult Function( _Loaded value)?  loaded,TResult Function( _Bookmark value)?  bookmark,TResult Function( _Bookmarked value)?  bookmarked,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Bookmark() when bookmark != null:
return bookmark(_that);case _Bookmarked() when bookmarked != null:
return bookmarked(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Load value)  load,required TResult Function( _Loaded value)  loaded,required TResult Function( _Bookmark value)  bookmark,required TResult Function( _Bookmarked value)  bookmarked,}){
final _that = this;
switch (_that) {
case _Load():
return load(_that);case _Loaded():
return loaded(_that);case _Bookmark():
return bookmark(_that);case _Bookmarked():
return bookmarked(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Load value)?  load,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Bookmark value)?  bookmark,TResult? Function( _Bookmarked value)?  bookmarked,}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Bookmark() when bookmark != null:
return bookmark(_that);case _Bookmarked() when bookmarked != null:
return bookmarked(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String tag)?  load,TResult Function( Map<String, dynamic> payload)?  loaded,TResult Function( Section section)?  bookmark,TResult Function( Map<String, dynamic> payload)?  bookmarked,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that.tag);case _Loaded() when loaded != null:
return loaded(_that.payload);case _Bookmark() when bookmark != null:
return bookmark(_that.section);case _Bookmarked() when bookmarked != null:
return bookmarked(_that.payload);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String tag)  load,required TResult Function( Map<String, dynamic> payload)  loaded,required TResult Function( Section section)  bookmark,required TResult Function( Map<String, dynamic> payload)  bookmarked,}) {final _that = this;
switch (_that) {
case _Load():
return load(_that.tag);case _Loaded():
return loaded(_that.payload);case _Bookmark():
return bookmark(_that.section);case _Bookmarked():
return bookmarked(_that.payload);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String tag)?  load,TResult? Function( Map<String, dynamic> payload)?  loaded,TResult? Function( Section section)?  bookmark,TResult? Function( Map<String, dynamic> payload)?  bookmarked,}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that.tag);case _Loaded() when loaded != null:
return loaded(_that.payload);case _Bookmark() when bookmark != null:
return bookmark(_that.section);case _Bookmarked() when bookmarked != null:
return bookmarked(_that.payload);case _:
  return null;

}
}

}

/// @nodoc


class _Load implements SectionDetailEvent {
  const _Load({required this.tag});
  

 final  String tag;

/// Create a copy of SectionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadCopyWith<_Load> get copyWith => __$LoadCopyWithImpl<_Load>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Load&&(identical(other.tag, tag) || other.tag == tag));
}


@override
int get hashCode => Object.hash(runtimeType,tag);

@override
String toString() {
  return 'SectionDetailEvent.load(tag: $tag)';
}


}

/// @nodoc
abstract mixin class _$LoadCopyWith<$Res> implements $SectionDetailEventCopyWith<$Res> {
  factory _$LoadCopyWith(_Load value, $Res Function(_Load) _then) = __$LoadCopyWithImpl;
@useResult
$Res call({
 String tag
});




}
/// @nodoc
class __$LoadCopyWithImpl<$Res>
    implements _$LoadCopyWith<$Res> {
  __$LoadCopyWithImpl(this._self, this._then);

  final _Load _self;
  final $Res Function(_Load) _then;

/// Create a copy of SectionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tag = null,}) {
  return _then(_Load(
tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Loaded implements SectionDetailEvent {
  const _Loaded({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of SectionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'SectionDetailEvent.loaded(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $SectionDetailEventCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of SectionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Loaded(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Bookmark implements SectionDetailEvent {
  const _Bookmark({required this.section});
  

 final  Section section;

/// Create a copy of SectionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkCopyWith<_Bookmark> get copyWith => __$BookmarkCopyWithImpl<_Bookmark>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Bookmark&&(identical(other.section, section) || other.section == section));
}


@override
int get hashCode => Object.hash(runtimeType,section);

@override
String toString() {
  return 'SectionDetailEvent.bookmark(section: $section)';
}


}

/// @nodoc
abstract mixin class _$BookmarkCopyWith<$Res> implements $SectionDetailEventCopyWith<$Res> {
  factory _$BookmarkCopyWith(_Bookmark value, $Res Function(_Bookmark) _then) = __$BookmarkCopyWithImpl;
@useResult
$Res call({
 Section section
});


$SectionCopyWith<$Res> get section;

}
/// @nodoc
class __$BookmarkCopyWithImpl<$Res>
    implements _$BookmarkCopyWith<$Res> {
  __$BookmarkCopyWithImpl(this._self, this._then);

  final _Bookmark _self;
  final $Res Function(_Bookmark) _then;

/// Create a copy of SectionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? section = null,}) {
  return _then(_Bookmark(
section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section,
  ));
}

/// Create a copy of SectionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionCopyWith<$Res> get section {
  
  return $SectionCopyWith<$Res>(_self.section, (value) {
    return _then(_self.copyWith(section: value));
  });
}
}

/// @nodoc


class _Bookmarked implements SectionDetailEvent {
  const _Bookmarked({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of SectionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkedCopyWith<_Bookmarked> get copyWith => __$BookmarkedCopyWithImpl<_Bookmarked>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Bookmarked&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'SectionDetailEvent.bookmarked(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$BookmarkedCopyWith<$Res> implements $SectionDetailEventCopyWith<$Res> {
  factory _$BookmarkedCopyWith(_Bookmarked value, $Res Function(_Bookmarked) _then) = __$BookmarkedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$BookmarkedCopyWithImpl<$Res>
    implements _$BookmarkedCopyWith<$Res> {
  __$BookmarkedCopyWithImpl(this._self, this._then);

  final _Bookmarked _self;
  final $Res Function(_Bookmarked) _then;

/// Create a copy of SectionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Bookmarked(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
