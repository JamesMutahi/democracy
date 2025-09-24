// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'websocket_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WebsocketEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebsocketEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent()';
}


}

/// @nodoc
class $WebsocketEventCopyWith<$Res>  {
$WebsocketEventCopyWith(WebsocketEvent _, $Res Function(WebsocketEvent) __);
}


/// Adds pattern-matching-related methods to [WebsocketEvent].
extension WebsocketEventPatterns on WebsocketEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Connect value)?  connect,TResult Function( _ChangeState value)?  changeState,TResult Function( _GetConstitution value)?  getConstitution,TResult Function( _GetConstitutionTags value)?  getConstitutionTags,TResult Function( _BookmarkSection value)?  bookmarkSection,TResult Function( _Disconnect value)?  disconnect,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect(_that);case _ChangeState() when changeState != null:
return changeState(_that);case _GetConstitution() when getConstitution != null:
return getConstitution(_that);case _GetConstitutionTags() when getConstitutionTags != null:
return getConstitutionTags(_that);case _BookmarkSection() when bookmarkSection != null:
return bookmarkSection(_that);case _Disconnect() when disconnect != null:
return disconnect(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Connect value)  connect,required TResult Function( _ChangeState value)  changeState,required TResult Function( _GetConstitution value)  getConstitution,required TResult Function( _GetConstitutionTags value)  getConstitutionTags,required TResult Function( _BookmarkSection value)  bookmarkSection,required TResult Function( _Disconnect value)  disconnect,}){
final _that = this;
switch (_that) {
case _Connect():
return connect(_that);case _ChangeState():
return changeState(_that);case _GetConstitution():
return getConstitution(_that);case _GetConstitutionTags():
return getConstitutionTags(_that);case _BookmarkSection():
return bookmarkSection(_that);case _Disconnect():
return disconnect(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Connect value)?  connect,TResult? Function( _ChangeState value)?  changeState,TResult? Function( _GetConstitution value)?  getConstitution,TResult? Function( _GetConstitutionTags value)?  getConstitutionTags,TResult? Function( _BookmarkSection value)?  bookmarkSection,TResult? Function( _Disconnect value)?  disconnect,}){
final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect(_that);case _ChangeState() when changeState != null:
return changeState(_that);case _GetConstitution() when getConstitution != null:
return getConstitution(_that);case _GetConstitutionTags() when getConstitutionTags != null:
return getConstitutionTags(_that);case _BookmarkSection() when bookmarkSection != null:
return bookmarkSection(_that);case _Disconnect() when disconnect != null:
return disconnect(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  connect,TResult Function( WebsocketState state)?  changeState,TResult Function()?  getConstitution,TResult Function( String? searchTerm)?  getConstitutionTags,TResult Function( Section section)?  bookmarkSection,TResult Function()?  disconnect,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect();case _ChangeState() when changeState != null:
return changeState(_that.state);case _GetConstitution() when getConstitution != null:
return getConstitution();case _GetConstitutionTags() when getConstitutionTags != null:
return getConstitutionTags(_that.searchTerm);case _BookmarkSection() when bookmarkSection != null:
return bookmarkSection(_that.section);case _Disconnect() when disconnect != null:
return disconnect();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  connect,required TResult Function( WebsocketState state)  changeState,required TResult Function()  getConstitution,required TResult Function( String? searchTerm)  getConstitutionTags,required TResult Function( Section section)  bookmarkSection,required TResult Function()  disconnect,}) {final _that = this;
switch (_that) {
case _Connect():
return connect();case _ChangeState():
return changeState(_that.state);case _GetConstitution():
return getConstitution();case _GetConstitutionTags():
return getConstitutionTags(_that.searchTerm);case _BookmarkSection():
return bookmarkSection(_that.section);case _Disconnect():
return disconnect();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  connect,TResult? Function( WebsocketState state)?  changeState,TResult? Function()?  getConstitution,TResult? Function( String? searchTerm)?  getConstitutionTags,TResult? Function( Section section)?  bookmarkSection,TResult? Function()?  disconnect,}) {final _that = this;
switch (_that) {
case _Connect() when connect != null:
return connect();case _ChangeState() when changeState != null:
return changeState(_that.state);case _GetConstitution() when getConstitution != null:
return getConstitution();case _GetConstitutionTags() when getConstitutionTags != null:
return getConstitutionTags(_that.searchTerm);case _BookmarkSection() when bookmarkSection != null:
return bookmarkSection(_that.section);case _Disconnect() when disconnect != null:
return disconnect();case _:
  return null;

}
}

}

