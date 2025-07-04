// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TextAnswer {

 Question get question; String get text;
/// Create a copy of TextAnswer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextAnswerCopyWith<TextAnswer> get copyWith => _$TextAnswerCopyWithImpl<TextAnswer>(this as TextAnswer, _$identity);

  /// Serializes this TextAnswer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextAnswer&&(identical(other.question, question) || other.question == question)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,question,text);

@override
String toString() {
  return 'TextAnswer(question: $question, text: $text)';
}


}

/// @nodoc
abstract mixin class $TextAnswerCopyWith<$Res>  {
  factory $TextAnswerCopyWith(TextAnswer value, $Res Function(TextAnswer) _then) = _$TextAnswerCopyWithImpl;
@useResult
$Res call({
 Question question, String text
});


$QuestionCopyWith<$Res> get question;

}
/// @nodoc
class _$TextAnswerCopyWithImpl<$Res>
    implements $TextAnswerCopyWith<$Res> {
  _$TextAnswerCopyWithImpl(this._self, this._then);

  final TextAnswer _self;
  final $Res Function(TextAnswer) _then;

/// Create a copy of TextAnswer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? question = null,Object? text = null,}) {
  return _then(_self.copyWith(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as Question,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of TextAnswer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuestionCopyWith<$Res> get question {
  
  return $QuestionCopyWith<$Res>(_self.question, (value) {
    return _then(_self.copyWith(question: value));
  });
}
}


/// Adds pattern-matching-related methods to [TextAnswer].
extension TextAnswerPatterns on TextAnswer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TextAnswer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TextAnswer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TextAnswer value)  $default,){
final _that = this;
switch (_that) {
case _TextAnswer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TextAnswer value)?  $default,){
final _that = this;
switch (_that) {
case _TextAnswer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Question question,  String text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TextAnswer() when $default != null:
return $default(_that.question,_that.text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Question question,  String text)  $default,) {final _that = this;
switch (_that) {
case _TextAnswer():
return $default(_that.question,_that.text);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Question question,  String text)?  $default,) {final _that = this;
switch (_that) {
case _TextAnswer() when $default != null:
return $default(_that.question,_that.text);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TextAnswer implements TextAnswer {
  const _TextAnswer({required this.question, required this.text});
  factory _TextAnswer.fromJson(Map<String, dynamic> json) => _$TextAnswerFromJson(json);

@override final  Question question;
@override final  String text;

/// Create a copy of TextAnswer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TextAnswerCopyWith<_TextAnswer> get copyWith => __$TextAnswerCopyWithImpl<_TextAnswer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TextAnswerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TextAnswer&&(identical(other.question, question) || other.question == question)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,question,text);

@override
String toString() {
  return 'TextAnswer(question: $question, text: $text)';
}


}

/// @nodoc
abstract mixin class _$TextAnswerCopyWith<$Res> implements $TextAnswerCopyWith<$Res> {
  factory _$TextAnswerCopyWith(_TextAnswer value, $Res Function(_TextAnswer) _then) = __$TextAnswerCopyWithImpl;
@override @useResult
$Res call({
 Question question, String text
});


@override $QuestionCopyWith<$Res> get question;

}
/// @nodoc
class __$TextAnswerCopyWithImpl<$Res>
    implements _$TextAnswerCopyWith<$Res> {
  __$TextAnswerCopyWithImpl(this._self, this._then);

  final _TextAnswer _self;
  final $Res Function(_TextAnswer) _then;

/// Create a copy of TextAnswer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? question = null,Object? text = null,}) {
  return _then(_TextAnswer(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as Question,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of TextAnswer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuestionCopyWith<$Res> get question {
  
  return $QuestionCopyWith<$Res>(_self.question, (value) {
    return _then(_self.copyWith(question: value));
  });
}
}

// dart format on
