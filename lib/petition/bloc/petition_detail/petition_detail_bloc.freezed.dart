// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'petition_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PetitionDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetitionDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetitionDetailState()';
}


}

/// @nodoc
class $PetitionDetailStateCopyWith<$Res>  {
$PetitionDetailStateCopyWith(PetitionDetailState _, $Res Function(PetitionDetailState) __);
}


/// Adds pattern-matching-related methods to [PetitionDetailState].
extension PetitionDetailStatePatterns on PetitionDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PetitionDetailInitial value)?  initial,TResult Function( PetitionDetailLoading value)?  loading,TResult Function( PetitionCreated value)?  created,TResult Function( PetitionLoaded value)?  loaded,TResult Function( PetitionUpdated value)?  updated,TResult Function( PetitionViewed value)?  viewed,TResult Function( PetitionClicked value)?  clicked,TResult Function( PetitionSupported value)?  supported,TResult Function( PetitionDeleted value)?  deleted,TResult Function( PetitionDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PetitionDetailInitial() when initial != null:
return initial(_that);case PetitionDetailLoading() when loading != null:
return loading(_that);case PetitionCreated() when created != null:
return created(_that);case PetitionLoaded() when loaded != null:
return loaded(_that);case PetitionUpdated() when updated != null:
return updated(_that);case PetitionViewed() when viewed != null:
return viewed(_that);case PetitionClicked() when clicked != null:
return clicked(_that);case PetitionSupported() when supported != null:
return supported(_that);case PetitionDeleted() when deleted != null:
return deleted(_that);case PetitionDetailFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PetitionDetailInitial value)  initial,required TResult Function( PetitionDetailLoading value)  loading,required TResult Function( PetitionCreated value)  created,required TResult Function( PetitionLoaded value)  loaded,required TResult Function( PetitionUpdated value)  updated,required TResult Function( PetitionViewed value)  viewed,required TResult Function( PetitionClicked value)  clicked,required TResult Function( PetitionSupported value)  supported,required TResult Function( PetitionDeleted value)  deleted,required TResult Function( PetitionDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case PetitionDetailInitial():
return initial(_that);case PetitionDetailLoading():
return loading(_that);case PetitionCreated():
return created(_that);case PetitionLoaded():
return loaded(_that);case PetitionUpdated():
return updated(_that);case PetitionViewed():
return viewed(_that);case PetitionClicked():
return clicked(_that);case PetitionSupported():
return supported(_that);case PetitionDeleted():
return deleted(_that);case PetitionDetailFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PetitionDetailInitial value)?  initial,TResult? Function( PetitionDetailLoading value)?  loading,TResult? Function( PetitionCreated value)?  created,TResult? Function( PetitionLoaded value)?  loaded,TResult? Function( PetitionUpdated value)?  updated,TResult? Function( PetitionViewed value)?  viewed,TResult? Function( PetitionClicked value)?  clicked,TResult? Function( PetitionSupported value)?  supported,TResult? Function( PetitionDeleted value)?  deleted,TResult? Function( PetitionDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case PetitionDetailInitial() when initial != null:
return initial(_that);case PetitionDetailLoading() when loading != null:
return loading(_that);case PetitionCreated() when created != null:
return created(_that);case PetitionLoaded() when loaded != null:
return loaded(_that);case PetitionUpdated() when updated != null:
return updated(_that);case PetitionViewed() when viewed != null:
return viewed(_that);case PetitionClicked() when clicked != null:
return clicked(_that);case PetitionSupported() when supported != null:
return supported(_that);case PetitionDeleted() when deleted != null:
return deleted(_that);case PetitionDetailFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Petition petition)?  created,TResult Function( Petition petition)?  loaded,TResult Function( int petitionId,  String title,  String description,  County? county,  Constituency? constituency,  Ward? ward,  int supporters,  List<SimpleUser> recentSupporters,  String image,  String? video,  int views,  bool isOpen,  bool isActive)?  updated,TResult Function( int petitionId)?  viewed,TResult Function( int petitionId)?  clicked,TResult Function( int petitionId,  bool isSupported,  int supporters)?  supported,TResult Function( int petitionId)?  deleted,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PetitionDetailInitial() when initial != null:
return initial();case PetitionDetailLoading() when loading != null:
return loading();case PetitionCreated() when created != null:
return created(_that.petition);case PetitionLoaded() when loaded != null:
return loaded(_that.petition);case PetitionUpdated() when updated != null:
return updated(_that.petitionId,_that.title,_that.description,_that.county,_that.constituency,_that.ward,_that.supporters,_that.recentSupporters,_that.image,_that.video,_that.views,_that.isOpen,_that.isActive);case PetitionViewed() when viewed != null:
return viewed(_that.petitionId);case PetitionClicked() when clicked != null:
return clicked(_that.petitionId);case PetitionSupported() when supported != null:
return supported(_that.petitionId,_that.isSupported,_that.supporters);case PetitionDeleted() when deleted != null:
return deleted(_that.petitionId);case PetitionDetailFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Petition petition)  created,required TResult Function( Petition petition)  loaded,required TResult Function( int petitionId,  String title,  String description,  County? county,  Constituency? constituency,  Ward? ward,  int supporters,  List<SimpleUser> recentSupporters,  String image,  String? video,  int views,  bool isOpen,  bool isActive)  updated,required TResult Function( int petitionId)  viewed,required TResult Function( int petitionId)  clicked,required TResult Function( int petitionId,  bool isSupported,  int supporters)  supported,required TResult Function( int petitionId)  deleted,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case PetitionDetailInitial():
return initial();case PetitionDetailLoading():
return loading();case PetitionCreated():
return created(_that.petition);case PetitionLoaded():
return loaded(_that.petition);case PetitionUpdated():
return updated(_that.petitionId,_that.title,_that.description,_that.county,_that.constituency,_that.ward,_that.supporters,_that.recentSupporters,_that.image,_that.video,_that.views,_that.isOpen,_that.isActive);case PetitionViewed():
return viewed(_that.petitionId);case PetitionClicked():
return clicked(_that.petitionId);case PetitionSupported():
return supported(_that.petitionId,_that.isSupported,_that.supporters);case PetitionDeleted():
return deleted(_that.petitionId);case PetitionDetailFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Petition petition)?  created,TResult? Function( Petition petition)?  loaded,TResult? Function( int petitionId,  String title,  String description,  County? county,  Constituency? constituency,  Ward? ward,  int supporters,  List<SimpleUser> recentSupporters,  String image,  String? video,  int views,  bool isOpen,  bool isActive)?  updated,TResult? Function( int petitionId)?  viewed,TResult? Function( int petitionId)?  clicked,TResult? Function( int petitionId,  bool isSupported,  int supporters)?  supported,TResult? Function( int petitionId)?  deleted,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case PetitionDetailInitial() when initial != null:
return initial();case PetitionDetailLoading() when loading != null:
return loading();case PetitionCreated() when created != null:
return created(_that.petition);case PetitionLoaded() when loaded != null:
return loaded(_that.petition);case PetitionUpdated() when updated != null:
return updated(_that.petitionId,_that.title,_that.description,_that.county,_that.constituency,_that.ward,_that.supporters,_that.recentSupporters,_that.image,_that.video,_that.views,_that.isOpen,_that.isActive);case PetitionViewed() when viewed != null:
return viewed(_that.petitionId);case PetitionClicked() when clicked != null:
return clicked(_that.petitionId);case PetitionSupported() when supported != null:
return supported(_that.petitionId,_that.isSupported,_that.supporters);case PetitionDeleted() when deleted != null:
return deleted(_that.petitionId);case PetitionDetailFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class PetitionDetailInitial implements PetitionDetailState {
  const PetitionDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetitionDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetitionDetailState.initial()';
}


}