/// @nodoc


class _Connect with DiagnosticableTreeMixin implements WebsocketEvent {
  const _Connect();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.connect'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Connect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.connect()';
}


}




/// @nodoc


class _ChangeState with DiagnosticableTreeMixin implements WebsocketEvent {
  const _ChangeState({required this.state});
  

 final  WebsocketState state;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeStateCopyWith<_ChangeState> get copyWith => __$ChangeStateCopyWithImpl<_ChangeState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.changeState'))
    ..add(DiagnosticsProperty('state', state));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeState&&(identical(other.state, state) || other.state == state));
}


@override
int get hashCode => Object.hash(runtimeType,state);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.changeState(state: $state)';
}


}

/// @nodoc
abstract mixin class _$ChangeStateCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$ChangeStateCopyWith(_ChangeState value, $Res Function(_ChangeState) _then) = __$ChangeStateCopyWithImpl;
@useResult
$Res call({
 WebsocketState state
});




}
/// @nodoc
class __$ChangeStateCopyWithImpl<$Res>
    implements _$ChangeStateCopyWith<$Res> {
  __$ChangeStateCopyWithImpl(this._self, this._then);

  final _ChangeState _self;
  final $Res Function(_ChangeState) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? state = null,}) {
  return _then(_ChangeState(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as WebsocketState,
  ));
}


}

/// @nodoc


class _GetConstitution with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetConstitution();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getConstitution'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetConstitution);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getConstitution()';
}


}




/// @nodoc


class _GetConstitutionTags with DiagnosticableTreeMixin implements WebsocketEvent {
  const _GetConstitutionTags({this.searchTerm});
  

 final  String? searchTerm;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetConstitutionTagsCopyWith<_GetConstitutionTags> get copyWith => __$GetConstitutionTagsCopyWithImpl<_GetConstitutionTags>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.getConstitutionTags'))
    ..add(DiagnosticsProperty('searchTerm', searchTerm));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetConstitutionTags&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm));
}


@override
int get hashCode => Object.hash(runtimeType,searchTerm);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.getConstitutionTags(searchTerm: $searchTerm)';
}


}

/// @nodoc
abstract mixin class _$GetConstitutionTagsCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$GetConstitutionTagsCopyWith(_GetConstitutionTags value, $Res Function(_GetConstitutionTags) _then) = __$GetConstitutionTagsCopyWithImpl;
@useResult
$Res call({
 String? searchTerm
});




}
/// @nodoc
class __$GetConstitutionTagsCopyWithImpl<$Res>
    implements _$GetConstitutionTagsCopyWith<$Res> {
  __$GetConstitutionTagsCopyWithImpl(this._self, this._then);

  final _GetConstitutionTags _self;
  final $Res Function(_GetConstitutionTags) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? searchTerm = freezed,}) {
  return _then(_GetConstitutionTags(
searchTerm: freezed == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _BookmarkSection with DiagnosticableTreeMixin implements WebsocketEvent {
  const _BookmarkSection({required this.section});
  

 final  Section section;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkSectionCopyWith<_BookmarkSection> get copyWith => __$BookmarkSectionCopyWithImpl<_BookmarkSection>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.bookmarkSection'))
    ..add(DiagnosticsProperty('section', section));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookmarkSection&&(identical(other.section, section) || other.section == section));
}


@override
int get hashCode => Object.hash(runtimeType,section);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.bookmarkSection(section: $section)';
}


}

/// @nodoc
abstract mixin class _$BookmarkSectionCopyWith<$Res> implements $WebsocketEventCopyWith<$Res> {
  factory _$BookmarkSectionCopyWith(_BookmarkSection value, $Res Function(_BookmarkSection) _then) = __$BookmarkSectionCopyWithImpl;
@useResult
$Res call({
 Section section
});


$SectionCopyWith<$Res> get section;

}
/// @nodoc
class __$BookmarkSectionCopyWithImpl<$Res>
    implements _$BookmarkSectionCopyWith<$Res> {
  __$BookmarkSectionCopyWithImpl(this._self, this._then);

  final _BookmarkSection _self;
  final $Res Function(_BookmarkSection) _then;

/// Create a copy of WebsocketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? section = null,}) {
  return _then(_BookmarkSection(
section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section,
  ));
}

/// Create a copy of WebsocketEvent
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


class _Disconnect with DiagnosticableTreeMixin implements WebsocketEvent {
  const _Disconnect();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'WebsocketEvent.disconnect'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Disconnect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'WebsocketEvent.disconnect()';
}


}




// dart format on
