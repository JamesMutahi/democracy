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

 int get id; String get name; String get description;@JsonKey(name: 'start_time') DateTime get startTime;@JsonKey(name: 'end_time') DateTime get endTime; List<Question> get questions; Response? get response;
/// Create a copy of Survey
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SurveyCopyWith<Survey> get copyWith => _$SurveyCopyWithImpl<Survey>(this as Survey, _$identity);

  /// Serializes this Survey to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Survey&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&const DeepCollectionEquality().equals(other.questions, questions)&&(identical(other.response, response) || other.response == response));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,startTime,endTime,const DeepCollectionEquality().hash(questions),response);

@override
String toString() {
  return 'Survey(id: $id, name: $name, description: $description, startTime: $startTime, endTime: $endTime, questions: $questions, response: $response)';
}


}

/// @nodoc
abstract mixin class $SurveyCopyWith<$Res>  {
  factory $SurveyCopyWith(Survey value, $Res Function(Survey) _then) = _$SurveyCopyWithImpl;
@useResult
$Res call({
 int id, String name, String description,@JsonKey(name: 'start_time') DateTime startTime,@JsonKey(name: 'end_time') DateTime endTime, List<Question> questions, Response? response
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? startTime = null,Object? endTime = null,Object? questions = null,Object? response = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<Question>,response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as Response?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String description, @JsonKey(name: 'start_time')  DateTime startTime, @JsonKey(name: 'end_time')  DateTime endTime,  List<Question> questions,  Response? response)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Survey() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.startTime,_that.endTime,_that.questions,_that.response);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String description, @JsonKey(name: 'start_time')  DateTime startTime, @JsonKey(name: 'end_time')  DateTime endTime,  List<Question> questions,  Response? response)  $default,) {final _that = this;
switch (_that) {
case _Survey():
return $default(_that.id,_that.name,_that.description,_that.startTime,_that.endTime,_that.questions,_that.response);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String description, @JsonKey(name: 'start_time')  DateTime startTime, @JsonKey(name: 'end_time')  DateTime endTime,  List<Question> questions,  Response? response)?  $default,) {final _that = this;
switch (_that) {
case _Survey() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.startTime,_that.endTime,_that.questions,_that.response);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Survey implements Survey {
  const _Survey({required this.id, required this.name, required this.description, @JsonKey(name: 'start_time') required this.startTime, @JsonKey(name: 'end_time') required this.endTime, required final  List<Question> questions, required this.response}): _questions = questions;
  factory _Survey.fromJson(Map<String, dynamic> json) => _$SurveyFromJson(json);

@override final  int id;
@override final  String name;
@override final  String description;
@override@JsonKey(name: 'start_time') final  DateTime startTime;
@override@JsonKey(name: 'end_time') final  DateTime endTime;
 final  List<Question> _questions;
@override List<Question> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

@override final  Response? response;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Survey&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&const DeepCollectionEquality().equals(other._questions, _questions)&&(identical(other.response, response) || other.response == response));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,startTime,endTime,const DeepCollectionEquality().hash(_questions),response);

@override
String toString() {
  return 'Survey(id: $id, name: $name, description: $description, startTime: $startTime, endTime: $endTime, questions: $questions, response: $response)';
}


}

/// @nodoc
abstract mixin class _$SurveyCopyWith<$Res> implements $SurveyCopyWith<$Res> {
  factory _$SurveyCopyWith(_Survey value, $Res Function(_Survey) _then) = __$SurveyCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String description,@JsonKey(name: 'start_time') DateTime startTime,@JsonKey(name: 'end_time') DateTime endTime, List<Question> questions, Response? response
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? startTime = null,Object? endTime = null,Object? questions = null,Object? response = freezed,}) {
  return _then(_Survey(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<Question>,response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as Response?,
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