/// @nodoc


class PetitionDetailLoading implements PetitionDetailState {
  const PetitionDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetitionDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetitionDetailState.loading()';
}


}




/// @nodoc


class PetitionCreated implements PetitionDetailState {
  const PetitionCreated({required this.petition});
  

 final  Petition petition;

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetitionCreatedCopyWith<PetitionCreated> get copyWith => _$PetitionCreatedCopyWithImpl<PetitionCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetitionCreated&&(identical(other.petition, petition) || other.petition == petition));
}


@override
int get hashCode => Object.hash(runtimeType,petition);

@override
String toString() {
  return 'PetitionDetailState.created(petition: $petition)';
}


}

/// @nodoc
abstract mixin class $PetitionCreatedCopyWith<$Res> implements $PetitionDetailStateCopyWith<$Res> {
  factory $PetitionCreatedCopyWith(PetitionCreated value, $Res Function(PetitionCreated) _then) = _$PetitionCreatedCopyWithImpl;
@useResult
$Res call({
 Petition petition
});


$PetitionCopyWith<$Res> get petition;

}
/// @nodoc
class _$PetitionCreatedCopyWithImpl<$Res>
    implements $PetitionCreatedCopyWith<$Res> {
  _$PetitionCreatedCopyWithImpl(this._self, this._then);

  final PetitionCreated _self;
  final $Res Function(PetitionCreated) _then;

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petition = null,}) {
  return _then(PetitionCreated(
petition: null == petition ? _self.petition : petition // ignore: cast_nullable_to_non_nullable
as Petition,
  ));
}

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetitionCopyWith<$Res> get petition {
  
  return $PetitionCopyWith<$Res>(_self.petition, (value) {
    return _then(_self.copyWith(petition: value));
  });
}
}

/// @nodoc


class PetitionLoaded implements PetitionDetailState {
  const PetitionLoaded({required this.petition});
  

 final  Petition petition;

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetitionLoadedCopyWith<PetitionLoaded> get copyWith => _$PetitionLoadedCopyWithImpl<PetitionLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetitionLoaded&&(identical(other.petition, petition) || other.petition == petition));
}


@override
int get hashCode => Object.hash(runtimeType,petition);

@override
String toString() {
  return 'PetitionDetailState.loaded(petition: $petition)';
}


}

/// @nodoc
abstract mixin class $PetitionLoadedCopyWith<$Res> implements $PetitionDetailStateCopyWith<$Res> {
  factory $PetitionLoadedCopyWith(PetitionLoaded value, $Res Function(PetitionLoaded) _then) = _$PetitionLoadedCopyWithImpl;
@useResult
$Res call({
 Petition petition
});


$PetitionCopyWith<$Res> get petition;

}
/// @nodoc
class _$PetitionLoadedCopyWithImpl<$Res>
    implements $PetitionLoadedCopyWith<$Res> {
  _$PetitionLoadedCopyWithImpl(this._self, this._then);

  final PetitionLoaded _self;
  final $Res Function(PetitionLoaded) _then;

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petition = null,}) {
  return _then(PetitionLoaded(
petition: null == petition ? _self.petition : petition // ignore: cast_nullable_to_non_nullable
as Petition,
  ));
}

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetitionCopyWith<$Res> get petition {
  
  return $PetitionCopyWith<$Res>(_self.petition, (value) {
    return _then(_self.copyWith(petition: value));
  });
}
}

/// @nodoc


class PetitionUpdated implements PetitionDetailState {
  const PetitionUpdated({required this.petitionId, required this.title, required this.description, required this.county, required this.constituency, required this.ward, required this.supporters, required final  List<SimpleUser> recentSupporters, required this.image, required this.video, required this.views, required this.isOpen, required this.isActive}): _recentSupporters = recentSupporters;
  

