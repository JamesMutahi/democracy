// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'petition_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PetitionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetitionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetitionEvent()';
}


}

/// @nodoc
class $PetitionEventCopyWith<$Res>  {
$PetitionEventCopyWith(PetitionEvent _, $Res Function(PetitionEvent) __);
}


/// Adds pattern-matching-related methods to [PetitionEvent].
extension PetitionEventPatterns on PetitionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Load value)?  load,TResult Function( _Loaded value)?  loaded,TResult Function( _DetailUpdated value)?  detailUpdated,TResult Function( _SupportUpdated value)?  supportUpdated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _Loaded() when loaded != null:
return loaded(_that);case _DetailUpdated() when detailUpdated != null:
return detailUpdated(_that);case _SupportUpdated() when supportUpdated != null:
return supportUpdated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Load value)  load,required TResult Function( _Loaded value)  loaded,required TResult Function( _DetailUpdated value)  detailUpdated,required TResult Function( _SupportUpdated value)  supportUpdated,}){
final _that = this;
switch (_that) {
case _Load():
return load(_that);case _Loaded():
return loaded(_that);case _DetailUpdated():
return detailUpdated(_that);case _SupportUpdated():
return supportUpdated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Load value)?  load,TResult? Function( _Loaded value)?  loaded,TResult? Function( _DetailUpdated value)?  detailUpdated,TResult? Function( _SupportUpdated value)?  supportUpdated,}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _Loaded() when loaded != null:
return loaded(_that);case _DetailUpdated() when detailUpdated != null:
return detailUpdated(_that);case _SupportUpdated() when supportUpdated != null:
return supportUpdated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int petitionId)?  load,TResult Function( Map<String, dynamic> payload)?  loaded,TResult Function( String title,  String description,  County? county,  Constituency? constituency,  Ward? ward,  int supporters,  List<SimpleUser> recentSupporters,  String image,  String? video,  int views,  bool isOpen,  bool isActive)?  detailUpdated,TResult Function( bool isSupported,  int supporters)?  supportUpdated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that.petitionId);case _Loaded() when loaded != null:
return loaded(_that.payload);case _DetailUpdated() when detailUpdated != null:
return detailUpdated(_that.title,_that.description,_that.county,_that.constituency,_that.ward,_that.supporters,_that.recentSupporters,_that.image,_that.video,_that.views,_that.isOpen,_that.isActive);case _SupportUpdated() when supportUpdated != null:
return supportUpdated(_that.isSupported,_that.supporters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int petitionId)  load,required TResult Function( Map<String, dynamic> payload)  loaded,required TResult Function( String title,  String description,  County? county,  Constituency? constituency,  Ward? ward,  int supporters,  List<SimpleUser> recentSupporters,  String image,  String? video,  int views,  bool isOpen,  bool isActive)  detailUpdated,required TResult Function( bool isSupported,  int supporters)  supportUpdated,}) {final _that = this;
switch (_that) {
case _Load():
return load(_that.petitionId);case _Loaded():
return loaded(_that.payload);case _DetailUpdated():
return detailUpdated(_that.title,_that.description,_that.county,_that.constituency,_that.ward,_that.supporters,_that.recentSupporters,_that.image,_that.video,_that.views,_that.isOpen,_that.isActive);case _SupportUpdated():
return supportUpdated(_that.isSupported,_that.supporters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int petitionId)?  load,TResult? Function( Map<String, dynamic> payload)?  loaded,TResult? Function( String title,  String description,  County? county,  Constituency? constituency,  Ward? ward,  int supporters,  List<SimpleUser> recentSupporters,  String image,  String? video,  int views,  bool isOpen,  bool isActive)?  detailUpdated,TResult? Function( bool isSupported,  int supporters)?  supportUpdated,}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that.petitionId);case _Loaded() when loaded != null:
return loaded(_that.payload);case _DetailUpdated() when detailUpdated != null:
return detailUpdated(_that.title,_that.description,_that.county,_that.constituency,_that.ward,_that.supporters,_that.recentSupporters,_that.image,_that.video,_that.views,_that.isOpen,_that.isActive);case _SupportUpdated() when supportUpdated != null:
return supportUpdated(_that.isSupported,_that.supporters);case _:
  return null;

}
}

}

