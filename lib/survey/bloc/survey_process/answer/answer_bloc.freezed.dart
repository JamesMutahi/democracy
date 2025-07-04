// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnswerEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnswerEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnswerEvent()';
}


}

/// @nodoc
class $AnswerEventCopyWith<$Res>  {
$AnswerEventCopyWith(AnswerEvent _, $Res Function(AnswerEvent) __);
}


/// @nodoc


class _Started implements AnswerEvent {
  const _Started({required this.survey});
  

 final  Survey survey;

/// Create a copy of AnswerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartedCopyWith<_Started> get copyWith => __$StartedCopyWithImpl<_Started>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started&&(identical(other.survey, survey) || other.survey == survey));
}


@override
int get hashCode => Object.hash(runtimeType,survey);

@override
String toString() {
  return 'AnswerEvent.started(survey: $survey)';
}


}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res> implements $AnswerEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) = __$StartedCopyWithImpl;
@useResult
$Res call({
 Survey survey
});


$SurveyCopyWith<$Res> get survey;

}
/// @nodoc
class __$StartedCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

/// Create a copy of AnswerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? survey = null,}) {
  return _then(_Started(
survey: null == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as Survey,
  ));
}

/// Create a copy of AnswerEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SurveyCopyWith<$Res> get survey {
  
  return $SurveyCopyWith<$Res>(_self.survey, (value) {
    return _then(_self.copyWith(survey: value));
  });
}
}

/// @nodoc


class _TextAnswerAdded implements AnswerEvent {
  const _TextAnswerAdded({required this.question, required this.text});
  

 final  Question question;
 final  String text;

/// Create a copy of AnswerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TextAnswerAddedCopyWith<_TextAnswerAdded> get copyWith => __$TextAnswerAddedCopyWithImpl<_TextAnswerAdded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TextAnswerAdded&&(identical(other.question, question) || other.question == question)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,question,text);

@override
String toString() {
  return 'AnswerEvent.textAnswerAdded(question: $question, text: $text)';
}


}

/// @nodoc
abstract mixin class _$TextAnswerAddedCopyWith<$Res> implements $AnswerEventCopyWith<$Res> {
  factory _$TextAnswerAddedCopyWith(_TextAnswerAdded value, $Res Function(_TextAnswerAdded) _then) = __$TextAnswerAddedCopyWithImpl;
@useResult
$Res call({
 Question question, String text
});


$QuestionCopyWith<$Res> get question;

}
/// @nodoc
class __$TextAnswerAddedCopyWithImpl<$Res>
    implements _$TextAnswerAddedCopyWith<$Res> {
  __$TextAnswerAddedCopyWithImpl(this._self, this._then);

  final _TextAnswerAdded _self;
  final $Res Function(_TextAnswerAdded) _then;

/// Create a copy of AnswerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? question = null,Object? text = null,}) {
  return _then(_TextAnswerAdded(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as Question,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of AnswerEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuestionCopyWith<$Res> get question {
  
  return $QuestionCopyWith<$Res>(_self.question, (value) {
    return _then(_self.copyWith(question: value));
  });
}
}

/// @nodoc


class _SingleChoiceAnswerAdded implements AnswerEvent {
  const _SingleChoiceAnswerAdded({required this.question, required this.choice});
  

 final  Question question;
 final  Choice choice;

/// Create a copy of AnswerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SingleChoiceAnswerAddedCopyWith<_SingleChoiceAnswerAdded> get copyWith => __$SingleChoiceAnswerAddedCopyWithImpl<_SingleChoiceAnswerAdded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SingleChoiceAnswerAdded&&(identical(other.question, question) || other.question == question)&&(identical(other.choice, choice) || other.choice == choice));
}


@override
int get hashCode => Object.hash(runtimeType,question,choice);

@override
String toString() {
  return 'AnswerEvent.singleChoiceAnswerAdded(question: $question, choice: $choice)';
}


}

/// @nodoc
abstract mixin class _$SingleChoiceAnswerAddedCopyWith<$Res> implements $AnswerEventCopyWith<$Res> {
  factory _$SingleChoiceAnswerAddedCopyWith(_SingleChoiceAnswerAdded value, $Res Function(_SingleChoiceAnswerAdded) _then) = __$SingleChoiceAnswerAddedCopyWithImpl;
@useResult
$Res call({
 Question question, Choice choice
});


$QuestionCopyWith<$Res> get question;$ChoiceCopyWith<$Res> get choice;

}
/// @nodoc
class __$SingleChoiceAnswerAddedCopyWithImpl<$Res>
    implements _$SingleChoiceAnswerAddedCopyWith<$Res> {
  __$SingleChoiceAnswerAddedCopyWithImpl(this._self, this._then);

  final _SingleChoiceAnswerAdded _self;
  final $Res Function(_SingleChoiceAnswerAdded) _then;

/// Create a copy of AnswerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? question = null,Object? choice = null,}) {
  return _then(_SingleChoiceAnswerAdded(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as Question,choice: null == choice ? _self.choice : choice // ignore: cast_nullable_to_non_nullable
as Choice,
  ));
}

/// Create a copy of AnswerEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuestionCopyWith<$Res> get question {
  
  return $QuestionCopyWith<$Res>(_self.question, (value) {
    return _then(_self.copyWith(question: value));
  });
}/// Create a copy of AnswerEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChoiceCopyWith<$Res> get choice {
  
  return $ChoiceCopyWith<$Res>(_self.choice, (value) {
    return _then(_self.copyWith(choice: value));
  });
}
}