 final  int petitionId;
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

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetitionUpdatedCopyWith<PetitionUpdated> get copyWith => _$PetitionUpdatedCopyWithImpl<PetitionUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetitionUpdated&&(identical(other.petitionId, petitionId) || other.petitionId == petitionId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.county, county) || other.county == county)&&(identical(other.constituency, constituency) || other.constituency == constituency)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.supporters, supporters) || other.supporters == supporters)&&const DeepCollectionEquality().equals(other._recentSupporters, _recentSupporters)&&(identical(other.image, image) || other.image == image)&&(identical(other.video, video) || other.video == video)&&(identical(other.views, views) || other.views == views)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,petitionId,title,description,county,constituency,ward,supporters,const DeepCollectionEquality().hash(_recentSupporters),image,video,views,isOpen,isActive);

@override
String toString() {
  return 'PetitionDetailState.updated(petitionId: $petitionId, title: $title, description: $description, county: $county, constituency: $constituency, ward: $ward, supporters: $supporters, recentSupporters: $recentSupporters, image: $image, video: $video, views: $views, isOpen: $isOpen, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $PetitionUpdatedCopyWith<$Res> implements $PetitionDetailStateCopyWith<$Res> {
  factory $PetitionUpdatedCopyWith(PetitionUpdated value, $Res Function(PetitionUpdated) _then) = _$PetitionUpdatedCopyWithImpl;
@useResult
$Res call({
 int petitionId, String title, String description, County? county, Constituency? constituency, Ward? ward, int supporters, List<SimpleUser> recentSupporters, String image, String? video, int views, bool isOpen, bool isActive
});


$CountyCopyWith<$Res>? get county;$ConstituencyCopyWith<$Res>? get constituency;$WardCopyWith<$Res>? get ward;

}
/// @nodoc
class _$PetitionUpdatedCopyWithImpl<$Res>
    implements $PetitionUpdatedCopyWith<$Res> {
  _$PetitionUpdatedCopyWithImpl(this._self, this._then);

  final PetitionUpdated _self;
  final $Res Function(PetitionUpdated) _then;

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petitionId = null,Object? title = null,Object? description = null,Object? county = freezed,Object? constituency = freezed,Object? ward = freezed,Object? supporters = null,Object? recentSupporters = null,Object? image = null,Object? video = freezed,Object? views = null,Object? isOpen = null,Object? isActive = null,}) {
  return _then(PetitionUpdated(
petitionId: null == petitionId ? _self.petitionId : petitionId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
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

/// Create a copy of PetitionDetailState
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
}/// Create a copy of PetitionDetailState
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
}/// Create a copy of PetitionDetailState
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


class PetitionViewed implements PetitionDetailState {
  const PetitionViewed({required this.petitionId});
  

 final  int petitionId;

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetitionViewedCopyWith<PetitionViewed> get copyWith => _$PetitionViewedCopyWithImpl<PetitionViewed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetitionViewed&&(identical(other.petitionId, petitionId) || other.petitionId == petitionId));
}


@override
int get hashCode => Object.hash(runtimeType,petitionId);

@override
String toString() {
  return 'PetitionDetailState.viewed(petitionId: $petitionId)';
}


}

/// @nodoc
abstract mixin class $PetitionViewedCopyWith<$Res> implements $PetitionDetailStateCopyWith<$Res> {
  factory $PetitionViewedCopyWith(PetitionViewed value, $Res Function(PetitionViewed) _then) = _$PetitionViewedCopyWithImpl;
@useResult
$Res call({
 int petitionId
});




}
/// @nodoc
class _$PetitionViewedCopyWithImpl<$Res>
    implements $PetitionViewedCopyWith<$Res> {
  _$PetitionViewedCopyWithImpl(this._self, this._then);

  final PetitionViewed _self;
  final $Res Function(PetitionViewed) _then;

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petitionId = null,}) {
  return _then(PetitionViewed(
petitionId: null == petitionId ? _self.petitionId : petitionId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class PetitionClicked implements PetitionDetailState {
  const PetitionClicked({required this.petitionId});
  

 final  int petitionId;

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetitionClickedCopyWith<PetitionClicked> get copyWith => _$PetitionClickedCopyWithImpl<PetitionClicked>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetitionClicked&&(identical(other.petitionId, petitionId) || other.petitionId == petitionId));
}


@override
int get hashCode => Object.hash(runtimeType,petitionId);

@override
String toString() {
  return 'PetitionDetailState.clicked(petitionId: $petitionId)';
}


}

/// @nodoc
abstract mixin class $PetitionClickedCopyWith<$Res> implements $PetitionDetailStateCopyWith<$Res> {
  factory $PetitionClickedCopyWith(PetitionClicked value, $Res Function(PetitionClicked) _then) = _$PetitionClickedCopyWithImpl;
@useResult
$Res call({
 int petitionId
});




}
/// @nodoc
class _$PetitionClickedCopyWithImpl<$Res>
    implements $PetitionClickedCopyWith<$Res> {
  _$PetitionClickedCopyWithImpl(this._self, this._then);

  final PetitionClicked _self;
  final $Res Function(PetitionClicked) _then;

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petitionId = null,}) {
  return _then(PetitionClicked(
petitionId: null == petitionId ? _self.petitionId : petitionId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class PetitionSupported implements PetitionDetailState {
  const PetitionSupported({required this.petitionId, required this.isSupported, required this.supporters});
  

 final  int petitionId;
 final  bool isSupported;
 final  int supporters;

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetitionSupportedCopyWith<PetitionSupported> get copyWith => _$PetitionSupportedCopyWithImpl<PetitionSupported>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetitionSupported&&(identical(other.petitionId, petitionId) || other.petitionId == petitionId)&&(identical(other.isSupported, isSupported) || other.isSupported == isSupported)&&(identical(other.supporters, supporters) || other.supporters == supporters));
}


@override
int get hashCode => Object.hash(runtimeType,petitionId,isSupported,supporters);

@override
String toString() {
  return 'PetitionDetailState.supported(petitionId: $petitionId, isSupported: $isSupported, supporters: $supporters)';
}


}

/// @nodoc
abstract mixin class $PetitionSupportedCopyWith<$Res> implements $PetitionDetailStateCopyWith<$Res> {
  factory $PetitionSupportedCopyWith(PetitionSupported value, $Res Function(PetitionSupported) _then) = _$PetitionSupportedCopyWithImpl;
@useResult
$Res call({
 int petitionId, bool isSupported, int supporters
});




}
/// @nodoc
class _$PetitionSupportedCopyWithImpl<$Res>
    implements $PetitionSupportedCopyWith<$Res> {
  _$PetitionSupportedCopyWithImpl(this._self, this._then);

  final PetitionSupported _self;
  final $Res Function(PetitionSupported) _then;

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petitionId = null,Object? isSupported = null,Object? supporters = null,}) {
  return _then(PetitionSupported(
petitionId: null == petitionId ? _self.petitionId : petitionId // ignore: cast_nullable_to_non_nullable
as int,isSupported: null == isSupported ? _self.isSupported : isSupported // ignore: cast_nullable_to_non_nullable
as bool,supporters: null == supporters ? _self.supporters : supporters // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class PetitionDeleted implements PetitionDetailState {
  const PetitionDeleted({required this.petitionId});
  

 final  int petitionId;

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetitionDeletedCopyWith<PetitionDeleted> get copyWith => _$PetitionDeletedCopyWithImpl<PetitionDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetitionDeleted&&(identical(other.petitionId, petitionId) || other.petitionId == petitionId));
}


@override
int get hashCode => Object.hash(runtimeType,petitionId);

@override
String toString() {
  return 'PetitionDetailState.deleted(petitionId: $petitionId)';
}


}