/// @nodoc


class _Load implements PetitionEvent {
  const _Load({required this.petitionId});
  

 final  int petitionId;

/// Create a copy of PetitionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadCopyWith<_Load> get copyWith => __$LoadCopyWithImpl<_Load>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Load&&(identical(other.petitionId, petitionId) || other.petitionId == petitionId));
}


@override
int get hashCode => Object.hash(runtimeType,petitionId);

@override
String toString() {
  return 'PetitionEvent.load(petitionId: $petitionId)';
}


}

/// @nodoc
abstract mixin class _$LoadCopyWith<$Res> implements $PetitionEventCopyWith<$Res> {
  factory _$LoadCopyWith(_Load value, $Res Function(_Load) _then) = __$LoadCopyWithImpl;
@useResult
$Res call({
 int petitionId
});




}
/// @nodoc
class __$LoadCopyWithImpl<$Res>
    implements _$LoadCopyWith<$Res> {
  __$LoadCopyWithImpl(this._self, this._then);

  final _Load _self;
  final $Res Function(_Load) _then;

/// Create a copy of PetitionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petitionId = null,}) {
  return _then(_Load(
petitionId: null == petitionId ? _self.petitionId : petitionId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Loaded implements PetitionEvent {
  const _Loaded({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of PetitionEvent
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
  return 'PetitionEvent.loaded(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $PetitionEventCopyWith<$Res> {
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

/// Create a copy of PetitionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Loaded(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _DetailUpdated implements PetitionEvent {
  const _DetailUpdated({required this.title, required this.description, required this.county, required this.constituency, required this.ward, required this.supporters, required final  List<SimpleUser> recentSupporters, required this.image, required this.video, required this.views, required this.isOpen, required this.isActive}): _recentSupporters = recentSupporters;
  

 final  String title;
 final  String description;
 final  County? county;
 final  Constituency? constituency;
 final  Ward? ward;
 final  int supporters;
 final  List<SimpleUser> _recentSupporters;
 List<SimpleUser> get recentSupporters {
  if (_recentSupporters is EqualUnmodifiableListView) return _recentSupporters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentSupporters);
}

 final  String image;
 final  String? video;
 final  int views;
 final  bool isOpen;
 final  bool isActive;

/// Create a copy of PetitionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailUpdatedCopyWith<_DetailUpdated> get copyWith => __$DetailUpdatedCopyWithImpl<_DetailUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailUpdated&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.county, county) || other.county == county)&&(identical(other.constituency, constituency) || other.constituency == constituency)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.supporters, supporters) || other.supporters == supporters)&&const DeepCollectionEquality().equals(other._recentSupporters, _recentSupporters)&&(identical(other.image, image) || other.image == image)&&(identical(other.video, video) || other.video == video)&&(identical(other.views, views) || other.views == views)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,county,constituency,ward,supporters,const DeepCollectionEquality().hash(_recentSupporters),image,video,views,isOpen,isActive);

@override
String toString() {
  return 'PetitionEvent.detailUpdated(title: $title, description: $description, county: $county, constituency: $constituency, ward: $ward, supporters: $supporters, recentSupporters: $recentSupporters, image: $image, video: $video, views: $views, isOpen: $isOpen, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$DetailUpdatedCopyWith<$Res> implements $PetitionEventCopyWith<$Res> {
  factory _$DetailUpdatedCopyWith(_DetailUpdated value, $Res Function(_DetailUpdated) _then) = __$DetailUpdatedCopyWithImpl;
@useResult
$Res call({
 String title, String description, County? county, Constituency? constituency, Ward? ward, int supporters, List<SimpleUser> recentSupporters, String image, String? video, int views, bool isOpen, bool isActive
});


$CountyCopyWith<$Res>? get county;$ConstituencyCopyWith<$Res>? get constituency;$WardCopyWith<$Res>? get ward;

}
/// @nodoc
class __$DetailUpdatedCopyWithImpl<$Res>
    implements _$DetailUpdatedCopyWith<$Res> {
  __$DetailUpdatedCopyWithImpl(this._self, this._then);

  final _DetailUpdated _self;
  final $Res Function(_DetailUpdated) _then;

/// Create a copy of PetitionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? county = freezed,Object? constituency = freezed,Object? ward = freezed,Object? supporters = null,Object? recentSupporters = null,Object? image = null,Object? video = freezed,Object? views = null,Object? isOpen = null,Object? isActive = null,}) {
  return _then(_DetailUpdated(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,county: freezed == county ? _self.county : county // ignore: cast_nullable_to_non_nullable
as County?,constituency: freezed == constituency ? _self.constituency : constituency // ignore: cast_nullable_to_non_nullable
as Constituency?,ward: freezed == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as Ward?,supporters: null == supporters ? _self.supporters : supporters // ignore: cast_nullable_to_non_nullable
as int,recentSupporters: null == recentSupporters ? _self._recentSupporters : recentSupporters // ignore: cast_nullable_to_non_nullable
as List<SimpleUser>,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,video: freezed == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as String?,views: null == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PetitionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountyCopyWith<$Res>? get county {
    if (_self.county == null) {
    return null;
  }

  return $CountyCopyWith<$Res>(_self.county!, (value) {
    return _then(_self.copyWith(county: value));
  });
}/// Create a copy of PetitionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConstituencyCopyWith<$Res>? get constituency {
    if (_self.constituency == null) {
    return null;
  }

  return $ConstituencyCopyWith<$Res>(_self.constituency!, (value) {
    return _then(_self.copyWith(constituency: value));
  });
}/// Create a copy of PetitionEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WardCopyWith<$Res>? get ward {
    if (_self.ward == null) {
    return null;
  }

  return $WardCopyWith<$Res>(_self.ward!, (value) {
    return _then(_self.copyWith(ward: value));
  });
}
}

/// @nodoc


class _SupportUpdated implements PetitionEvent {
  const _SupportUpdated({required this.isSupported, required this.supporters});
  

 final  bool isSupported;
 final  int supporters;

/// Create a copy of PetitionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportUpdatedCopyWith<_SupportUpdated> get copyWith => __$SupportUpdatedCopyWithImpl<_SupportUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportUpdated&&(identical(other.isSupported, isSupported) || other.isSupported == isSupported)&&(identical(other.supporters, supporters) || other.supporters == supporters));
}


@override
int get hashCode => Object.hash(runtimeType,isSupported,supporters);

@override
String toString() {
  return 'PetitionEvent.supportUpdated(isSupported: $isSupported, supporters: $supporters)';
}


}

/// @nodoc
abstract mixin class _$SupportUpdatedCopyWith<$Res> implements $PetitionEventCopyWith<$Res> {
  factory _$SupportUpdatedCopyWith(_SupportUpdated value, $Res Function(_SupportUpdated) _then) = __$SupportUpdatedCopyWithImpl;
@useResult
$Res call({
 bool isSupported, int supporters
});




}
/// @nodoc
class __$SupportUpdatedCopyWithImpl<$Res>
    implements _$SupportUpdatedCopyWith<$Res> {
  __$SupportUpdatedCopyWithImpl(this._self, this._then);

  final _SupportUpdated _self;
  final $Res Function(_SupportUpdated) _then;

/// Create a copy of PetitionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isSupported = null,Object? supporters = null,}) {
  return _then(_SupportUpdated(
isSupported: null == isSupported ? _self.isSupported : isSupported // ignore: cast_nullable_to_non_nullable
as bool,supporters: null == supporters ? _self.supporters : supporters // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
