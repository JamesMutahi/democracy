// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Survey {

 int get id; String get title; String get description;@JsonKey(name: 'start_time') DateTime get startTime;@JsonKey(name: 'end_time') DateTime get endTime;@JsonKey(name: 'is_active') bool get isActive; List<Page> get pages; Response? get response;@JsonKey(name: 'total_responses') int get totalResponses;
/// Create a copy of Survey
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SurveyCopyWith<Survey> get copyWith => _$SurveyCopyWithImpl<Survey>(this as Survey, _$identity);

  /// Serializes this Survey to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Survey&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other.pages, pages)&&(identical(other.response, response) || other.response == response)&&(identical(other.totalResponses, totalResponses) || other.totalResponses == totalResponses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startTime,endTime,isActive,const DeepCollectionEquality().hash(pages),response,totalResponses);

@override
String toString() {
  return 'Survey(id: $id, title: $title, description: $description, startTime: $startTime, endTime: $endTime, isActive: $isActive, pages: $pages, response: $response, totalResponses: $totalResponses)';
}


}

/// @nodoc
abstract mixin class $SurveyCopyWith<$Res>  {
  factory $SurveyCopyWith(Survey value, $Res Function(Survey) _then) = _$SurveyCopyWithImpl;
@useResult
$Res call({
 int id, String title, String description,@JsonKey(name: 'start_time') DateTime startTime,@JsonKey(name: 'end_time') DateTime endTime,@JsonKey(name: 'is_active') bool isActive, List<Page> pages, Response? response,@JsonKey(name: 'total_responses') int totalResponses
});


$ResponseCopyWith<$Res>? get response;

}
/// @nodoc
class _$SurveyCopyWithImpl<$Res>
    implements $SurveyCopyWith<$Res> {
  _$SurveyCopyWithImpl(this._self, this._then);

  final Survey _self;
  final $Res Function(Survey) _then;

/// Create a copy of Survey
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startTime = null,Object? endTime = null,Object? isActive = null,Object? pages = null,Object? response = freezed,Object? totalResponses = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as List<Page>,response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as Response?,totalResponses: null == totalResponses ? _self.totalResponses : totalResponses // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of Survey
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResponseCopyWith<$Res>? get response {
    if (_self.response == null) {
    return null;
  }

  return $ResponseCopyWith<$Res>(_self.response!, (value) {
    return _then(_self.copyWith(response: value));
  });
}
}


/// Adds pattern-matching-related methods to [Survey].
extension SurveyPatterns on Survey {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Survey value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Survey() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Survey value)  $default,){
final _that = this;
switch (_that) {
case _Survey():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Survey value)?  $default,){
final _that = this;
switch (_that) {
case _Survey() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String description, @JsonKey(name: 'start_time')  DateTime startTime, @JsonKey(name: 'end_time')  DateTime endTime, @JsonKey(name: 'is_active')  bool isActive,  List<Page> pages,  Response? response, @JsonKey(name: 'total_responses')  int totalResponses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Survey() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startTime,_that.endTime,_that.isActive,_that.pages,_that.response,_that.totalResponses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String description, @JsonKey(name: 'start_time')  DateTime startTime, @JsonKey(name: 'end_time')  DateTime endTime, @JsonKey(name: 'is_active')  bool isActive,  List<Page> pages,  Response? response, @JsonKey(name: 'total_responses')  int totalResponses)  $default,) {final _that = this;
switch (_that) {
case _Survey():
return $default(_that.id,_that.title,_that.description,_that.startTime,_that.endTime,_that.isActive,_that.pages,_that.response,_that.totalResponses);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String description, @JsonKey(name: 'start_time')  DateTime startTime, @JsonKey(name: 'end_time')  DateTime endTime, @JsonKey(name: 'is_active')  bool isActive,  List<Page> pages,  Response? response, @JsonKey(name: 'total_responses')  int totalResponses)?  $default,) {final _that = this;
switch (_that) {
case _Survey() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startTime,_that.endTime,_that.isActive,_that.pages,_that.response,_that.totalResponses);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Survey implements Survey {
  const _Survey({required this.id, required this.title, required this.description, @JsonKey(name: 'start_time') required this.startTime, @JsonKey(name: 'end_time') required this.endTime, @JsonKey(name: 'is_active') required this.isActive, required final  List<Page> pages, required this.response, @JsonKey(name: 'total_responses') required this.totalResponses}): _pages = pages;
  factory _Survey.fromJson(Map<String, dynamic> json) => _$SurveyFromJson(json);

@override final  int id;
@override final  String title;
@override final  String description;
@override@JsonKey(name: 'start_time') final  DateTime startTime;
@override@JsonKey(name: 'end_time') final  DateTime endTime;
@override@JsonKey(name: 'is_active') final  bool isActive;
 final  List<Page> _pages;
@override List<Page> get pages {
  if (_pages is EqualUnmodifiableListView) return _pages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pages);
}

@override final  Response? response;
@override@JsonKey(name: 'total_responses') final  int totalResponses;

/// Create a copy of Survey
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SurveyCopyWith<_Survey> get copyWith => __$SurveyCopyWithImpl<_Survey>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SurveyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Survey&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other._pages, _pages)&&(identical(other.response, response) || other.response == response)&&(identical(other.totalResponses, totalResponses) || other.totalResponses == totalResponses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startTime,endTime,isActive,const DeepCollectionEquality().hash(_pages),response,totalResponses);

@override
String toString() {
  return 'Survey(id: $id, title: $title, description: $description, startTime: $startTime, endTime: $endTime, isActive: $isActive, pages: $pages, response: $response, totalResponses: $totalResponses)';
}


}

/// @nodoc
abstract mixin class _$SurveyCopyWith<$Res> implements $SurveyCopyWith<$Res> {
  factory _$SurveyCopyWith(_Survey value, $Res Function(_Survey) _then) = __$SurveyCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String description,@JsonKey(name: 'start_time') DateTime startTime,@JsonKey(name: 'end_time') DateTime endTime,@JsonKey(name: 'is_active') bool isActive, List<Page> pages, Response? response,@JsonKey(name: 'total_responses') int totalResponses
});


@override $ResponseCopyWith<$Res>? get response;

}
/// @nodoc
class __$SurveyCopyWithImpl<$Res>
    implements _$SurveyCopyWith<$Res> {
  __$SurveyCopyWithImpl(this._self, this._then);

  final _Survey _self;
  final $Res Function(_Survey) _then;

/// Create a copy of Survey
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startTime = null,Object? endTime = null,Object? isActive = null,Object? pages = null,Object? response = freezed,Object? totalResponses = null,}) {
  return _then(_Survey(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,pages: null == pages ? _self._pages : pages // ignore: cast_nullable_to_non_nullable
as List<Page>,response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as Response?,totalResponses: null == totalResponses ? _self.totalResponses : totalResponses // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of Survey
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResponseCopyWith<$Res>? get response {
    if (_self.response == null) {
    return null;
  }

  return $ResponseCopyWith<$Res>(_self.response!, (value) {
    return _then(_self.copyWith(response: value));
  });
}
}

// dart format on