/// @nodoc


class _MultipleChoiceAnswerAdded implements AnswerEvent {
  const _MultipleChoiceAnswerAdded({required this.question, required final  List<Choice> choices}): _choices = choices;
  

 final  Question question;
 final  List<Choice> _choices;
 List<Choice> get choices {
  if (_choices is EqualUnmodifiableListView) return _choices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_choices);
}


/// Create a copy of AnswerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MultipleChoiceAnswerAddedCopyWith<_MultipleChoiceAnswerAdded> get copyWith => __$MultipleChoiceAnswerAddedCopyWithImpl<_MultipleChoiceAnswerAdded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MultipleChoiceAnswerAdded&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other._choices, _choices));
}


@override
int get hashCode => Object.hash(runtimeType,question,const DeepCollectionEquality().hash(_choices));

@override
String toString() {
  return 'AnswerEvent.multipleChoiceAnswerAdded(question: $question, choices: $choices)';
}


}

/// @nodoc
abstract mixin class _$MultipleChoiceAnswerAddedCopyWith<$Res> implements $AnswerEventCopyWith<$Res> {
  factory _$MultipleChoiceAnswerAddedCopyWith(_MultipleChoiceAnswerAdded value, $Res Function(_MultipleChoiceAnswerAdded) _then) = __$MultipleChoiceAnswerAddedCopyWithImpl;
@useResult
$Res call({
 Question question, List<Choice> choices
});


$QuestionCopyWith<$Res> get question;

}
/// @nodoc
class __$MultipleChoiceAnswerAddedCopyWithImpl<$Res>
    implements _$MultipleChoiceAnswerAddedCopyWith<$Res> {
  __$MultipleChoiceAnswerAddedCopyWithImpl(this._self, this._then);

  final _MultipleChoiceAnswerAdded _self;
  final $Res Function(_MultipleChoiceAnswerAdded) _then;

/// Create a copy of AnswerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? question = null,Object? choices = null,}) {
  return _then(_MultipleChoiceAnswerAdded(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as Question,choices: null == choices ? _self._choices : choices // ignore: cast_nullable_to_non_nullable
as List<Choice>,
  ));
}

/// Create a copy of AnswerEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuestionCopyWith<$Res> get question {
  
  return $QuestionCopyWith<$Res>(_self.question, (value) {
    return _then(_self.copyWith(question: value));
  });
}
}

/// @nodoc


class _Validate implements AnswerEvent {
  const _Validate({required final  List<Question> questions}): _questions = questions;
  

 final  List<Question> _questions;
 List<Question> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}


/// Create a copy of AnswerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidateCopyWith<_Validate> get copyWith => __$ValidateCopyWithImpl<_Validate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Validate&&const DeepCollectionEquality().equals(other._questions, _questions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_questions));

@override
String toString() {
  return 'AnswerEvent.validate(questions: $questions)';
}


}

/// @nodoc
abstract mixin class _$ValidateCopyWith<$Res> implements $AnswerEventCopyWith<$Res> {
  factory _$ValidateCopyWith(_Validate value, $Res Function(_Validate) _then) = __$ValidateCopyWithImpl;
@useResult
$Res call({
 List<Question> questions
});




}
/// @nodoc
class __$ValidateCopyWithImpl<$Res>
    implements _$ValidateCopyWith<$Res> {
  __$ValidateCopyWithImpl(this._self, this._then);

  final _Validate _self;
  final $Res Function(_Validate) _then;

/// Create a copy of AnswerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? questions = null,}) {
  return _then(_Validate(
questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<Question>,
  ));
}


}

/// @nodoc


class _Submitted implements AnswerEvent {
  const _Submitted({required final  Map<String, dynamic> payload}): _payload = payload;
  

 final  Map<String, dynamic> _payload;
 Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of AnswerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmittedCopyWith<_Submitted> get copyWith => __$SubmittedCopyWithImpl<_Submitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Submitted&&const DeepCollectionEquality().equals(other._payload, _payload));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'AnswerEvent.submitted(payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$SubmittedCopyWith<$Res> implements $AnswerEventCopyWith<$Res> {
  factory _$SubmittedCopyWith(_Submitted value, $Res Function(_Submitted) _then) = __$SubmittedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> payload
});




}
/// @nodoc
class __$SubmittedCopyWithImpl<$Res>
    implements _$SubmittedCopyWith<$Res> {
  __$SubmittedCopyWithImpl(this._self, this._then);

  final _Submitted _self;
  final $Res Function(_Submitted) _then;

/// Create a copy of AnswerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? payload = null,}) {
  return _then(_Submitted(
payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
