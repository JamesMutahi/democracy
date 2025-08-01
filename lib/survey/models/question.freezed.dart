// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Question {

 int get id; int get survey; int get page; int get number;@QuestionTypeConverter() QuestionType get type; String get text; String? get hint;@JsonKey(name: 'is_required') bool get isRequired; int? get dependency; List<Choice> get choices;
/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionCopyWith<Question> get copyWith => _$QuestionCopyWithImpl<Question>(this as Question, _$identity);

  /// Serializes this Question to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Question&&(identical(other.id, id) || other.id == id)&&(identical(other.survey, survey) || other.survey == survey)&&(identical(other.page, page) || other.page == page)&&(identical(other.number, number) || other.number == number)&&(identical(other.type, type) || other.type == type)&&(identical(other.text, text) || other.text == text)&&(identical(other.hint, hint) || other.hint == hint)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.dependency, dependency) || other.dependency == dependency)&&const DeepCollectionEquality().equals(other.choices, choices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,survey,page,number,type,text,hint,isRequired,dependency,const DeepCollectionEquality().hash(choices));

@override
String toString() {
  return 'Question(id: $id, survey: $survey, page: $page, number: $number, type: $type, text: $text, hint: $hint, isRequired: $isRequired, dependency: $dependency, choices: $choices)';
}


}

/// @nodoc
abstract mixin class $QuestionCopyWith<$Res>  {
  factory $QuestionCopyWith(Question value, $Res Function(Question) _then) = _$QuestionCopyWithImpl;
@useResult
$Res call({
 int id, int survey, int page, int number,@QuestionTypeConverter() QuestionType type, String text, String? hint,@JsonKey(name: 'is_required') bool isRequired, int? dependency, List<Choice> choices
});




}
/// @nodoc
class _$QuestionCopyWithImpl<$Res>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._self, this._then);

  final Question _self;
  final $Res Function(Question) _then;

/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? survey = null,Object? page = null,Object? number = null,Object? type = null,Object? text = null,Object? hint = freezed,Object? isRequired = null,Object? dependency = freezed,Object? choices = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,survey: null == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as QuestionType,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,hint: freezed == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String?,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,dependency: freezed == dependency ? _self.dependency : dependency // ignore: cast_nullable_to_non_nullable
as int?,choices: null == choices ? _self.choices : choices // ignore: cast_nullable_to_non_nullable
as List<Choice>,
  ));
}

}


/// Adds pattern-matching-related methods to [Question].
extension QuestionPatterns on Question {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Question value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Question() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Question value)  $default,){
final _that = this;
switch (_that) {
case _Question():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Question value)?  $default,){
final _that = this;
switch (_that) {
case _Question() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int survey,  int page,  int number, @QuestionTypeConverter()  QuestionType type,  String text,  String? hint, @JsonKey(name: 'is_required')  bool isRequired,  int? dependency,  List<Choice> choices)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Question() when $default != null:
return $default(_that.id,_that.survey,_that.page,_that.number,_that.type,_that.text,_that.hint,_that.isRequired,_that.dependency,_that.choices);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int survey,  int page,  int number, @QuestionTypeConverter()  QuestionType type,  String text,  String? hint, @JsonKey(name: 'is_required')  bool isRequired,  int? dependency,  List<Choice> choices)  $default,) {final _that = this;
switch (_that) {
case _Question():
return $default(_that.id,_that.survey,_that.page,_that.number,_that.type,_that.text,_that.hint,_that.isRequired,_that.dependency,_that.choices);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int survey,  int page,  int number, @QuestionTypeConverter()  QuestionType type,  String text,  String? hint, @JsonKey(name: 'is_required')  bool isRequired,  int? dependency,  List<Choice> choices)?  $default,) {final _that = this;
switch (_that) {
case _Question() when $default != null:
return $default(_that.id,_that.survey,_that.page,_that.number,_that.type,_that.text,_that.hint,_that.isRequired,_that.dependency,_that.choices);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Question implements Question {
  const _Question({required this.id, required this.survey, required this.page, required this.number, @QuestionTypeConverter() required this.type, required this.text, required this.hint, @JsonKey(name: 'is_required') required this.isRequired, required this.dependency, required final  List<Choice> choices}): _choices = choices;
  factory _Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

@override final  int id;
@override final  int survey;
@override final  int page;
@override final  int number;
@override@QuestionTypeConverter() final  QuestionType type;
@override final  String text;
@override final  String? hint;
@override@JsonKey(name: 'is_required') final  bool isRequired;
@override final  int? dependency;
 final  List<Choice> _choices;
@override List<Choice> get choices {
  if (_choices is EqualUnmodifiableListView) return _choices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_choices);
}


/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionCopyWith<_Question> get copyWith => __$QuestionCopyWithImpl<_Question>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Question&&(identical(other.id, id) || other.id == id)&&(identical(other.survey, survey) || other.survey == survey)&&(identical(other.page, page) || other.page == page)&&(identical(other.number, number) || other.number == number)&&(identical(other.type, type) || other.type == type)&&(identical(other.text, text) || other.text == text)&&(identical(other.hint, hint) || other.hint == hint)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.dependency, dependency) || other.dependency == dependency)&&const DeepCollectionEquality().equals(other._choices, _choices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,survey,page,number,type,text,hint,isRequired,dependency,const DeepCollectionEquality().hash(_choices));

@override
String toString() {
  return 'Question(id: $id, survey: $survey, page: $page, number: $number, type: $type, text: $text, hint: $hint, isRequired: $isRequired, dependency: $dependency, choices: $choices)';
}


}

/// @nodoc
abstract mixin class _$QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$QuestionCopyWith(_Question value, $Res Function(_Question) _then) = __$QuestionCopyWithImpl;
@override @useResult
$Res call({
 int id, int survey, int page, int number,@QuestionTypeConverter() QuestionType type, String text, String? hint,@JsonKey(name: 'is_required') bool isRequired, int? dependency, List<Choice> choices
});




}
/// @nodoc
class __$QuestionCopyWithImpl<$Res>
    implements _$QuestionCopyWith<$Res> {
  __$QuestionCopyWithImpl(this._self, this._then);

  final _Question _self;
  final $Res Function(_Question) _then;

/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? survey = null,Object? page = null,Object? number = null,Object? type = null,Object? text = null,Object? hint = freezed,Object? isRequired = null,Object? dependency = freezed,Object? choices = null,}) {
  return _then(_Question(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,survey: null == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as QuestionType,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,hint: freezed == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String?,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,dependency: freezed == dependency ? _self.dependency : dependency // ignore: cast_nullable_to_non_nullable
as int?,choices: null == choices ? _self._choices : choices // ignore: cast_nullable_to_non_nullable
as List<Choice>,
  ));
}


}

// dart format on