/// @nodoc
abstract mixin class $PetitionDeletedCopyWith<$Res> implements $PetitionDetailStateCopyWith<$Res> {
  factory $PetitionDeletedCopyWith(PetitionDeleted value, $Res Function(PetitionDeleted) _then) = _$PetitionDeletedCopyWithImpl;
@useResult
$Res call({
 int petitionId
});




}
/// @nodoc
class _$PetitionDeletedCopyWithImpl<$Res>
    implements $PetitionDeletedCopyWith<$Res> {
  _$PetitionDeletedCopyWithImpl(this._self, this._then);

  final PetitionDeleted _self;
  final $Res Function(PetitionDeleted) _then;

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petitionId = null,}) {
  return _then(PetitionDeleted(
petitionId: null == petitionId ? _self.petitionId : petitionId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class PetitionDetailFailure implements PetitionDetailState {
  const PetitionDetailFailure({required this.error});
  

 final  String error;

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetitionDetailFailureCopyWith<PetitionDetailFailure> get copyWith => _$PetitionDetailFailureCopyWithImpl<PetitionDetailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetitionDetailFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'PetitionDetailState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $PetitionDetailFailureCopyWith<$Res> implements $PetitionDetailStateCopyWith<$Res> {
  factory $PetitionDetailFailureCopyWith(PetitionDetailFailure value, $Res Function(PetitionDetailFailure) _then) = _$PetitionDetailFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$PetitionDetailFailureCopyWithImpl<$Res>
    implements $PetitionDetailFailureCopyWith<$Res> {
  _$PetitionDetailFailureCopyWithImpl(this._self, this._then);

  final PetitionDetailFailure _self;
  final $Res Function(PetitionDetailFailure) _then;

/// Create a copy of PetitionDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(PetitionDetailFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$PetitionDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetitionDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetitionDetailEvent()';
}


}

/// @nodoc
class $PetitionDetailEventCopyWith<$Res>  {
$PetitionDetailEventCopyWith(PetitionDetailEvent _, $Res Function(PetitionDetailEvent) __);
}


/// Adds pattern-matching-related methods to [PetitionDetailEvent].
extension PetitionDetailEventPatterns on PetitionDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Created value)?  created,TResult Function( _Loaded value)?  loaded,TResult Function( _Updated value)?  updated,TResult Function( _ViewAdded value)?  viewAdded,TResult Function( _ClickAdded value)?  clickAdded,TResult Function( _Deleted value)?  deleted,TResult Function( _Create value)?  create,TResult Function( _Retrieve value)?  retrieve,TResult Function( _Support value)?  support,TResult Function( _AddView value)?  addView,TResult Function( _AddClick value)?  addClick,TResult Function( _ChangeStatus value)?  changeStatus,TResult Function( _Supported value)?  supported,TResult Function( _Unsubscribe value)?  unsubscribe,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Updated() when updated != null:
return updated(_that);case _ViewAdded() when viewAdded != null:
return viewAdded(_that);case _ClickAdded() when clickAdded != null:
return clickAdded(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Create() when create != null:
return create(_that);case _Retrieve() when retrieve != null:
return retrieve(_that);case _Support() when support != null:
return support(_that);case _AddView() when addView != null:
return addView(_that);case _AddClick() when addClick != null:
return addClick(_that);case _ChangeStatus() when changeStatus != null:
return changeStatus(_that);case _Supported() when supported != null:
return supported(_that);case _Unsubscribe() when unsubscribe != null:
return unsubscribe(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Created value)  created,required TResult Function( _Loaded value)  loaded,required TResult Function( _Updated value)  updated,required TResult Function( _ViewAdded value)  viewAdded,required TResult Function( _ClickAdded value)  clickAdded,required TResult Function( _Deleted value)  deleted,required TResult Function( _Create value)  create,required TResult Function( _Retrieve value)  retrieve,required TResult Function( _Support value)  support,required TResult Function( _AddView value)  addView,required TResult Function( _AddClick value)  addClick,required TResult Function( _ChangeStatus value)  changeStatus,required TResult Function( _Supported value)  supported,required TResult Function( _Unsubscribe value)  unsubscribe,}){
final _that = this;
switch (_that) {
case _Created():
return created(_that);case _Loaded():
return loaded(_that);case _Updated():
return updated(_that);case _ViewAdded():
return viewAdded(_that);case _ClickAdded():
return clickAdded(_that);case _Deleted():
return deleted(_that);case _Create():
return create(_that);case _Retrieve():
return retrieve(_that);case _Support():
return support(_that);case _AddView():
return addView(_that);case _AddClick():
return addClick(_that);case _ChangeStatus():
return changeStatus(_that);case _Supported():
return supported(_that);case _Unsubscribe():
return unsubscribe(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Created value)?  created,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Updated value)?  updated,TResult? Function( _ViewAdded value)?  viewAdded,TResult? Function( _ClickAdded value)?  clickAdded,TResult? Function( _Deleted value)?  deleted,TResult? Function( _Create value)?  create,TResult? Function( _Retrieve value)?  retrieve,TResult? Function( _Support value)?  support,TResult? Function( _AddView value)?  addView,TResult? Function( _AddClick value)?  addClick,TResult? Function( _ChangeStatus value)?  changeStatus,TResult? Function( _Supported value)?  supported,TResult? Function( _Unsubscribe value)?  unsubscribe,}){
final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Updated() when updated != null:
return updated(_that);case _ViewAdded() when viewAdded != null:
return viewAdded(_that);case _ClickAdded() when clickAdded != null:
return clickAdded(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Create() when create != null:
return create(_that);case _Retrieve() when retrieve != null:
return retrieve(_that);case _Support() when support != null:
return support(_that);case _AddView() when addView != null:
return addView(_that);case _AddClick() when addClick != null:
return addClick(_that);case _ChangeStatus() when changeStatus != null:
return changeStatus(_that);case _Supported() when supported != null:
return supported(_that);case _Unsubscribe() when unsubscribe != null:
return unsubscribe(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Map<String, dynamic> payload)?  created,TResult Function( Map<String, dynamic> payload)?  loaded,TResult Function( Map<String, dynamic> payload)?  updated,TResult Function( Map<String, dynamic> payload)?  viewAdded,TResult Function( Map<String, dynamic> payload)?  clickAdded,TResult Function( Map<String, dynamic> payload)?  deleted,TResult Function( String title,  String imagePath,  String description,  County? county,  Constituency? constituency,  Ward? ward)?  create,TResult Function( Petition petition)?  retrieve,TResult Function( Petition petition)?  support,TResult Function( Petition petition)?  addView,TResult Function( Petition petition)?  addClick,TResult Function( Petition petition)?  changeStatus,TResult Function( Map<String, dynamic> payload)?  supported,TResult Function( Petition petition)?  unsubscribe,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that.payload);case _Loaded() when loaded != null:
return loaded(_that.payload);case _Updated() when updated != null:
return updated(_that.payload);case _ViewAdded() when viewAdded != null:
return viewAdded(_that.payload);case _ClickAdded() when clickAdded != null:
return clickAdded(_that.payload);case _Deleted() when deleted != null:
return deleted(_that.payload);case _Create() when create != null:
return create(_that.title,_that.imagePath,_that.description,_that.county,_that.constituency,_that.ward);case _Retrieve() when retrieve != null:
return retrieve(_that.petition);case _Support() when support != null:
return support(_that.petition);case _AddView() when addView != null:
return addView(_that.petition);case _AddClick() when addClick != null:
return addClick(_that.petition);case _ChangeStatus() when changeStatus != null:
return changeStatus(_that.petition);case _Supported() when supported != null:
return supported(_that.payload);case _Unsubscribe() when unsubscribe != null:
return unsubscribe(_that.petition);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Map<String, dynamic> payload)  created,required TResult Function( Map<String, dynamic> payload)  loaded,required TResult Function( Map<String, dynamic> payload)  updated,required TResult Function( Map<String, dynamic> payload)  viewAdded,required TResult Function( Map<String, dynamic> payload)  clickAdded,required TResult Function( Map<String, dynamic> payload)  deleted,required TResult Function( String title,  String imagePath,  String description,  County? county,  Constituency? constituency,  Ward? ward)  create,required TResult Function( Petition petition)  retrieve,required TResult Function( Petition petition)  support,required TResult Function( Petition petition)  addView,required TResult Function( Petition petition)  addClick,required TResult Function( Petition petition)  changeStatus,required TResult Function( Map<String, dynamic> payload)  supported,required TResult Function( Petition petition)  unsubscribe,}) {final _that = this;
switch (_that) {
case _Created():
return created(_that.payload);case _Loaded():
return loaded(_that.payload);case _Updated():
return updated(_that.payload);case _ViewAdded():
return viewAdded(_that.payload);case _ClickAdded():
return clickAdded(_that.payload);case _Deleted():
return deleted(_that.payload);case _Create():
return create(_that.title,_that.imagePath,_that.description,_that.county,_that.constituency,_that.ward);case _Retrieve():
return retrieve(_that.petition);case _Support():
return support(_that.petition);case _AddView():
return addView(_that.petition);case _AddClick():
return addClick(_that.petition);case _ChangeStatus():
return changeStatus(_that.petition);case _Supported():
return supported(_that.payload);case _Unsubscribe():
return unsubscribe(_that.petition);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Map<String, dynamic> payload)?  created,TResult? Function( Map<String, dynamic> payload)?  loaded,TResult? Function( Map<String, dynamic> payload)?  updated,TResult? Function( Map<String, dynamic> payload)?  viewAdded,TResult? Function( Map<String, dynamic> payload)?  clickAdded,TResult? Function( Map<String, dynamic> payload)?  deleted,TResult? Function( String title,  String imagePath,  String description,  County? county,  Constituency? constituency,  Ward? ward)?  create,TResult? Function( Petition petition)?  retrieve,TResult? Function( Petition petition)?  support,TResult? Function( Petition petition)?  addView,TResult? Function( Petition petition)?  addClick,TResult? Function( Petition petition)?  changeStatus,TResult? Function( Map<String, dynamic> payload)?  supported,TResult? Function( Petition petition)?  unsubscribe,}) {final _that = this;
switch (_that) {
case _Created() when created != null:
return created(_that.payload);case _Loaded() when loaded != null:
return loaded(_that.payload);case _Updated() when updated != null:
return updated(_that.payload);case _ViewAdded() when viewAdded != null:
return viewAdded(_that.payload);case _ClickAdded() when clickAdded != null:
return clickAdded(_that.payload);case _Deleted() when deleted != null:
return deleted(_that.payload);case _Create() when create != null:
return create(_that.title,_that.imagePath,_that.description,_that.county,_that.constituency,_that.ward);case _Retrieve() when retrieve != null:
return retrieve(_that.petition);case _Support() when support != null:
return support(_that.petition);case _AddView() when addView != null:
return addView(_that.petition);case _AddClick() when addClick != null:
return addClick(_that.petition);case _ChangeStatus() when changeStatus != null:
return changeStatus(_that.petition);case _Supported() when supported != null:
return supported(_that.payload);case _Unsubscribe() when unsubscribe != null:
return unsubscribe(_that.petition);case _:
  return null;

}
}

}

/// @nodoc


class _Created implements PetitionDetailEvent {
  const _Created({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatedCopyWith<_Created> get copyWith => __$CreatedCopyWithImpl<_Created>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Created&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'PetitionDetailEvent.created(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$CreatedCopyWith<$Res> implements $PetitionDetailEventCopyWith<$Res> {
  factory _$CreatedCopyWith(_Created value, $Res Function(_Created) _then) = __$CreatedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$CreatedCopyWithImpl<$Res>
    implements _$CreatedCopyWith<$Res> {
  __$CreatedCopyWithImpl(this._self, this._then);

  final _Created _self;
  final $Res Function(_Created) _then;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Created(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Loaded implements PetitionDetailEvent {
  const _Loaded({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of PetitionDetailEvent
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
  return 'PetitionDetailEvent.loaded(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $PetitionDetailEventCopyWith<$Res> {
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

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Loaded(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Updated implements PetitionDetailEvent {
  const _Updated({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatedCopyWith<_Updated> get copyWith => __$UpdatedCopyWithImpl<_Updated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Updated&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'PetitionDetailEvent.updated(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$UpdatedCopyWith<$Res> implements $PetitionDetailEventCopyWith<$Res> {
  factory _$UpdatedCopyWith(_Updated value, $Res Function(_Updated) _then) = __$UpdatedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$UpdatedCopyWithImpl<$Res>
    implements _$UpdatedCopyWith<$Res> {
  __$UpdatedCopyWithImpl(this._self, this._then);

  final _Updated _self;
  final $Res Function(_Updated) _then;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Updated(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _ViewAdded implements PetitionDetailEvent {
  const _ViewAdded({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViewAddedCopyWith<_ViewAdded> get copyWith => __$ViewAddedCopyWithImpl<_ViewAdded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewAdded&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'PetitionDetailEvent.viewAdded(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$ViewAddedCopyWith<$Res> implements $PetitionDetailEventCopyWith<$Res> {
  factory _$ViewAddedCopyWith(_ViewAdded value, $Res Function(_ViewAdded) _then) = __$ViewAddedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$ViewAddedCopyWithImpl<$Res>
    implements _$ViewAddedCopyWith<$Res> {
  __$ViewAddedCopyWithImpl(this._self, this._then);

  final _ViewAdded _self;
  final $Res Function(_ViewAdded) _then;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_ViewAdded(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _ClickAdded implements PetitionDetailEvent {
  const _ClickAdded({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClickAddedCopyWith<_ClickAdded> get copyWith => __$ClickAddedCopyWithImpl<_ClickAdded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClickAdded&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'PetitionDetailEvent.clickAdded(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$ClickAddedCopyWith<$Res> implements $PetitionDetailEventCopyWith<$Res> {
  factory _$ClickAddedCopyWith(_ClickAdded value, $Res Function(_ClickAdded) _then) = __$ClickAddedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$ClickAddedCopyWithImpl<$Res>
    implements _$ClickAddedCopyWith<$Res> {
  __$ClickAddedCopyWithImpl(this._self, this._then);

  final _ClickAdded _self;
  final $Res Function(_ClickAdded) _then;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_ClickAdded(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Deleted implements PetitionDetailEvent {
  const _Deleted({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletedCopyWith<_Deleted> get copyWith => __$DeletedCopyWithImpl<_Deleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Deleted&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'PetitionDetailEvent.deleted(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$DeletedCopyWith<$Res> implements $PetitionDetailEventCopyWith<$Res> {
  factory _$DeletedCopyWith(_Deleted value, $Res Function(_Deleted) _then) = __$DeletedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$DeletedCopyWithImpl<$Res>
    implements _$DeletedCopyWith<$Res> {
  __$DeletedCopyWithImpl(this._self, this._then);

  final _Deleted _self;
  final $Res Function(_Deleted) _then;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Deleted(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Create implements PetitionDetailEvent {
  const _Create({required this.title, required this.imagePath, required this.description, required this.county, required this.constituency, required this.ward});
  

 final  String title;
 final  String imagePath;
 final  String description;
 final  County? county;
 final  Constituency? constituency;
 final  Ward? ward;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCopyWith<_Create> get copyWith => __$CreateCopyWithImpl<_Create>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Create&&(identical(other.title, title) || other.title == title)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.description, description) || other.description == description)&&(identical(other.county, county) || other.county == county)&&(identical(other.constituency, constituency) || other.constituency == constituency)&&(identical(other.ward, ward) || other.ward == ward));
}


@override
int get hashCode => Object.hash(runtimeType,title,imagePath,description,county,constituency,ward);

@override
String toString() {
  return 'PetitionDetailEvent.create(title: $title, imagePath: $imagePath, description: $description, county: $county, constituency: $constituency, ward: $ward)';
}


}

/// @nodoc
abstract mixin class _$CreateCopyWith<$Res> implements $PetitionDetailEventCopyWith<$Res> {
  factory _$CreateCopyWith(_Create value, $Res Function(_Create) _then) = __$CreateCopyWithImpl;
@useResult
$Res call({
 String title, String imagePath, String description, County? county, Constituency? constituency, Ward? ward
});


$CountyCopyWith<$Res>? get county;$ConstituencyCopyWith<$Res>? get constituency;$WardCopyWith<$Res>? get ward;

}
/// @nodoc
class __$CreateCopyWithImpl<$Res>
    implements _$CreateCopyWith<$Res> {
  __$CreateCopyWithImpl(this._self, this._then);

  final _Create _self;
  final $Res Function(_Create) _then;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? imagePath = null,Object? description = null,Object? county = freezed,Object? constituency = freezed,Object? ward = freezed,}) {
  return _then(_Create(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,county: freezed == county ? _self.county : county // ignore: cast_nullable_to_non_nullable
as County?,constituency: freezed == constituency ? _self.constituency : constituency // ignore: cast_nullable_to_non_nullable
as Constituency?,ward: freezed == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as Ward?,
  ));
}

/// Create a copy of PetitionDetailEvent
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
}/// Create a copy of PetitionDetailEvent
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
}/// Create a copy of PetitionDetailEvent
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


class _Retrieve implements PetitionDetailEvent {
  const _Retrieve({required this.petition});
  

 final  Petition petition;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RetrieveCopyWith<_Retrieve> get copyWith => __$RetrieveCopyWithImpl<_Retrieve>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Retrieve&&(identical(other.petition, petition) || other.petition == petition));
}


@override
int get hashCode => Object.hash(runtimeType,petition);

@override
String toString() {
  return 'PetitionDetailEvent.retrieve(petition: $petition)';
}


}

/// @nodoc
abstract mixin class _$RetrieveCopyWith<$Res> implements $PetitionDetailEventCopyWith<$Res> {
  factory _$RetrieveCopyWith(_Retrieve value, $Res Function(_Retrieve) _then) = __$RetrieveCopyWithImpl;
@useResult
$Res call({
 Petition petition
});


$PetitionCopyWith<$Res> get petition;

}
/// @nodoc
class __$RetrieveCopyWithImpl<$Res>
    implements _$RetrieveCopyWith<$Res> {
  __$RetrieveCopyWithImpl(this._self, this._then);

  final _Retrieve _self;
  final $Res Function(_Retrieve) _then;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petition = null,}) {
  return _then(_Retrieve(
petition: null == petition ? _self.petition : petition // ignore: cast_nullable_to_non_nullable
as Petition,
  ));
}

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetitionCopyWith<$Res> get petition {
  
  return $PetitionCopyWith<$Res>(_self.petition, (value) {
    return _then(_self.copyWith(petition: value));
  });
}
}

/// @nodoc


class _Support implements PetitionDetailEvent {
  const _Support({required this.petition});
  

 final  Petition petition;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportCopyWith<_Support> get copyWith => __$SupportCopyWithImpl<_Support>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Support&&(identical(other.petition, petition) || other.petition == petition));
}


@override
int get hashCode => Object.hash(runtimeType,petition);

@override
String toString() {
  return 'PetitionDetailEvent.support(petition: $petition)';
}


}

/// @nodoc
abstract mixin class _$SupportCopyWith<$Res> implements $PetitionDetailEventCopyWith<$Res> {
  factory _$SupportCopyWith(_Support value, $Res Function(_Support) _then) = __$SupportCopyWithImpl;
@useResult
$Res call({
 Petition petition
});


$PetitionCopyWith<$Res> get petition;

}
/// @nodoc
class __$SupportCopyWithImpl<$Res>
    implements _$SupportCopyWith<$Res> {
  __$SupportCopyWithImpl(this._self, this._then);

  final _Support _self;
  final $Res Function(_Support) _then;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petition = null,}) {
  return _then(_Support(
petition: null == petition ? _self.petition : petition // ignore: cast_nullable_to_non_nullable
as Petition,
  ));
}

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetitionCopyWith<$Res> get petition {
  
  return $PetitionCopyWith<$Res>(_self.petition, (value) {
    return _then(_self.copyWith(petition: value));
  });
}
}

/// @nodoc


class _AddView implements PetitionDetailEvent {
  const _AddView({required this.petition});
  

 final  Petition petition;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddViewCopyWith<_AddView> get copyWith => __$AddViewCopyWithImpl<_AddView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddView&&(identical(other.petition, petition) || other.petition == petition));
}


@override
int get hashCode => Object.hash(runtimeType,petition);

@override
String toString() {
  return 'PetitionDetailEvent.addView(petition: $petition)';
}


}

/// @nodoc
abstract mixin class _$AddViewCopyWith<$Res> implements $PetitionDetailEventCopyWith<$Res> {
  factory _$AddViewCopyWith(_AddView value, $Res Function(_AddView) _then) = __$AddViewCopyWithImpl;
@useResult
$Res call({
 Petition petition
});


$PetitionCopyWith<$Res> get petition;

}
/// @nodoc
class __$AddViewCopyWithImpl<$Res>
    implements _$AddViewCopyWith<$Res> {
  __$AddViewCopyWithImpl(this._self, this._then);

  final _AddView _self;
  final $Res Function(_AddView) _then;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petition = null,}) {
  return _then(_AddView(
petition: null == petition ? _self.petition : petition // ignore: cast_nullable_to_non_nullable
as Petition,
  ));
}

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetitionCopyWith<$Res> get petition {
  
  return $PetitionCopyWith<$Res>(_self.petition, (value) {
    return _then(_self.copyWith(petition: value));
  });
}
}

/// @nodoc


class _AddClick implements PetitionDetailEvent {
  const _AddClick({required this.petition});
  

 final  Petition petition;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddClickCopyWith<_AddClick> get copyWith => __$AddClickCopyWithImpl<_AddClick>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddClick&&(identical(other.petition, petition) || other.petition == petition));
}


@override
int get hashCode => Object.hash(runtimeType,petition);

@override
String toString() {
  return 'PetitionDetailEvent.addClick(petition: $petition)';
}


}

/// @nodoc
abstract mixin class _$AddClickCopyWith<$Res> implements $PetitionDetailEventCopyWith<$Res> {
  factory _$AddClickCopyWith(_AddClick value, $Res Function(_AddClick) _then) = __$AddClickCopyWithImpl;
@useResult
$Res call({
 Petition petition
});


$PetitionCopyWith<$Res> get petition;

}
/// @nodoc
class __$AddClickCopyWithImpl<$Res>
    implements _$AddClickCopyWith<$Res> {
  __$AddClickCopyWithImpl(this._self, this._then);

  final _AddClick _self;
  final $Res Function(_AddClick) _then;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petition = null,}) {
  return _then(_AddClick(
petition: null == petition ? _self.petition : petition // ignore: cast_nullable_to_non_nullable
as Petition,
  ));
}

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetitionCopyWith<$Res> get petition {
  
  return $PetitionCopyWith<$Res>(_self.petition, (value) {
    return _then(_self.copyWith(petition: value));
  });
}
}

/// @nodoc


class _ChangeStatus implements PetitionDetailEvent {
  const _ChangeStatus({required this.petition});
  

 final  Petition petition;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeStatusCopyWith<_ChangeStatus> get copyWith => __$ChangeStatusCopyWithImpl<_ChangeStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeStatus&&(identical(other.petition, petition) || other.petition == petition));
}


@override
int get hashCode => Object.hash(runtimeType,petition);

@override
String toString() {
  return 'PetitionDetailEvent.changeStatus(petition: $petition)';
}


}

/// @nodoc
abstract mixin class _$ChangeStatusCopyWith<$Res> implements $PetitionDetailEventCopyWith<$Res> {
  factory _$ChangeStatusCopyWith(_ChangeStatus value, $Res Function(_ChangeStatus) _then) = __$ChangeStatusCopyWithImpl;
@useResult
$Res call({
 Petition petition
});


$PetitionCopyWith<$Res> get petition;

}
/// @nodoc
class __$ChangeStatusCopyWithImpl<$Res>
    implements _$ChangeStatusCopyWith<$Res> {
  __$ChangeStatusCopyWithImpl(this._self, this._then);

  final _ChangeStatus _self;
  final $Res Function(_ChangeStatus) _then;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petition = null,}) {
  return _then(_ChangeStatus(
petition: null == petition ? _self.petition : petition // ignore: cast_nullable_to_non_nullable
as Petition,
  ));
}

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetitionCopyWith<$Res> get petition {
  
  return $PetitionCopyWith<$Res>(_self.petition, (value) {
    return _then(_self.copyWith(petition: value));
  });
}
}

/// @nodoc


class _Supported implements PetitionDetailEvent {
  const _Supported({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportedCopyWith<_Supported> get copyWith => __$SupportedCopyWithImpl<_Supported>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Supported&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'PetitionDetailEvent.supported(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$SupportedCopyWith<$Res> implements $PetitionDetailEventCopyWith<$Res> {
  factory _$SupportedCopyWith(_Supported value, $Res Function(_Supported) _then) = __$SupportedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$SupportedCopyWithImpl<$Res>
    implements _$SupportedCopyWith<$Res> {
  __$SupportedCopyWithImpl(this._self, this._then);

  final _Supported _self;
  final $Res Function(_Supported) _then;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Supported(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _Unsubscribe implements PetitionDetailEvent {
  const _Unsubscribe({required this.petition});
  

 final  Petition petition;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnsubscribeCopyWith<_Unsubscribe> get copyWith => __$UnsubscribeCopyWithImpl<_Unsubscribe>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unsubscribe&&(identical(other.petition, petition) || other.petition == petition));
}


@override
int get hashCode => Object.hash(runtimeType,petition);

@override
String toString() {
  return 'PetitionDetailEvent.unsubscribe(petition: $petition)';
}


}

/// @nodoc
abstract mixin class _$UnsubscribeCopyWith<$Res> implements $PetitionDetailEventCopyWith<$Res> {
  factory _$UnsubscribeCopyWith(_Unsubscribe value, $Res Function(_Unsubscribe) _then) = __$UnsubscribeCopyWithImpl;
@useResult
$Res call({
 Petition petition
});


$PetitionCopyWith<$Res> get petition;

}
/// @nodoc
class __$UnsubscribeCopyWithImpl<$Res>
    implements _$UnsubscribeCopyWith<$Res> {
  __$UnsubscribeCopyWithImpl(this._self, this._then);

  final _Unsubscribe _self;
  final $Res Function(_Unsubscribe) _then;

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? petition = null,}) {
  return _then(_Unsubscribe(
petition: null == petition ? _self.petition : petition // ignore: cast_nullable_to_non_nullable
as Petition,
  ));
}

/// Create a copy of PetitionDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetitionCopyWith<$Res> get petition {
  
  return $PetitionCopyWith<$Res>(_self.petition, (value) {
    return _then(_self.copyWith(petition: value));
  });
}
}

// dart format on
